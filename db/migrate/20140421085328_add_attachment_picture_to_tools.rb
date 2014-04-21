class AddAttachmentPictureToTools < ActiveRecord::Migration
  def self.up
    change_table :tools do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :tools, :picture
  end
end
