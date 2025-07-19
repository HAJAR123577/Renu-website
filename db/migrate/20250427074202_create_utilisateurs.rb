class CreateUtilisateurs < ActiveRecord::Migration[7.1]
  def change
    create_table :utilisateurs do |t|
      t.string :nom
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
