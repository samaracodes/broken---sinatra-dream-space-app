class UsersController < ApplicationController
        # what routes do I need for login?
        # purpose of this route is to show(render) the user the login oage/form.

    get '/login' do
        erb :login
    end

        #this purpose of this route is to receive the login form
        # find the user and log the user in (creste a session)
    post '/login' do
            # params looks like: {email: "user@user.com", password: "password""}
            # Find the user
        @user = User.find_by(email: params[:email])
            #Authenticaste the user - verify the user is who they say they are
            # they have the credentials - email/password combo
            
        if @user && @user.authenticate(params[:password])
                # log the user in - create the user session
                
            session[:user_id] = @user.id #this is what is actually logging the user in
                # redirect to the user's landing page(show page)
            puts session
            redirect "/users/#{@user.id}"
        else
                    # tell the user they entered invalid credentials
                    # redirect them to the login page
            flash[:message] = "The email and/or password entered was not a match. Please try again."
            redirect '/login'
        end


    end


        # this route's job is to render the signup form
    get '/signup' do
            #erb (render) a view
        erb :signup
    end


    post '/signup' do
            # here is where we will create a new user
            # and persist the new user to the db
            #params will look like this: {
                # "name"=>"Samara",
                # "email"=>"sam@example.com", 
                # "password"=>"password"
            # }
            # I only want to persist a user that has a name,
            # email and a password
        if params[:name] != "" && params[:email] != "" && params[:password] != "" 
                # valid input
            @user = User.create(params)
            session[:user_id] = @user.id #actually logging the user in
                # where do I go now?
            redirect to "/users/#{@user.id}"
        else
                # not valid input
            redirect to '/signup'
                #it would be ideal to display a message
        end
    end

    #user SHOW route
    get '/users/:id' do
            #what do I need to do first?
        @user = User.find_by(id: params[:id])

        erb :'/users/show'
    end

    get '/logout' do
        session.clear
        redirect '/'
    end


end