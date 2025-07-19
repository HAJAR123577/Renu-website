class AnnoncesController < ApplicationController
  before_action :set_annonce, only: [:show, :edit, :update, :destroy]  # Seulement pour ces actions
  before_action :authentificate, except: [:showAnnonces, :electronique, :maison, :vetements, :livres, :sport, :show]
  before_action :check_ownership, only: [:edit, :update, :destroy]
  before_action :load_annonces_by_category, only: [:electronique, :maison, :vetements, :livres, :sport]

  def index
    @annonces = Annonce.where(nom_utilisateur: current_user.nom)
  end
  
  CATEGORIES_MAP = {
  "electronique" => "Électronique",
  "maison" => "Maison",
  "vetements" => "Vêtements",
  "livres" => "Livres",
  "sport" => "Sport"
}

def load_annonces_by_category
  category = CATEGORIES_MAP[params[:action]]
  @annonces = Annonce.where(nom_categorie: category, statut: :actif)
end

  def showAnnonces
    # Récupérer toutes les annonces actives
    @annonces = Annonce.where(statut: :actif)
  end

  def show
    # Aucune modification ici, car set_annonce est appelé avant
  end

  def new
    @annonce = Annonce.new
  end

  def create
    @annonce = Annonce.new(annonce_params)
    @annonce.nom_utilisateur = current_user.nom
    @annonce.date_publication = Date.today
    @annonce.statut = 'actif'

    if @annonce.save
      redirect_to @annonce, notice: 'Annonce créée avec succès.'
    else
      render :new
    end
  end

  def edit
    # L'édition passe par set_annonce pour récupérer l'annonce à éditer
  end
  
  def update
    if @annonce.update(annonce_params)
      flash[:success] = "Annonce actualisée !"
      redirect_to @annonce
    else
      render :edit
    end
  end

  def destroy
    @annonce.destroy
    redirect_to annonces_url, notice: 'Annonce supprimée avec succès.'
  end

  private

  def set_annonce
    @annonce = Annonce.find(params[:id])
  end

  def check_ownership
    unless @annonce.nom_utilisateur == current_user.nom
      redirect_to root_path, alert: "Vous n'avez pas accès à cette ressource."
    end
  end

  def annonce_params
    params.require(:annonce).permit(:nom_produit, :description, :prix, :date_publication, :nom_categorie, :photo)
  end

 
end
