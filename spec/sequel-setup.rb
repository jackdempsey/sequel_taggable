DB = Sequel.sqlite
 
require File.dirname(__FILE__) + '/../lib/sequel_taggable/migration'
CreateTags.apply(DB, :up)

#DB["select * from sqlite_master"].print


class ExampleModel < Sequel::Model
  set_schema do
    primary_key :id
    varchar :name
  end

  is :taggable
end

ExampleModel.create_table!
