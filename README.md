novennotification
=================

eZ Publish 4 / 5LE extension to display or delete notifications for users.
Forked from [projects.ez.no](http://projects.ez.no/novennotification).

Summary
--------
This extension allows to display or delete notifications for users on the back-office interface or on the front-end.

Disclaimer
---------
This extension is provided as is, completely free of use and charge.

Copyright
---------
Originally by 2009 Jean-Luc Nguyen, Noven
Modifications 2012-2013 by Andy Caiger (http://eab.uk/About-Us/The-EAB-team/Andy-Caiger)

License
-------
GNU General Public License v2.0

Installation
-----------
Uncompress the archive in your eZ Publish `extension/` folder.
Activate the extension.
Clear the cache.

Configuration
-------------
Edit the configuration file, which is defined in `extension/novennotification/setting/novennotification.ini`
* `UserGroupNodeIDs` is the node array for the groups users to display
* `Limit` is the number of users to display on the list

Usage
------
* You should have a new menu entry under the 'User accounts' tab in the admin interface.
* Select the user group you would like to display.
* You may display or delete an individual user's details by clicking on the details link.


