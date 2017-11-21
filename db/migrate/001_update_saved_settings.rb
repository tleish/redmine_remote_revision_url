class UpdateSavedSettings < ActiveRecord::Migration
  def up
    setting = Setting.find_by(name: 'plugin_redmine_remote_revision_url')

    if setting && setting.value.is_a?(Hash)
      setting.value = ActionController::Parameters.new({
        replace_revision_link: setting.value.try(:[], :replace_revision_link) == 'true' ? '1' : '0',
        open_in_new_window: setting.value.try(:[], :open_in_new_window) == 'true' ? '1' : '0'
      })
      setting.save!
    else
      Setting.where(name: 'plugin_redmine_remote_revision_url').destroy_all
    end
  end

  def down
  end
end
