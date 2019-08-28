class AddImageToCourse < ActiveRecord::Migration[5.2]
  mount_uploader :image, ImageUploader
end

  def change
    add_column :courses, :image, :string
  end
end
