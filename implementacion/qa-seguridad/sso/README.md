# Autenticación SSO con Google.

1) En primer lugar se instalan las siguientes gemas (al finalizar ejecutamos bundle install).

		gem 'omniauth'
        gem 'omniauth-google-oauth2'

2) En nuestro modelo Users generado por devise, deben existir obligatoriamente los campos: provider y uid. En caso de no tenerlos, agregarlos mediante una migración. De esta manera, nuestro archivo schema.rb deberia luciŕ así:

        create_table "users", force: :cascade do |t|
        ...
        t.string "uid"
        t.string "provider"
        ...
        end

3) Modificar el modelo User para que funcione con omniauth:

    class User < ApplicationRecord
        # Include default devise modules. Others available are:
        # :confirmable, :lockable, :timeoutable and :omniauthable
        devise :database_authenticatable, :registerable,:recoverable, :rememberable, :omniauthable,
         :trackable, :validatable

        has_many :publications

        def self.create_with_omniauth(auth)
            where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
                user.provider = auth.provider
                user.uid = auth.uid
                user.email = auth.info.email
                user.password = Devise.friendly_token[0,20]
            end
        end
    end

4) Crear un controlador llamado callbacks_controller para que maneje las peticiones a Google.
    
    class CallbacksController < Devise::OmniauthCallbacksController
        def google
            @user = User.create_with_omniauth(request.env["omniauth.auth"])
            sign_in_and_redirect @user
        end
    end


5) Utilizar el API Developers de Google para pedir las credenciales que serán utilizadas para iniciar sesión en la página. Este paso se realiza en https://console.developers.google.com

6) Ir al archivo config/initializers/devise.rb y añadir el ID y el key secret suministrado por Google.
    
    config.omniauth :google_oauth2, 'ID cliente', 'Secreto de cliente', { name: "google" }

