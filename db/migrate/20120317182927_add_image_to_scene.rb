class AddImageToScene < ActiveRecord::Migration
  def self.up
    add_column :scenes, :image, :string
  end

  def self.down
    remove_column :scenes, :image
  end
end
