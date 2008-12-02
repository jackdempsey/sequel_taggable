class CreateTags < Sequel::Migration
  def up
    create_table :tags do
      primary_key :id, :integer, :auto_increment => true
      integer :tag_id
      varchar :name

      index :tag_id
    end
    
    create_table :taggings do
      primary_key :id, :integer, :auto_increment => true
      integer :taggable_id
      varchar :taggable_type
      
      datetime :created_at
      index [:taggable_id, :taggable_type]
    end
  end

  def down
    drop_table :tags
    drop_table :taggings
  end
end
