import os
import sys
import boto3
import datetime
import time
from time import mktime
from datetime import date

tag_key = os.environ['TAG_KEY']
tag_value = os.environ['TAG_VALUE']
retention = os.environ['RETENTION']
signature = os.environ['SIGNATURE']


def __create_connection():
    client = boto3.client('ec2')
    return client


def GetAMIName(InstanceName):
    current_datetime = datetime.datetime.now()
    date_stamp = current_datetime.strftime("%Y-%m-%d_%H-%M-%S")
    ami_name = InstanceName + signature + date_stamp
    return ami_name


def CreateImage():
  client = __create_connection()
  response = client.describe_instances(Filters = [{'Name': 'instance-state-name', 'Values': ['running', 'stopped']},{'Name': 'tag:'+tag_key, 'Values' : [tag_value]}])
  for reservation in response["Reservations"]:
      for instance in reservation["Instances"]:
          Instance_Id = instance["InstanceId"]
          InstanceName = ""
          for tag in instance["Tags"]:
            if Instance_Id and tag["Key"].lower() == "name":
                InstanceName = tag["Value"]
          if Instance_Id:
              Instance_Name =  GetAMIName(InstanceName)
              image = client.create_image(NoReboot = True, Name = Instance_Name, InstanceId = Instance_Id, Description='Created by AMI Backup')
              print(image)
              addtag = client.create_tags(Resources=[image["ImageId"]],Tags=[{'Key': 'Name','Value': Instance_Name}])
  return 0


def DeleteImage():
    client = __create_connection()
    response_image = client.describe_images(Filters = [{'Name': 'name', 'Values': ['*'+signature+'*']}, {'Name': 'state', 'Values': ['available'] }])
    #print "response_image is: ", response_image
    for image in response_image["Images"]:
        # get Image ID
        Image_Id = image["ImageId"]
        ImageName = image["Name"]
        print("ImageName is:" ImageName)

        # collect Snapshot ID
        try:
            Snapshot_Id = []
            for snapshots in image["BlockDeviceMappings"]:
                Snapshot_Id.append(snapshots["Ebs"]["SnapshotId"])

            print("List of Snapshot ID" Snapshot_Id)

        except Exception as exception:
            print("The storage type is ephemeral storage", str(exception))

        CurrentDatetime = datetime.datetime.now()
        ImageStamp = ImageName.split(signature)[1]
        ImageTimestamp = mktime(time.strptime(ImageStamp, "%Y-%m-%d_%H-%M-%S"))
        CurrentTimestamp = mktime(CurrentDatetime.timetuple())
        DiffMinutes = (CurrentTimestamp - ImageTimestamp) / 60
        if DiffMinutes > int(retention):
            try:
                print("Image is getting deregistered: "Image_Id)
                client.deregister_image(ImageId = Image_Id)
                print(ImageName" deregistered")
            except:
                print("Exception occured deregistering image: "Image_Id)
            for snapshotid in Snapshot_Id:
                try:
                    client.delete_snapshot(SnapshotId = snapshotid)
                    print(snapshotid "deleted")
                except:
                    print("Exception occured deleting snapshot: "snapshotid)
        else:
            print("Image " + Image_Id + " has not crossed the retention period")

    return 0

def lambda_handler(event, context):
    print "================Creating New AMIs================"
    CreateImage()
    print "================Deleteing old AMIs================"
    DeleteImage()
    return 0
