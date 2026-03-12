resource "aws_organizations_policy" "deny_all_outside_dev_region" {
  name    = "DenyAllOutsideDevRegion"
  type    = "SERVICE_CONTROL_POLICY"
  content = file("${path.module}/policies/restrict_regions.json")
}

resource "aws_organizations_policy" "deny_deleting_compliance_monitoring" {
  name    = "DenyDeletingComplianceMonitoring"
  type    = "SERVICE_CONTROL_POLICY"
  content = file("${path.module}/policies/deny_deleting_compliance_monitoring.json")
}

