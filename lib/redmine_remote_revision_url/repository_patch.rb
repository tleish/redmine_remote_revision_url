Repository.class_eval do
  def extra_remote_revision_url(revision = nil)
    info = extra_info || {}
    url = info['extra_remote_revision_url'] || ''
    url.sub!(':revision', revision) if revision.present?
    url
  end

  def extra_remote_revision_text
    info = extra_info || {}
    text = info['extra_remote_revision_text']
    text.present? ? text : extra_remote_revision_default_text
  end

  private

  def extra_remote_revision_default_text
    extra_remote_revision_url.split('/').reject(&:empty?)[1]
  end
end
