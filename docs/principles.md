# Principles

Terraform lacks strong conventions / sane defaults in some cases, so we've tried to standardise on a few of our own to make the codebase as easy to use as possible:

- Define variables as close to usage as possible (i.e. don't pass variables down through several modules unless you have to)
- Pass variables as maps where possible, decompose at lowest level possible (i.e. at point of use)
- Do not use default values for variables, except when necessary to define a boolean type
- Always use an absolute import path for a module rather than a relative path (e.g. ../../module-name)
- Sort properties alphabetically where it makes sense to, except special cases such as count and source that benefit from coming first due to significance
- Use underscores rather than dashes for resource names
- Always run terraform fmt against files you change
- Sort resources alphabetically inside files
- Evaluate upstream modules before committing to writing your own module
