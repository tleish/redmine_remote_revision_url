require_dependency 'redmine_remote_revision_url/repository_patch'
require_dependency 'redmine_remote_revision_url/repositories_helper_patch'

ActionDispatch::Callbacks.to_prepare do
  require_dependency 'application_helper'
  require_dependency 'redmine_remote_revision_url/application_helper_patch'
end

Redmine::Plugin.register :redmine_remote_revision_url do
  name 'Remote Revision URL'
  author 'Thomas Leishman'
  description 'The Redmine Remote Revision URL plugin adds a revision link to a remote website to see more details on a commit/revision.'
  version '0.3.2'
  url 'https://github.com/tleish/redmine_remote_revision_url'
  author_url 'https://github.com/tleish'
  settings :default => {
    display_under_single_revision: true,
    display_under_associated_revisions: false,
    replace_revision_link: 0,
    open_in_new_window: 0
  }, :partial => 'redmine_remote_revision_url/settings'
end