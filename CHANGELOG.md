# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.0.0] - 2026-02-12

### Added
- Initial release of OVH block storage module
- Support for creating block storage volumes on OVH Public Cloud
- Volume type selection (classic or high-speed)
- Flexible volume creation from images, snapshots, or cloning existing volumes
- Availability zone selection
- Metadata and tag support for resource organization
- Comprehensive input validation for regions and configurations
- Detailed outputs for integration with other modules
- Simple and complete usage examples
- GitHub Actions CI/CD workflows for validation

### Features
- Volume creation with OpenStack provider
- Support for both classic and high-speed volume types
- Create volumes from images, snapshots, or clone existing volumes
- Minimum volume size validation (10 GB for OVH)
- Support for all OVH regions (GRA, SBG, BHS, DE, UK, WAW)
- Resource tagging and metadata
- Availability zone selection
- Mutually exclusive source validation (image, snapshot, or source volume)

[Unreleased]: https://github.com/terraform-ovh-modules/terraform-ovh-block-storage/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/terraform-ovh-modules/terraform-ovh-block-storage/releases/tag/v1.0.0
