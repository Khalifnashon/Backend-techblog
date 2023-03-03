class BlogsController < ApplicationController
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

    get "/blogs/:id/reviews" do
        count_blogs = Blog.where(id: params[:id]).count()
        if count_blogs > 0
            blogs = Blog.find(params[:id])
            blogs = blogs.reviews
            blogs.to_json(include:{reader:{only: [:name]}})
            # blogs.to_json(include: { 
            #     reviews: { 
            #         include: { 
            #             reader: { only: [:name] } 
            #         } 
            #     } 
            # })
        else
            message = {:error => "blog not found"}
            message.to_json
        end
    end

    get '/app_reviews' do
        AppReview.all.to_json(only: [:comment], include: {user: {only: [:id, :username]}})
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
    end
    
    delete "/blogs/:id" do
        count_blogs = Blog.where(id: params[:id]).count() #Integer 2,3,4,5
        if count_blogs > 0
            blog = Blog.find(params[:id])
            blog.destroy
            message = {:succcess => "Blog deleted successfully!!"}
            message.to_json

        else
            message = {:error => "Blog does not exist!"}
            message.to_json
        end
    end
      
end