class AdminMailer < ApplicationMailer
  def admin_email(participation)

    
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @admin = participation.event.admin
    @user = participation.user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url = 'http://monsite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @admin.email , subject: "Une nouvelle personne participe à l'événement !") 
  end
  

end
