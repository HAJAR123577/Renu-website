class PagesController < ApplicationController
  def home
    @annonces = Annonce.where(statut: 'actif').limit(10) # ou toute autre logique de récupération
  end

  def contact
  end

  def aide
  end
end
