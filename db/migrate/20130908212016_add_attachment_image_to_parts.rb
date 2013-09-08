class AddAttachmentImageToParts < ActiveRecord::Migration
  def self.up
    change_table :parts do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :parts, :image
  end
end
