class Tagging < Sequel::Model
  many_to_one :tag
  
  validates_presence_of :tag_id, :taggable_id, :taggable_type, :tag_context

  def taggable
    eval("#{taggable_type}.get!(#{taggable_id})") if taggable_type and taggable_id
  end
end
