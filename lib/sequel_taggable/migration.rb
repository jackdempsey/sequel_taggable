class CreateTags < Sequel::Migration
  def up
    create_table :tags do
      primary_key :id, :integer, :auto_increment => true
      varchar :name, :null => false
    end
    
    create_table :taggings do
      primary_key :id, :integer, :auto_increment => true
      integer :tag_id, :null => false
      integer :taggable_id, :null => false
      varchar :taggable_type, :null => false
      varchar :tag_context, :null => false
      
      datetime :created_at
      index [:tag_id, :taggable_id, :taggable_type]
    end
  end

  def down
    drop_table :tags
    drop_table :taggings
  end
end
