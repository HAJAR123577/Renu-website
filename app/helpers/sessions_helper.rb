
module SessionsHelper
    # Connecte l'utilisateur donné
    def log_in(utilisateur)
      session[:utilisateur_id] = utilisateur.id
    end
  
    # Récupère l'utilisateur connecté actuellement (s'il y en a un)
    def current_user
      @current_user ||= Utilisateur.find_by(id: session[:utilisateur_id])
    end
  
    # Vérifie si un utilisateur est connecté
    def logged_in?
      !current_user.nil?
    end
  
    # Déconnecte l'utilisateur
    def log_out
      session.delete(:utilisateur_id)
      @current_user = nil
    end
  end
  