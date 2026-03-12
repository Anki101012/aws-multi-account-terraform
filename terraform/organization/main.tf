#creating an organization
data "aws_organizations_organization" "helixcloud_org" {
}

resource "aws_organizations_organizational_unit" "dev" {
  name      = "dev"
  parent_id = data.aws_organizations_organization.helixcloud_org.roots[0].id
}

resource "aws_organizations_organizational_unit" "prod" {
  name      = "prod"
  parent_id = data.aws_organizations_organization.helixcloud_org.roots[0].id
}

resource "aws_organizations_policy_attachment" "dev_ou" {
  policy_id = aws_organizations_policy.deny_all_outside_dev_region.id
  target_id = aws_organizations_organizational_unit.dev.id
}

resource "aws_organizations_policy_attachment" "prod_ou" {
  policy_id = aws_organizations_policy.deny_deleting_compliance_monitoring.id
  target_id = aws_organizations_organizational_unit.prod.id
}
