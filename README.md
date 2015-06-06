# Redmine Remote Revision URL

## Summary

The Redmine Remote Revision URL plugin adds a revision link to a remote website to see more details on a commit/revision.

### Revision
![Screenshot](https://raw.githubusercontent.com/tleish/redmine_remote_revision_url/master/screenshot_revisions.png)

### Associated Revisions
![Screenshot](https://raw.githubusercontent.com/tleish/redmine_remote_revision_url/master/screenshot_associated_revisions.png)

## Installation

```
$ cd redmine/plugins
$ git clone https://github.com/tleish/redmine_remote_revision_url
```

restart Redmine

## Repository Settings

To start using you must Add/Edit a Remote Revision URL for each repository. Go to Project > Settings > Repositories > Edit (or New Repository)
Insert :revision in the URL where the revision identifier should appear (e.g. https://website.com/my/project/commit/:revision).

![Screenshot](https://raw.githubusercontent.com/tleish/redmine_remote_revision_url/master/screenshot_repository_settings.png)


## Global Plugin Settings

You can globally configure remote revision url links to open in a new tab/window.

Go to Plugin > Remote Revision URL > Open Remote Revision Links in New Tab/Window.
![Screenshot](https://raw.githubusercontent.com/tleish/redmine_remote_revision_url/master/screenshot_plugin_settings.png)