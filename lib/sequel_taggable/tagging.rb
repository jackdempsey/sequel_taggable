class Tagging < Sequel::Model
  many_to_one :tag

  # def taggable
  #   eval("#{taggable_type}.get!(#{taggable_id})") if taggable_type and taggable_id
  # end
end
