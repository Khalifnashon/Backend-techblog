class Reader < ActiveRecord::Base
   has_many :reviews, dependent: :destroy
   has_many :blogs, through: :reviews
end

# You can also retrieve all the Blogs that a Reader has written Reviews for using
# a similar has_many :through association in the Reader model: