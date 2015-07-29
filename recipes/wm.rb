#
# Cookbook Name:: chef-debian-workstation
# Recipe:: wm
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

cookbook_file "#{node.workstation.home}/.bashrc" do
  source "bashrc"
  owner node.workstation.user
  group node.workstation.user
  mode 0600
end

cookbook_file "#{node.workstation.home}/.bash_profile" do
  source "bash_profile"
  owner node.workstation.user
  group node.workstation.user
  mode 0600
end

directory "#{node.workstation.home}/.i3" do
  owner node.workstation.user
  group node.workstation.user
  mode 0700
end

#remote_file "#{node.workstation.home}/.i3/background.png" do
cookbook_file "#{node.workstation.home}/.i3/background.png" do
#  source "http://1.bp.blogspot.com/-i4AkGOhjviA/Uo4IrmDNI4I/AAAAAAAAAmM/ZKAOBUPeWSY/s1600/9.+Find+hacker+in+ip+Wallpaper.png"
  source "padlock-wallpaper.png"
  owner node.workstation.user
  group node.workstation.user
  mode 0600
end

cookbook_file "#{node.workstation.home}/.xinitrc" do
  source "xinitrc"
  owner node.workstation.user
  group node.workstation.user
  mode 0600
end

cookbook_file "#{node.workstation.home}/.Xresources" do
  source "xresources"
  owner node.workstation.user
  group node.workstation.user
  mode 0600
end


cookbook_file "#{node.workstation.home}/.i3/config" do
  source "i3-config"
  owner node.workstation.user
  group node.workstation.user
  mode 0600
end

cookbook_file "#{node.workstation.home}/.i3status.conf" do
  source "i3status.conf"
  owner node.workstation.user
  group node.workstation.user
  mode 0600
end
