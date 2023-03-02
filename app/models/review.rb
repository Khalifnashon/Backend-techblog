class Comment < ActiveRecord::Base
    belongs_to :reader
    belongs_to :blog
 end