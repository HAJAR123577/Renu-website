class AddAdminToUtilisateurs < ActiveRecord::Migration[7.1]
  def change
    add_column :utilisateurs, :admin, :boolean
  end
end
