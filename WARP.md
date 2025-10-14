# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Overview

This is an Infrastructure as Code (IaC) repository using Azure Bicep for defining and deploying Azure resources. The repository contains Bicep templates and parameter files for managing cloud infrastructure declaratively.

## Architecture

The repository follows a simple structure:
- **Bicep Templates** (`.bicep` files): Define the infrastructure resources and their configuration
- **Parameter Files** (`.bicepparam` files): Contain environment-specific values and configuration
- **GitHub Actions**: Automated workflows for CI/CD (currently configured for Docker but may need adjustment for Bicep deployments)

## Essential Commands

### Bicep CLI Setup
```bash
# Install Bicep CLI through Azure CLI
az bicep install

# Verify installation
az bicep version

# Login to Azure (required for deployments)
az login
```

### Development Commands
```bash
# Build/compile Bicep template to ARM JSON
az bicep build --file test.bicep

# Validate Bicep syntax and template
az bicep build --file test.bicep --stdout

# Lint Bicep files
az bicep lint --file test.bicep

# Format Bicep files
az bicep format --file test.bicep
```

### Deployment Commands
```bash
# Create a deployment (dry-run/what-if)
az deployment group what-if \
  --resource-group <resource-group-name> \
  --template-file test.bicep \
  --parameters test.bicepparam

# Deploy to Azure resource group
az deployment group create \
  --resource-group <resource-group-name> \
  --template-file test.bicep \
  --parameters test.bicepparam

# Deploy with specific parameter values
az deployment group create \
  --resource-group <resource-group-name> \
  --template-file test.bicep \
  --parameters location=eastus environment=prod
```

### Testing and Validation
```bash
# Validate all Bicep files in current directory
find . -name "*.bicep" -exec az bicep build --file {} \;

# Test parameter file syntax
az bicep build --file test.bicep --parameters test.bicepparam
```

## Code Structure Notes

- **Parameter Files**: Use the `using` statement to reference the main Bicep template
- **Resource Definitions**: Currently defines Azure Storage Account with configurable SKU and features
- **Parameters**: Include location, environment, storage configuration, and feature flags
- **Missing Elements**: The test.bicep file references variables (`storageAccountName`, `location`, `storageAccountType`) that are not defined - these need to be added as parameters or variables

## Common Development Patterns

When working with this codebase:
1. Always validate syntax with `az bicep build` before committing
2. Use parameter files for environment-specific configurations
3. Test deployments with `what-if` before actual deployment
4. Consider resource naming conventions and Azure resource limits
5. Use consistent tagging strategy as shown in the parameter file

## Repository-Specific Notes

- The GitHub Actions workflow is currently configured for Docker but should be updated for Bicep deployment workflows
- The main Bicep template needs completion - missing parameter definitions and proper variable references
- Consider adding bicepconfig.json for repository-wide Bicep settings and rules