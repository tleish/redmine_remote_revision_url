# Redmine Remote Revision URL

## Summary

The Redmine Remote Revision URL plugin adds a revision link to a remote website to see more details on a commit/revision. 
This allows a user to quickly jump to github, gitlab, bitbucket, a code review website, etc and extend the current functionality of redmine revisions.
                 
![Screenshot](https://raw.githubusercontent.com/tleish/redmine_remote_revision_url/master/screenshot_associated_revisions.png)

![Screenshot](https://raw.githubusercontent.com/tleish/redmine_remote_revision_url/master/screenshot_revisions.png)

## Installation

```
$ cd redmine/plugins
$ git clone https://github.com/tleish/redmine_remote_revision_url
```
So run the following command for db migration
```
$ rake redmine:plugins NAME=redmine_remote_revision_url RAILS_ENV=production
```
Restart Redmine

## Repository Settings

To start using you must Add/Edit a Remote Revision URL for each repository. Go to Project > Settings > Repositories > Edit (or New Repository).
Insert *:revision* in the URL where the revision identifier should appear (e.g. https://website.com/my/project/commit/*:revision*).

![Screenshot](https://raw.githubusercontent.com/tleish/redmine_remote_revision_url/master/screenshot_repository_settings.png)

Optionally, you can also add Custom link text.  If left blank, defaults to domain name in Remote Revision URL.


## Global Plugin Settings

Globally configure remote revision url links to replace exising link or to open in a new tab/window (default is current window).

![Screenshot](https://raw.githubusercontent.com/tleish/redmine_remote_revision_url/master/screenshot_plugin_settings.png)