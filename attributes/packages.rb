#
# Cookbook Name:: ossec-server
# Attributes:: packages
#
# Copyright 2015, base2Services
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['ossec-server']['packages']['dependencies'] =
  case node['platform_family']
  when 'rhel'
    case node['platform']
    when 'centos' || 'amazon'
      ['GeoIP-devel', 'perl-DBI', 'perl-Time-HiRes']
    end
  end

default['ossec-server']['packages']['core'] =
  case node['platform_family']
  when 'rhel'
    case node['platform']
    when 'centos'
      case node['platform_version']
      when '6.6'
        [
          'http://www5.atomicorp.com/channels/ossec/centos/6/x86_64/RPMS/ossec-hids-2.8.1-47.el6.art.x86_64.rpm',
          'http://www5.atomicorp.com/channels/ossec/centos/6/x86_64/RPMS/ossec-hids-server-2.8.1-47.el6.art.x86_64.rpm'
        ]
      end
    when 'amazon'
      case node['platform_version']
      when '2014.09'
        [
          'http://www5.atomicorp.com/channels/ossec/centos/6/x86_64/RPMS/ossec-hids-2.8.1-47.el6.art.x86_64.rpm',
          'http://www5.atomicorp.com/channels/ossec/centos/6/x86_64/RPMS/ossec-hids-server-2.8.1-47.el6.art.x86_64.rpm'
        ]
      end
    end
  end
