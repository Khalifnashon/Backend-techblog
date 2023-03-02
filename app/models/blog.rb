class Blog < ActiveRecord::Base
    has_many :reviews, dependent: :destroy
    has_many :readers, through: :reviews
end

# The dependent destroy allows us to delete a blog as well as its reviews.
# In this example, we're adding a has_many :readers, through: :reviews association to the Blog
# model. This allows us to retrieve all the Readers who have written Reviews for a 
# particular Blog using the readers association.

# We can also use this association to create new Reviews for a Blog with a specific Reader. 

# blog = Blog.find(1)
# reader = Reader.find(1)
# blog.reviews.create(reader: reader, content: "Great post!", rating: 5)