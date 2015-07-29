# chef-debian-workstation-cookbook

TODO: Enter the cookbook description here.

## Supported Platforms

TODO: List your supported platforms.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['chef-debian-workstation']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### chef-debian-workstation::default

Include `chef-debian-workstation` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[chef-debian-workstation::default]"
  ]
}
```

## License and Authors

Author:: Burberry, LTD (<fraser.scott@burberry.com
>)
