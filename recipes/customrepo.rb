#
# Cookbook Name:: yum-nativex
# Recipe:: customrepo.rb
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

repos = [
    { :name => 'epel',
      :description => 'Extra Packages for Enterprise Linux',
      :baseurl => 'http://dl.fedoraproject.org/pub/epel/6/x86_64/',
      :gpgkey => 'http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6' },
    { :name => 'spacewalk-client',
      :description => 'SpaceWalk Client',
      :baseurl => 'http://yum.spacewalkproject.org/2.2-client/RHEL/6/x86_64/',
      :gpgkey => 'http://yum.spacewalkproject.org/RPM-GPG-KEY-spacewalk-2014' }
]

repos.each do |repo|
  yum_repository repo[:name] do
    description repo[:description]
    baseurl repo[:baseurl]
    gpgcheck false
    gpgkey repo[:gpgkey]
    action :create
    not_if { node.attribute?('repositories_removed') }
  end
end
