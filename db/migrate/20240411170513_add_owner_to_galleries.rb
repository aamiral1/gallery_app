class AddOwnerToGalleries < ActiveRecord::Migration[7.0]
  def change
    add_column :galleries, :owner, :string
  end
end
