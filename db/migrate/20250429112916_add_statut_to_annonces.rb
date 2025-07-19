class AddStatutToAnnonces < ActiveRecord::Migration[7.1]
  def change
    add_column :annonces, :statut, :integer
  end
end
