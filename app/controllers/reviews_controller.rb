class ReviewsController < ApplicationController
    # get all reviews
    get '/reviews' do
      reviews = Review.all
      reviews.to_json
    end
  
    # create a new review
    post '/reviews' do
      comment = params[:comment]
      user = params[:user]
      rating = params[:rating]
      blog = params[:blog]
  
      if comment.present? && user_id.present? && rating.present? && blog_id.present?
        review = Review.create(comment: comment, rating: rating, blog_id:post , user_id:user)
        if review
          { :success => 'Review created successfully!' }.to_json
        else
          { :error => 'Error saving review' }.to_json
        end
      else
        { :error => 'All fields should be filled!' }.to_json
      end
    end
  
    # delete a review
    delete '/reviews/:id' do
      count_reviews = Review.where(id: params[:id]).count()
      if count_reviews > 0
        review = Review.find(params[:id])
        review.destroy
        { success: 'Review deleted successfully!' }.to_json
      else
        { error: 'Review does not exist!' }.to_json
      end
    end
end
  