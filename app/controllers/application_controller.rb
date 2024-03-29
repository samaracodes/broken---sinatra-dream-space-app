require './config/environment'


class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    register Sinatra::Flash
    set :session_secret, "our_awesome_dream_space_app"
    #if someone doesnt have the sesssion scret and tries 
    # to imitate you they wont be able to.
  end

  get '/' do
      erb :'/welcome'
  end

  helpers do 

    def logged_in?
      #true if user is logged in, otherwise false
      !!current_user 
      #will return nil or the user           
      #double bang(!!) takes a value and turns it            
      #into a boolean if it's true or false. 
    end

    def current_user
      @current_user ||= User.find_by(session[:user_id]) if session[:user_id]
      #is @current_user is referenced anywhere in the application
      #controller it will represent the current_user and if
      # current_user has no value/nil it will assign the user 
      #to the variable
    end

    def authorized_to_edit?(dream_post)
      dream_post.user == current_user
    end

    #BUILD HELPER MOETHOD FOR REDIRECTING IF NOT LOGGED IN

  end


   

end
