#
# Cookbook Name:: ossec-server
# Recipe:: packages
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

['inotify-tools'].each do |pkg|
  package "install_#{pkg}_package" do
    package_name "#{pkg}"
    options '--enablerepo=epel'
    action :install
  end
end

node['ossec-server']['packages']['dependencies'].each do |pkg|
  package "install_#{pkg}_package" do
    package_name "#{pkg}"
    action :install
  end
end

node['ossec-server']['packages']['core'].each do |rpm|
  rpm_package "install_#{rpm.rpartition('/').last}_package" do
    package_name "#{rpm}"
    action :install
  end
end
