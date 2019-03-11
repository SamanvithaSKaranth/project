class Article < ActiveRecord::Base
  validates :title, presence:true, length:{minimum:2,maximum:20}
end