#
# Cookbook Name:: yumupgrade-simplyadrian
# Recipe:: doupgrade
#
# Copyright 2014, simplyadrian
#
# All rights reserved - Do Not Redistribute
#

execute "yum-y-upgrade" do
  command "yum -y upgrade --nogpgcheck"
  action :run
end
