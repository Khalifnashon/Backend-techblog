# Backend-techblog
# TechBlog API
#### 01/03/2023
#### By Khalif Nhashon

This is the API for TechBlog, a blogging platform for technology enthusiasts. The API is built using Sinatra, a lightweight Ruby web framework. It provides endpoints to create, read, update, and delete blog posts, as well as to read reviews for each blog post.

## Getting started
To get started with the TechBlog API, follow the steps below:

    - Clone the repository: git clone https://github.com/your-username/techblog-api.git
    - Install the dependencies: bundle install
    - Create the database: rake db:create
    - Run the database migrations: rake db:migrate
    - Start the server: rackup config.ru
    - You should now be able to access the API at http://localhost:9292.

    #### Requirement
    React app
    link to react app: [https://techxtrablog.netlify.app]

## Endpoints
The following endpoints are available in the TechBlog API:

#### Blogs
    - GET /blogs : Returns a list of all blog posts.
    - GET /blogs/:id: Returns a specific blog post with the specified ID.
    - POST /blogs : Creates a new blog post. The request body should include the following  parameters:  
        title: the title of the blog post (required) ,
        body: the content of the blog post (required) ,
        author: the author of the blog post (required), 
        image: the URL of the image to be displayed with the blog post (optional)
    - DELETE /blogs/:id: Deletes the blog post with the specified ID.

#### Reviews
    - GET /blogs/:id/reviews: Returns a list of all reviews for the blog post with the specified ID.
    - POST /blogs/:id/reviews : Creates a new review for the blog post with the specified ID. The request body should include the following parameters:
        comment: the comment left by the reader (required)
        rating: the rating given by the reader (required)
        reader_id: the ID of the reader leaving the review (required)
    - DELETE /blogs/:id/reviews/:review_id :Deletes the review with the specified ID for the blog post with the specified ID.

## Authentication
The TechBlog API does not currently support authentication or authorization. Anyone can create, read, update, and delete blog posts and reviews. This is intentional, as the focus of the API is to provide a simple way to interact with the data for development and learning purposes.

## Conclusion
The TechBlog API provides a simple way to interact with blog post and review data for technology enthusiasts. The endpoints are straightforward and easy to use, and the lack of authentication and authorization makes it easy to get started with the API for development and learning purposes.