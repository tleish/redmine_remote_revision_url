# patch for RepositoriesHelper

RepositoriesHelper.class_eval do
  alias_method :original_repository_field_tags, :repository_field_tags
  def repository_field_tags(form, repository)
    html = original_repository_field_tags(form, repository)
    html += extra_remote_revision_url_tag(form)
    html += extra_remote_revision_text_tag(form) unless plugin_redmine_remote_revision_url('replace_revision_link')
    html
  end

  def linkify_id(html)
    return html unless @repository.identifier.present?
    revision_link = @rev.html_safe + link_to_web_revision(@changeset)
    html.sub(content_tag(:td, @rev), content_tag(:td, revision_link)).html_safe
  end

  private

  def extra_remote_revision_url_tag(form)
    content_tag('p', form.text_field('extra_remote_revision_url', size: 60) +
                 '<br />'.html_safe +
                 content_tag(:em, l(:field_extra_remote_revision_url_info).html_safe, class: 'info')
    )
  end

  def extra_remote_revision_text_tag(form)
    content_tag('p', form.text_field('extra_remote_revision_text', size: 30) +
                     '<br />'.html_safe +
                     content_tag(:em, l(:field_extra_remote_revision_text_info), class: 'info')
    )
  end

end
