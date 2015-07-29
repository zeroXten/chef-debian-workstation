override.authorization.sudo.users = [ node.workstation.user ]

if node.kitchen_test
  override.authorization.sudo.users << "vagrant"
  override.authorization.sudo.passwordless = true
end
