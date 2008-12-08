class Tagging < Sequel::Model
  is :polymorphic
  many_to_one :tag
  many_to_one :taggable, :polymorphic => true
  
  validates_presence_of :tag_id, :taggable_id, :taggable_type#, :tag_context

#  def taggable
#    eval("#{taggable_type}.get!(#{taggable_id})") if taggable_type and taggable_id
#  end
end
