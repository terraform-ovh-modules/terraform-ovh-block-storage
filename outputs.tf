# ========================================
# Volume Outputs
# ========================================

output "volume_id" {
  description = "The ID of the created block storage volume. Use this to attach the volume to instances."
  value       = openstack_blockstorage_volume_v3.volume.id
}

output "volume_name" {
  description = "The name of the created block storage volume"
  value       = openstack_blockstorage_volume_v3.volume.name
}

output "volume_size" {
  description = "The size of the volume in GB"
  value       = openstack_blockstorage_volume_v3.volume.size
}

output "volume_type" {
  description = "The type of the volume (classic or high-speed)"
  value       = openstack_blockstorage_volume_v3.volume.volume_type
}

output "volume_region" {
  description = "The region where the volume is deployed"
  value       = openstack_blockstorage_volume_v3.volume.region
}

output "volume_availability_zone" {
  description = "The availability zone where the volume is deployed"
  value       = openstack_blockstorage_volume_v3.volume.availability_zone
}

# ========================================
# Metadata Outputs
# ========================================

output "volume_metadata" {
  description = "All metadata attached to the volume"
  value       = openstack_blockstorage_volume_v3.volume.metadata
}

# ========================================
# Composite Outputs
# ========================================

output "volume_details" {
  description = "Complete details of the volume for use in other modules"
  value = {
    id                = openstack_blockstorage_volume_v3.volume.id
    name              = openstack_blockstorage_volume_v3.volume.name
    size              = openstack_blockstorage_volume_v3.volume.size
    type              = openstack_blockstorage_volume_v3.volume.volume_type
    region            = openstack_blockstorage_volume_v3.volume.region
    availability_zone = openstack_blockstorage_volume_v3.volume.availability_zone
    description       = openstack_blockstorage_volume_v3.volume.description
  }
}

output "attachment_info" {
  description = "Information needed to attach this volume to an instance"
  value = {
    volume_id = openstack_blockstorage_volume_v3.volume.id
    region    = openstack_blockstorage_volume_v3.volume.region
  }
}
