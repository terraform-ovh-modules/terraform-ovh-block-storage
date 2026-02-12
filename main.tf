# ========================================
# Locals for Computed Values
# ========================================

locals {
  # Merge user tags with default tags
  final_tags = merge(
    {
      managed_by = "terraform"
      module     = "terraform-ovh-block-storage"
    },
    var.tags
  )

  # Merge user metadata with default metadata
  final_metadata = merge(
    {
      managed_by = "terraform"
    },
    var.metadata
  )

  # Convert tags to OpenStack format (list of "key=value" strings)
  openstack_tags = [for k, v in local.final_tags : "${k}=${v}"]
}

# ========================================
# Block Storage Volume
# ========================================

resource "openstack_blockstorage_volume_v3" "volume" {
  name        = var.name
  description = var.description
  size        = var.size
  region      = var.region

  # Volume type
  volume_type = var.volume_type

  # Availability zone
  availability_zone = var.availability_zone != "" ? var.availability_zone : null

  # Source configurations (mutually exclusive)
  image_id      = var.image_id != "" ? var.image_id : null
  snapshot_id   = var.snapshot_id != "" ? var.snapshot_id : null
  source_vol_id = var.source_vol_id != "" ? var.source_vol_id : null

  # Metadata
  metadata = local.final_metadata

  lifecycle {
    precondition {
      condition = (
        (var.image_id != "" ? 1 : 0) +
        (var.snapshot_id != "" ? 1 : 0) +
        (var.source_vol_id != "" ? 1 : 0)
      ) <= 1
      error_message = "Only one of image_id, snapshot_id, or source_vol_id can be specified."
    }
  }
}
