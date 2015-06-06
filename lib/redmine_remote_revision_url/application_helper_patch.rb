# patch for ApplicationHelper

module ApplicationHelper
  alias_method :original_link_to_revision, :link_to_revision
  def link_to_revision(revision, repository, options = {})
    original_link_to_revision(revision, repository, options) +
      link_to_web_revision(revision)
  end

  # Generates a link to a web revision
  def link_to_web_revision(revision)
    url = link_to_web_revision_url(revision)
    return unless url.present?
    text = url.split('/').reject(&:empty?)[1]
    ' | '.html_safe +
      link_to(h(text), url, title: l(text), target: link_to_web_revision_target)
  end

  def link_to_web_revision_url(revision)
    repository = revision.repository.is_a?(Project) ? revision.repository.repository : revision.repository
    rev = revision.respond_to?(:identifier) ? revision.identifier : revision
    repository.extra_remote_revision_url(rev)
  end

  def link_to_web_revision_target
    open_in_new_window = plugin_redmine_remote_revision_url('open_in_new_window')
    open_in_new_window ? '_blank' : '_top'
  end

  def plugin_redmine_remote_revision_url(setting)
    return nil unless Setting.plugin_redmine_remote_revision_url.is_a? Hash
    Setting.plugin_redmine_remote_revision_url[setting]
  end
end