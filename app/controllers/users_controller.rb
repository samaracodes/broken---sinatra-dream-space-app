class UsersController < ApplicationController
    # what routes do I need for login?
    # purpose of this route is to show(render) the user the login oage/form.

    get '/login' do
        erb :login

    end

    # what routes do I need for signup?

    get '/signup' do

    end


end