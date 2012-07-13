
class resolv::config
{
    $resolv_search     = hiera('resolv_search', 'UNDEFINED')

    # $resolv_search     = hiera('resolv_search', [])
    # template : unless nics.empty?

    $resolv_nameserver = hiera('resolv_nameserver', [ '8.8.8.8', '8.8.4.4' ])
    $resolv_config_dir = hiera('resolv_config_dir')
    $resolv_user       = hiera('resolv_user')
    $resolv_group      = hiera('resolv_group')

    file { "$resolv_config_dir/resolv.conf":
        ensure  => present,
        content => template("${module_name}/resolv.conf.erb"),
        owner   => $resolv_user,
        group   => $resolv_group,
        mode    => '0644',
    }
}
