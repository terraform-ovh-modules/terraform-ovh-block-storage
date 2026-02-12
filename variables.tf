# ========================================
# Required Variables
# ========================================

variable "name" {
  description = "Name of the block storage volume"
  type        = string

  validation {
    condition     = length(var.name) > 0 && length(var.name) <= 255
    error_message = "Volume name must be between 1 and 255 characters."
  }
}

variable "region" {
  description = "OVH region where the volume will be created (e.g., GRA7, SBG5, BHS5)"
  type        = string

  validation {
    condition = contains([
      "GRA1", "GRA3", "GRA5", "GRA7", "GRA9", "GRA11",
      "SBG3", "SBG5", "SBG7",
      "BHS3", "BHS5",
      "DE1",
      "UK1",
      "WAW1"
    ], var.region)
    error_message = "Invalid OVH region specified. Supported regions: GRA*, SBG*, BHS*, DE1, UK1, WAW1."
  }
}

variable "size" {
  description = "Size of the volume in GB. Must be at least 10 GB for OVH."
  type        = number

  validation {
    condition     = var.size >= 10
    error_message = "Volume size must be at least 10 GB for OVH Public Cloud."
  }
}

# ========================================
# Optional Variables
# ========================================

variable "description" {
  description = "Description of the block storage volume"
  type        = string
  default     = ""
}

variable "volume_type" {
  description = "Type of volume to create. Valid values: 'classic' (default) or 'high-speed'"
  type        = string
  default     = "classic"

  validation {
    condition     = contains(["classic", "high-speed"], var.volume_type)
    error_message = "Volume type must be either 'classic' or 'high-speed'."
  }
}

variable "availability_zone" {
  description = "Availability zone where the volume will be created. If not specified, uses default zone."
  type        = string
  default     = ""
}

# ========================================
# Image/Snapshot Configuration
# ========================================

variable "image_id" {
  description = "ID of the image to create volume from. Mutually exclusive with snapshot_id and source_vol_id."
  type        = string
  default     = ""

  validation {
    condition     = var.image_id == "" || can(regex("^[a-f0-9-]+$", var.image_id))
    error_message = "Image ID must be a valid UUID format."
  }
}

variable "snapshot_id" {
  description = "ID of the snapshot to create volume from. Mutually exclusive with image_id and source_vol_id."
  type        = string
  default     = ""

  validation {
    condition     = var.snapshot_id == "" || can(regex("^[a-f0-9-]+$", var.snapshot_id))
    error_message = "Snapshot ID must be a valid UUID format."
  }
}

variable "source_vol_id" {
  description = "ID of the source volume to clone. Mutually exclusive with image_id and snapshot_id."
  type        = string
  default     = ""

  validation {
    condition     = var.source_vol_id == "" || can(regex("^[a-f0-9-]+$", var.source_vol_id))
    error_message = "Source volume ID must be a valid UUID format."
  }
}

# ========================================
# Metadata and Tagging
# ========================================

variable "metadata" {
  description = "Key-value metadata to attach to the volume"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Key-value tags to apply to the volume for organization and billing"
  type        = map(string)
  default     = {}
}
