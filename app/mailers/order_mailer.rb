class OrderMailer < ApplicationMailer
  default from: 'zekittenproject@gmail.com'
 
  def welcome_order(order)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @order = order 
    @user = order.user
   
    
    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://kitten-project-development.herokuapp.com/' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Votre commande chez Ze Kitten Project!') 
  end
end
