
class resolv::data
{
    case $::operatingsystem
    {
        'ubuntu','debian': {
            $resolv_config_dir = '/etc'
            $resolv_user       = 'root'
            $resolv_group      = 'root'
        }
        'centos','redhat': {
            $resolv_config_dir = '/etc'
            $resolv_user       = 'root'
            $resolv_group      = 'root'
        }
        default:
        {
            fail("Unknown OS: $::operatingsystem")
        }
    }
}
