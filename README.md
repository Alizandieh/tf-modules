# Terraform Modules

A home for AWS Terraform modules, to be imported in roots housed elsewhere.

## Prerequisites

### Pre-commit configured

Before working with the repository it is mandatory to execute the following commands:

```
brew install pre-commit
brew install terraform-docs
pre-commit install
pre-commit run -a
```

The above commands will install the pre-commit package and setup pre-commit checks for this repository. If you don't have Homebrew try an alternative way of installation [here](https://pre-commit.com/#install)

For more info about the basic pre-commit hooks used in this repo please read [here](docs/pre-commit.md)

## Principles

For more information on the principles for our modules, please see [here](docs/principles.md).

## Adding new modules

For more information on how to add a new module to this repo works, please see [here](docs/adding-a-new-module.md).

## Adding Release Notes
Release notes can be added to the README.md file located in the appropriate subdirectory for each module whenever there is a bugfix, new feature or a breaking change.

This should be added before the TF_DOCS tag:

```
<!-- BEGIN_TF_DOCS -->
```
