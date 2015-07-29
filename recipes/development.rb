#
# Cookbook Name:: chef-debian-workstation
# Recipe:: development
#
# Copyright (C) 2015 Fraser Scott
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

# Go

bash "extract-go" do
  command "tar -C /usr/local -xzf #{Chef::Config[:file_cache_path]}/go1.4.2.linux-amd64.tar.gz"
  action :nothing
end

remote_file "#{Chef::Config[:file_cache_path]}/go1.4.2.linux-amd64.tar.gz" do
  source "https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz"
  owner "root"
  group "root"
  mode 0644
  notifies :run, "bash[extract-go]", :immediately
end

# Ruby

%w[libssl-dev libreadline-dev zlib1g-dev].each do |p|
  package p
end

bash "install ruby" do
  code <<-EOF
    if [ ! -d #{node.workstation.home}/.rbenv ]; then
      git clone https://github.com/sstephenson/rbenv.git #{node.workstation.home}/.rbenv
    fi
    if [ ! -d #{node.workstation.home}/.rbenv/plugins/ruby-build ]; then
      git clone https://github.com/sstephenson/ruby-build.git #{node.workstation.home}/.rbenv/plugins/ruby-build
    fi
  EOF
  cwd node.workstation.home
  user node.workstation.user
end
