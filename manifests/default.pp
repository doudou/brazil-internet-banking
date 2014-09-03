include apt
include apt::update

apt::ppa { 'ppa:webupd8team/java': }

exec { 'setup-java-license-1':
    command => 'echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections',
    path => '/bin:/usr/bin'
}
exec { 'setup-java-license-2':
    command => 'echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections',
    require => Exec['setup-java-license-1'],
    path => '/bin:/usr/bin'
}
package { 'oracle-java7-installer':
    require => [ Exec['apt_update'],
            Exec['setup-java-license-2'] ]
}
package { 'chromium-browser':
    ensure => '18.0.1025.151~r130497-0ubuntu1',
    require => Exec['apt_update'] }

