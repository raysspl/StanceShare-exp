class AddImageRemoteUrlToParts < ActiveRecord::Migration
  def change
    add_column :parts, :image_remote_url, :string
  end
end
