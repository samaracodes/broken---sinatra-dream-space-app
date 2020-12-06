require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "our_awesome_dream_space_app"
    #if someone doesnt have the sesssion scret and tries 
    # to imitate you they wont be able to.
  end

  get "/" do
    erb :welcome
  end


   

end
