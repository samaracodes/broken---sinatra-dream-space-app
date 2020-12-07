class DreamPostsController < ApplicationController
    # index route for all dream posts
    get '/dream_posts' do
        @dream_posts = DreamPost.all
        #local variables(without @) are block scope variables
        #instance variables are scroped to the instance 
        #of the class it's written in
        erb :'/dream_posts/index'
    end


    # get dream_posts/new to render a form to create a new 
    # entry
    get '/dream_posts/new' do
       erb :'/dream_posts/new'
    end

    # post dream_posts to create a new dream post
    post "/dream_posts" do
        # we want to create a new dream post and save it to the DB. 
        # I also only want to create a dream post if a user is logged in. 
        if !logged_in?
            redirect '/'
        end
        # I only want to save the post if it has some content. 
        if params[:content] != ""
            #create a new post
            @dream_post = DreamPost.create(content: params[:content], user_id: current_user.id)
            redirect "/dream_posts/#{@dream_post.id}"
        else
            redirect '/dream_posts/new'
        end
    end

    # show route for a dream posts
    get '/dream_posts/:id' do
        @dream_post = DreamPost.find(params[:id])
        erb :'/dream_posts/show'
    end

    get '/dream_posts/:id/edit' do
        #this route should send us to dream_posts/edit.erb
        # which will render an edit form
        set_dream_post
        if logged_in?
            if @dream_post.user == current_user
                erb :'/dream_posts/edit'
            else
                redirect "/users#{current_user.id}"
            end
        else
            redirect '/'
        end
    end

    patch "/dream_posts/:id" do 
        #This action's job is to :
        # 1) Find the dream post
        set_dream_post
        if logged_in?
            if @dream_post.user == current_user
                # 2) Modify the dream post
                @dream_post.update({content: params[:content]})
                # 3) Redirect to the show page  
                redirect "/dream_posts/#{@dream_post.id}"
            else
                redirect "/users/#{current_user.id}"
            end
        else
            redirect '/'
        end
    end

    private

    def set_dream_post
        
        @dream_post = DreamPost.find(params[:id])
    end
end