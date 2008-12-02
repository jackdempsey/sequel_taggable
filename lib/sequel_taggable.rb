$:.unshift(File.dirname(__FILE__)) unless
$:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'sequel_taggable/tag'
require 'sequel_taggable/tagging'
require 'sequel_taggable/sequel_taggable'
