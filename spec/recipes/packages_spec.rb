require 'chefspec'

describe 'ossec-server::packages' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it 'installs the inotify-tools package' do
    expect(chef_run).to install_package('install_inotify-tools_package').with(
      options: '--enablerepo=epel'
    )
  end

  it 'installs the GeoIP development package' do
    expect(chef_run).to install_package('install_GeoIP-devel_package')
  end

  it 'installs the perl-DBI package' do
    expect(chef_run).to install_package('install_perl-DBI_package')
  end

  it 'installs the perl Time-HiRes package' do
    expect(chef_run).to install_package('install_perl-Time-HiRes_package')
  end

  it 'installs the OSSEC-HIDS RPM' do
    expect(chef_run).to install_rpm_package('install_ossec-hids-2.8.1-47.el6.art.x86_64.rpm_package')
  end

  it 'installs the OSSEC-HIDS server RPM' do
    expect(chef_run).to install_rpm_package('install_ossec-hids-server-2.8.1-47.el6.art.x86_64.rpm_package')
  end
end
