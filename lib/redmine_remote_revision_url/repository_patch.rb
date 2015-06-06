Repository.class_eval do
  def extra_remote_revision_url(revision = nil)
    info = extra_info || {}
    url = info['extra_remote_revision_url'] || ''
    url.sub!(':revision', revision) if revision.present?
    url
  end
end
