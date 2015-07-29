#
# Cookbook Name:: chef-debian-workstation
# Recipe:: system
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

## Apt

include_recipe 'apt::default'
include_recipe 'apt::unattended-upgrades'

## NTP

include_recipe 'ntp::default'

## Keyboard

cookbook_file "/etc/default/keyboard" do
  owner "root"
  group "root"
  mode 0644
end

## Locale

execute "locale-gen" do
  command "locale-gen"
  action :nothing
end

file "/etc/locale.gen" do
  owner "root"
  group "root"
  mode 0644
  content "en_GB.UTF-8 UTF-8\n"
  notifies :run, "execute[locale-gen]", :immediately
end

file "/etc/default/locale" do
  owner "root"
  group "root"
  mode 0644
  content "LANG=en_GB.UTF-8\n"
end

## Timezone

include_recipe 'timezone-ii::default'

## Xorg and i3

%w[xorg i3 dmenu dzen2 lxappearance rxvt-unicode feh git wifi-radar].each do |p|
  package p
end

## Ubuntu font

package "unzip"

directory "/usr/share/fonts/truetype/ttf-ubuntu" do
  owner "root"
  group "root"
  mode 0755
end

execute "copy-fonts" do
  command "cp #{Chef::Config[:file_cache_path]}/ubuntu-font-family-0.80/*.ttf /usr/share/fonts/truetype/ttf-ubuntu/"
  action :nothing
end

execute "extract-fonts" do
  command "unzip ubuntu-font-family-0.80.zip"
  cwd Chef::Config[:file_cache_path]
  action :nothing
  notifies :run, "execute[copy-fonts]", :immediately
end

remote_file "#{Chef::Config[:file_cache_path]}/ubuntu-font-family-0.80.zip" do
  source "http://font.ubuntu.com/download/ubuntu-font-family-0.80.zip"
  owner "root"
  group "root"
  mode 0644
  notifies :run, "execute[extract-fonts]", :immediately
end

