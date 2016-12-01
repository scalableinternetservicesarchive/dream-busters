module WelcomesHelper
  def cache_key_for_editor(editor)
    "editor-#{editor.id}-#{editor.updated_at}"
  end
end
