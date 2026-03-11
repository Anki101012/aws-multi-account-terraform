output "organization_id" {
  value = data.aws_organizations_organization.helixcloud_org.id
}
output "root_id" {
  value = data.aws_organizations_organization.helixcloud_org.roots[0].id
}
output "dev_ou_id" {
  value = aws_organizations_organizational_unit.development.id
}
output "prod_ou_id" {
  value = aws_organizations_organizational_unit.production.id
}
