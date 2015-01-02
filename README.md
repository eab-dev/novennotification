novennotification
=================

eZ Publish 4 / 5LE extension to display or delete notifications for users.
Forked from [projects.ez.no](http://projects.ez.no/novennotification).

Summary
--------
This extension allows an administrator to display or delete notifications for users on the back-office interface or on the front-end.

Disclaimer
---------
This extension is provided as is, completely free of use and charge.

Copyright
---------
Originally by 2009 Jean-Luc Nguyen, Noven
Modifications 2012-2014 by [Andy Caiger](http://eab.uk/ac)

License
-------
[GNU General Public License v2.0](www.gnu.org/licenses/gpl-2.0.html)

Installation
-----------
Use `git clone https://github.com/eab-dev/novennotification.git` or download and uncompress the archive in your eZ Publish `extension/` folder.
Activate the extension:

1. Copy the `novennotification` folder to the `extension` folder.

2. Edit `settings/override/site.ini.append.php`

3. Under `[ExtensionSettings]` add:

        ActiveExtensions[]=novennotification

4. Clear the cache:

        bin/php/ezcache.php --clear-all

Configuration
-------------
Edit the configuration file `extension/novennotification/setting/novennotification.ini`.
* `UserGroupNodeIDs` is the node array for the groups users to display
* `Limit` is the number of users to display on the list

Usage
------
* You should have a new menu entry under the 'User accounts' tab in the admin interface.
* Select the user group you would like to display.
* You may display or delete an individual user's details by clicking on the details link.


