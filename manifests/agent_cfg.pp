# Set individual property values in wrapper.conf
# *** This type should be considered private to this module ***
define bamboo_agent::agent_cfg(
  $home         = $title,
  $name         = $name,
  $description  = $description ,
){

  $path = "${home}/bamboo-agent.cfg.xml"

  file { $path:
    owner => $bamboo_agent::user_name,
    group => $bamboo_agent::user_group,
  } ->
  file_line { 'Upate name field':
    path    => $path,
    line    => "<name>$name</name>",
    match   => "^<name>.*?$"
  } ->
  file_line { 'Update description field':
  path    => $path,
  line    => "<description>$name</description>",
  match   => "^<description>.*?$"
  }
}
