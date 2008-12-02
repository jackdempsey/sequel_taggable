class Tag < Sequel::Model
  one_to_many :taggings

  # def taggables
  #   taggings.map{|tagging| tagging.taggable}
  # end
end
