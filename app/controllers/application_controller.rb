class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

    include SessionsHelper
    include ApplicationHelper
 
    #helper_method :current_Utilisateur
    
    #def current_Utilisateur
    #  @current_Utilisateur ||= Utilisateur.find_by(id: session[:utilisateur_id])
    #end

    def current_user
      @current_user ||= Utilisateur.find_by(id: session[:utilisateur_id])
    end

    def authentificate
      unless logged_in?
        flash[:danger] = "Merci de se connecter."
        redirect_to login_url
      end
    end
    helper_method :logged_in?

    def logged_in?
      !!current_user
    end

    
   
  end
  