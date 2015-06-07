# patch for ApplicationHelper

module ApplicationHelper
  alias_method :original_link_to_revision, :link_to_revision
  def link_to_revision(revision, repository, options = {})
    repository = safe_repository(repository)
    if plugin_redmine_remote_revision_url('replace_revision_link')
      replace_link_to_web_revision(revision, repository, options)
    else
      combine_link_to_web_revision(revision, repository, options)
    end
  end

  private

  def replace_link_to_web_revision(revision, repository, options = {})
    options[:text] ||= format_revision(revision)
    link_to_web_revision(revision, repository, options)
  end

  def combine_link_to_web_revision(revision, repository, options = {})
    original_link_to_revision(revision, repository, options) +
      '&nbsp;('.html_safe +
      link_to_web_revision(revision, repository)  +
      ')'
  end

  def safe_repository(repository)
    repository.is_a?(Project) ? repository.repository : repository
  end

  # Generates a link to a web revision
  def link_to_web_revision(revision, repository, options = {})
    url = link_for_web_revision_url(revision, repository)
    return unless url.present?
    text = options.delete(:text) || repository.extra_remote_revision_text
    link_to(h(text), url, { title: l(text), target: link_to_web_revision_target })
  end

  def link_for_web_revision_url(revision, repository)
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