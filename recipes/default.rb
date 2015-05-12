#
# Cookbook Name:: yum-simplyadrian
# Recipe:: default
#
# Copyright 2014, simplyadrian 
#
# All rights reserved - Do Not Redistribute
#

package "yum-plugin-fastestmirror"
include_recipe "yum-simplyadrian::customrepo"
