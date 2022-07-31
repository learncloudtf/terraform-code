resource "aws_dlm_lifecycle_policy" "test_lifecyclerole" {
  description        = "DLM lifecycle policy"
  execution_role_arn = "arn:aws:iam::922605147243:role/service-role/AWSDataLifecycleManagerDefaultRole"
  state              = "ENABLED"
  tags = {
    "Name" = "Nets_oa_Backup_policy"
    }

  policy_details {
    resource_types = ["INSTANCE"]

    schedule {
      name = "1 weeks of daily snapshots"

      create_rule {
        interval      = 24
        interval_unit = "HOURS"
        times         = ["14:00"]
      }

      retain_rule {
        count = 7
      }

      tags_to_add = {
        SnapshotCreator = "DLM"
      }

      copy_tags = true
    }

    target_tags = {
      Backup = "Yes"
    }
  }
}