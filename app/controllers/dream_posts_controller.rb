class DreamPostsController < ApplicationController
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
        erb :'/dream_posts/edit'
    end

    # index route for all dream posts
end