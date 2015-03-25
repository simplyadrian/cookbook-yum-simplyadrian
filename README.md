yum-nativex Cookbook
====================
Used to configure yum repositories on target nodes as well as upgrade target nodes.

Requirements
------------
Depends on the yum community cookbook.

Recipes
-------
#### default.rb
Calls the yum-nativex::customrepo recipe

#### customrepo.rb
Adds the epel and spacewalk repos required by other cookbooks during the bootstrap process.

#### yum-nativex::deleterepo
Cleans up repos that were added for the bootstrap process. Repositories will be managed by the node or in the case of
NativeX, SpaceWalk after this point.

#### yum-nativex:doupgrade
Performs a yum upgrade on the node.

#### yum-nativex:doupgrade_once
Performs a one-time yum upgrade on the node. The recipe uses an internal Lockfile to know it has already been called.  Calling the recipe multipe times will have no effect unless the lockfile is deleted.
This recipe is good for getting a machine up to date on bootstrap.

Attributes
----------
None.

Usage
-----
#### yum-nativex::default

Example of usage in a role cookbook:

include_recipe 'yum-nativex'
# Include repository dependent recipes here
include_recipe 'yum-nativex::deleterepo'

#### yum-nativex::doupgrade
Simply include this recipe to perform a yum upgrade on the node.

License and Authors
-------------------
Authors: Adrian Herrera, Jesse Hauf
