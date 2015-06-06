# patch for RepositoriesHelper

RepositoriesHelper.class_eval do
  alias_method :original_repository_field_tags, :repository_field_tags
  def repository_field_tags(form, repository)
    original_repository_field_tags(form, repository) +
      extra_remote_revision_url_tag(form)
  end

  def extra_remote_revision_url_tag(form)
    content_tag('p', form.text_field('extra_remote_revision_url', size: 60) +
                 '<br />'.html_safe +
                 content_tag(:em, l(:field_extra_remote_revision_url_info), class: 'info')
    )
  end
end
