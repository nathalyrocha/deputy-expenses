class AddAvatarToDeputy < ActiveRecord::Migration[6.0]
  def change
    add_column :deputies, :avatar_id, :string
  end
end
