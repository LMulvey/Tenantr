class ContactMailer < ActionMailer::Base 
    default to: 'lmulvey@me.com'

    def contact_email(name, email, body)   
       @name = name
       @email = email
       @body = body
       
       mail(from: email, subject: 'Tenantr Contact Form',)
    end
end
