class RenameAttachmentPathToFilePath < ActiveRecord::Migration
  def change
    rename_column :personal_departament_attachments, :attachment_path, :file_path
  end
end
