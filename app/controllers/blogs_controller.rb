class PostsController < ApplicationController
    # Routings
    get "/blogs" do
        Blog.all.to_json
    end

    get "/blogs/:id" do
        count_blogs = Blog.where(id: params[:id]).count()
        if count_blogs > 0
            blogs = Blog.find(params[:id])
            blogs.to_json
        else
            message = {:error => "blog not found"}
            message.to_json
        end
    end

    # add new blog
    post "/blogs" do
        title = params[:title]
        body = params[:body]
        author = params[:author]
        image = params[:image]

        if (title.present? && body.present? && author.present? && image.present?)
            blog = Blog.create(title: params[:title], body: params[:body], author: params[:author], image: params[:image])
        if blog
          message = {:success => "blog created successfully"}
          message.to_json
        else
          message = {:errors => "Error saving blog" }
          message.to_json
        end
    end   
      
    delete "/blogs/:id" do
        blog = Blog.find_by(id: params[:id])
        if blog
          blog.destroy
          status 204 # No content
        else
          status 404 # Not found
        end
    end
      


end