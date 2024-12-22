The `recipeX-aws-tf-infra` repository is designed to manage the AWS infrastructure for the RecipeX application using Terraform. It provides a collection of Terraform configurations to provision and manage AWS resources required by RecipeX, ensuring a consistent and reproducible infrastructure setup. It includes a GitHub Actions workflow for automating infrastructure changes.

---

## Features

- **Modular Infrastructure**: Organized into reusable modules for networking and clusters.
- **Automation with GitHub Actions**: Fully automated Terraform plan and apply workflow.
- **Version Control**: Infrastructure as Code (IaC) ensures repeatability and trackability.
- **Secure Credential Management**: Sensitive data like AWS credentials and PAT tokens are securely stored as GitHub Secrets.

---

## Prerequisites

Before you begin, ensure you have the following:

- **Terraform**: Version 1.0 or higher.
- **AWS CLI**: Configured with appropriate credentials.
- **GitHub Secrets**: Add the following secrets to your repository settings:
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`
  - `PAT_TOKEN`

---

## Workflow: Automated Terraform Infrastructure Changes

The repository includes a GitHub Actions workflow that manages Terraform infrastructure changes across the `networking` and `cluster` modules. Below is an overview of the workflow.

### How It Works

1. **Triggering**: Manually trigger the workflow from the Actions tab and select `apply` as the action.
2. **Plan Stage**: Plans the Terraform changes for both networking and cluster modules.
3. **Apply Stage**: Applies the planned changes, ensuring no unintended alterations.
4. **Artifact Management**: Uploads and downloads Terraform plans between jobs to maintain consistency.

---

## Contributing

Contributions are welcome! To contribute:

1. Fork the repository.
2. Create a feature branch.
3. Submit a pull request with your changes.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---


For questions or support, please open an issue in this repository or contact the maintainers 
