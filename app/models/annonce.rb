class Annonce < ApplicationRecord
  belongs_to :utilisateur, optional: true
  # Supprimez belongs_to :category
  validates :nom_produit, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :prix, presence: true, numericality: { greater_than: 0 }
  validates :date_publication, presence: true
  validates :nom_categorie, presence: true  # Ajoutez cette ligne

  has_one_attached :photo
  validate :date_publication_cannot_be_in_future

  def date_publication_cannot_be_in_future
    if date_publication.present? && date_publication > Date.today
      errors.add(:date_publication, "ne peut pas être dans le futur")
    end
  end

  enum statut: { actif: 0, archive: 1 }

  # Après mise à jour, archiver l'annonce si l'utilisateur est supprimé
  after_update :archive_annonce, if: :utilisateur_supprime?

  private

  def archive_annonce
    update(statut: :archive) if utilisateur.nil?
  end

  def utilisateur_supprime?
    utilisateur.nil? && statut == "actif"
  end
end