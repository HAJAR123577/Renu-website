class UpdateAnnoncesTable < ActiveRecord::Migration[7.1]
  def change
    # Supprimer les clés étrangères
    remove_reference :annonces, :utilisateur, foreign_key: true
    remove_reference :annonces, :category, foreign_key: true

    # Ajouter les nouveaux champs
    add_column :annonces, :nom_utilisateur, :string
    add_column :annonces, :nom_categorie, :string
  end
end