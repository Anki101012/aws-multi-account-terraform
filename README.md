# AWS Multi Account Architecture Lab
Creating a project to demonstrates an enterprise-style AWS multi-account environment using AWS Organizations, Service Control Policies (SCP), IAM Identity Center and Terraform.

## Organization Scenario
The lab simulates a cloud organization called "helixcloud".
Users access AWS accounts through centralized identity and role-based access.

## Organization Structure
1. Management Account --> cloud.platform.eng
2. Member Accounts --> helixcloud.dev4400 || helixcloud.prod4400

## Architecture
helixcloud Organization
        |
Management Account
        |
-------------------------
|                       |
Dev Account             Prod Account
helixcloud.dev4400      helixcloud.prod4400

## Technologies Used
- AWS Organizations
- IAM Identity Center
- Terraform
- AWS IAM
- Multi-account architecture

## Objective
The goal of this project is to simulate enterprise cloud governance and account isolation patterns used in large organizations.
