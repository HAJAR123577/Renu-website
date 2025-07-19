class CreateAnnonces < ActiveRecord::Migration[7.1]
  def change
    create_table :annonces do |t|
      t.string :nom_produit
      t.text :description
      t.decimal :prix
      t.date :date_publication
      t.string :photo
      t.references :utilisateur, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
