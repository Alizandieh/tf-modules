# Adding a new module


### Module README.md file

When adding a new module please make sure you add a `README.md` to the directory.

The `README.md` should contain the following:

```
# <Module Name>

## Release Notes

<!-- BEGIN_TF_DOCS -->

<!-- END_TF_DOCS -->
```

This is make sure when the `pre-commit` hooks run the documentation is automatically created for that module.

## Conventions

We have the following conventions when creating a new module.

1. The variables defined within the `variables.tf` file should be in alphabetical order.
1. The outputs defined within the `outputs.tf` file should be in alphabetical order.

## Importing modules

You should use the following form in order to retrieve a specific version via Git over SSH:

```
module "example" {
  source = "git::git@github.com:Alizandieh/tf-modules.git//modules/base?ref=v1.0.0"
}
```

See [https://www.terraform.io/docs/modules/sources.html](https://www.terraform.io/docs/modules/sources.html) for more details on importing modules.
