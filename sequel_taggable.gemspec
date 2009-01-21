# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{sequel_taggable}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jack Dempsey"]
  s.autorequire = %q{sequel_taggable}
  s.date = %q{2009-01-20}
  s.description = %q{A gem that provides Sequel::Models with tagging capabilities}
  s.email = %q{jack.dempsey@gmail.com}
  s.extra_rdoc_files = ["README.markdown", "LICENSE", "TODO"]
  s.files = ["LICENSE", "README.markdown", "TODO", "lib/sequel_taggable", "lib/sequel_taggable/migration.rb", "lib/sequel_taggable/sequel_taggable.rb", "lib/sequel_taggable/tag.rb", "lib/sequel_taggable/tagging.rb", "lib/sequel_taggable.rb"]
  s.homepage = %q{http://jackndempsey.blogspot.com}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A gem that provides Sequel::Models with tagging capabilities}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sequel_polymorphic>, [">= 0"])
    else
      s.add_dependency(%q<sequel_polymorphic>, [">= 0"])
    end
  else
    s.add_dependency(%q<sequel_polymorphic>, [">= 0"])
  end
end
