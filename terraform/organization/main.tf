data "aws_organizations_organization" "helixcloud_org" {
}

resource "aws_organizations_organizational_unit" "development" {
  name      = "Development"
  parent_id = data.aws_organizations_organization.helixcloud_org.roots[0].id
}

resource "aws_organizations_organizational_unit" "production" {
  name      = "Production"
  parent_id = data.aws_organizations_organization.helixcloud_org.roots[0].id
}
