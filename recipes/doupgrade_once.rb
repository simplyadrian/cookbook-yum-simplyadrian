#
# Cookbook Name:: yumupgrade-simplyadrian
# Recipe:: doupgrade_once
#
# Copyright 2015, simplyadrian
#
# All rights reserved - Do Not Redistribute
#
# A one-time-only yum upgrade. Useful for updating a server at bootstrap.

file 'yum-firstrun-lockfile' do
  action :create_if_missing
  user 'root'
  group 'root'
  mode '0755'
  content "DO NOT DELETE THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING. IT IS A LOCKFILE GENERATED BY CHEF TO PREVENT YUM UPGRADE FROM RUNNING OUTSIDE THE PATCH CYCLE."
  notifies :run, 'execute[yum-y-upgrade-once]', :immediately
end

# Action is nothing so that normally no action is taken; :run needs to be specifically invoked by lockfile resource
execute "yum-y-upgrade-once" do
  command "yum -y upgrade --nogpgcheck"
  action :nothing
end
