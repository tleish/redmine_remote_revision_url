Repository.class_eval do
  safe_attributes 'extra_remote_revision_url'
  safe_attributes 'extra_remote_revision_text'

  def extra_remote_revision_url(revision=nil)
    url = safe_extra_info[:extra_remote_revision_url] || ''
    return url unless revision.present?
    url.sub(':revision', revision)
  end

  def extra_remote_revision_url=(arg)
    merge_extra_info :extra_remote_revision_url => arg
  end

  def extra_remote_revision_text
    safe_extra_info[:extra_remote_revision_text] || extra_remote_revision_default_text
  end

  def extra_remote_revision_text=(arg)
    merge_extra_info :extra_remote_revision_text => arg
  end

  private

  def safe_extra_info
    extra_info || {}
  end

  def extra_remote_revision_default_text
    extra_remote_revision_url.split('/').reject(&:empty?)[1]
  end
end
