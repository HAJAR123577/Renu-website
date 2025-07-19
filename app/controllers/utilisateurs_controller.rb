class UtilisateursController < ApplicationController
  before_action :require_login, only: [:show, :destroy]
  before_action :correct_user, only: [:show, :destroy]
  before_action :correct_user_or_admin, only: [:show, :destroy]
  before_action :require_admin, only: [:destroy]

  def new
    @utilisateur = Utilisateur.new
  end

  def show
    @utilisateur = Utilisateur.find(params[:id])
  end

  def edit
    @utilisateur = Utilisateur.find(params[:id])
    if @utilisateur.nil?
      redirect_to utilisateurs_path, alert: "Utilisateur non trouvé"
    end
  end

  def update
    @utilisateur = Utilisateur.find(params[:id])
    ancien_nom = @utilisateur.nom  # <== ici on capture l'ancien nom
  
    if @utilisateur.update(utilisateur_params)
      # Maintenant, on peut mettre à jour les annonces qui avaient l'ancien nom
      Annonce.where(nom_utilisateur: ancien_nom).update_all(nom_utilisateur: @utilisateur.nom)
  
      redirect_to utilisateur_path(@utilisateur), notice: "Profil mis à jour avec succès."
    else
      render :edit, status: :unprocessable_entity
    end

    
    
  end
  
  
  
  
  
  
  

  def create
    @utilisateur = Utilisateur.new(utilisateur_params.merge(admin: false))
    if @utilisateur.save
      flash[:success] = "Bienvenue !"
      redirect_to @utilisateur
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    user = Utilisateur.find(params[:id])
    if current_user.admin?
      user.destroy
      redirect_to root_path, notice: "Utilisateur supprimé."
    else
      redirect_to root_path, alert: "Action non autorisée."
    end
  end

  private

  def require_login
    redirect_to login_path, alert: "Vous devez être connecté." unless current_user
  end

  def correct_user
    @utilisateur = Utilisateur.find(params[:id])
    redirect_to root_path, alert: "Accès non autorisé." unless @utilisateur == current_user
  end

  def correct_user_or_admin
    @utilisateur = Utilisateur.find(params[:id])
    redirect_to root_path, alert: "Accès non autorisé." unless current_user == @utilisateur || current_admin
  end

  def require_admin
    redirect_to root_path, alert: "Accès non autorisé." unless current_user.admin?
  end

  def utilisateur_params
    params.require(:utilisateur).permit(:nom, :email, :password, :password_confirmation)
  end
end
