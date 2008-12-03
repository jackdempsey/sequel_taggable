class Tag < Sequel::Model
  one_to_many :taggings
  
  validates_presence_of :name

end
