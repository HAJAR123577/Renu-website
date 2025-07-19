class SessionsController < ApplicationController
  def new
  end

  def create
    utilisateur = Utilisateur.find_by(email: params[:session][:email].downcase) # Correction du mot 'parms' en 'params'
    
    if utilisateur && utilisateur.authenticate(params[:session][:password]) # Correction du mot 'authentificate' en 'authenticate'
      log_in utilisateur
      redirect_to utilisateur
    else
      flash[:danger] = 'Combinaison Email/mot de passe invalide' # Correction de "mMot" en "mot"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
