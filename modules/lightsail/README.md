# Lightsail

This module create a Lightsail instance with a static IP and Cloudflare record pointing to it.


## Use case example
```
module "saha_lightsail" {
  source = "git::git@github.com:Alizandieh/tf-modules.git//modules/lightsail?ref=9bf21dc" --> this is the commit hash
  ...
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.45.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [aws_lightsail_disk.ls_disk](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lightsail_disk) | resource |
| [aws_lightsail_disk_attachment.ls_disk_attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lightsail_disk_attachment) | resource |
| [aws_lightsail_instance.ls_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lightsail_instance) | resource |
| [aws_lightsail_instance_public_ports.ls_fw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lightsail_instance_public_ports) | resource |
| [aws_lightsail_key_pair.ls_ssh](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lightsail_key_pair) | resource |
| [aws_lightsail_static_ip.ls_ip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lightsail_static_ip) | resource |
| [aws_lightsail_static_ip_attachment.uptime_kuma](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lightsail_static_ip_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | AWS availability zone where the instance will be created | `string` | n/a | yes |
| <a name="input_blueprint_id"></a> [blueprint\_id](#input\_blueprint\_id) | Lightsail blueprint ID (OS/application image) | `string` | n/a | yes |
| <a name="input_bundle_id"></a> [bundle\_id](#input\_bundle\_id) | Lightsail bundle ID (instance plan/specification) | `string` | n/a | yes |
| <a name="input_disk_name"></a> [disk\_name](#input\_disk\_name) | Name of the Lightsail disk | `string` | n/a | yes |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | Size of the Lightsail disk in GB | `number` | n/a | yes |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | Name of the Lightsail instance | `string` | n/a | yes |
| <a name="input_ssh_key_name"></a> [ssh\_key\_name](#input\_ssh\_key\_name) | Name of the Lightsail SSH key pair | `string` | n/a | yes |
| <a name="input_static_ip_name"></a> [static\_ip\_name](#input\_static\_ip\_name) | Name of the Lightsail static IP | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of tags to assign to the Lightsail instance | `map(string)` | `{}` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | User data script to run during instance initialization | `string` | `null` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_ssh_private_key"></a> [ssh\_private\_key](#output\_ssh\_private\_key) | Private key of the Lightsail SSH key pair |
| <a name="output_ssh_public_key"></a> [ssh\_public\_key](#output\_ssh\_public\_key) | Public key of the Lightsail SSH key pair |
| <a name="output_static_ip"></a> [static\_ip](#output\_static\_ip) | n/a |
<!-- END_TF_DOCS -->
