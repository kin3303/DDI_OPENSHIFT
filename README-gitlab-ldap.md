$ vi /etc/gitlab/gitlab.rb

gitlab_rails['ldap_enabled'] = true
gitlab_rails['prevent_ldap_sign_in'] = false
gitlab_rails['ldap_servers'] = {
'main' => {
  'label' => 'LDAP',
  'host' =>  'authsj.corp.doosan.com',
  'port' => 389,
  'uid' => 'sAMAccountName',
  'encryption' => 'plain',
  'bind_dn' => 'CN=crowdadmin, OU=ApplicationAccounts,DC=corp, DC=doosan, DC=com',
  'password' => '123qwer@',
  'verify_certificates' => true,
  'timeout' => 10,
  'active_directory' => true,
  'allow_username_or_email_login' => false,
  'block_auto_created_users' => false,
  'base' => 'DC=corp, DC=doosan, DC=com',
  'user_filter' => '',
  'lowercase_usernames' => false,

  # EE Onlyl
  'group_base' => '',
  'admin_group' => '',
  'external_groups' => [],
  'sync_ssh_keys' => false
  }
}

$ gitlab-ctl reconfigure
$ gitlab-rake gitlab:ldap:check --trace


 



