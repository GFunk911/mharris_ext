# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{mharris_ext}
  s.version = "1.4.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mike Harris"]
  s.date = %q{2009-04-09}
  s.description = %q{TODO}
  s.email = %q{GFunk913@gmail.com}
  s.extra_rdoc_files = ["README", "LICENSE"]
  s.files = ["VERSION.yml", "lib/mharris_ext", "lib/mharris_ext/accessor.rb", "lib/mharris_ext/benchmark.rb", "lib/mharris_ext/class.rb", "lib/mharris_ext/cmd.rb", "lib/mharris_ext/enumerable.rb", "lib/mharris_ext/fileutils.rb", "lib/mharris_ext/from_hash.rb", "lib/mharris_ext/gems.rb", "lib/mharris_ext/methods.rb", "lib/mharris_ext/object.rb", "lib/mharris_ext/regexp.rb", "lib/mharris_ext/time.rb", "lib/mharris_ext.rb", "test/mharris_ext_test.rb", "test/test_helper.rb", "README", "LICENSE"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/GFunk911/mharris_ext}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{TODO}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<fattr>, [">= 0"])
      s.add_runtime_dependency(%q<facets>, [">= 0"])
    else
      s.add_dependency(%q<fattr>, [">= 0"])
      s.add_dependency(%q<facets>, [">= 0"])
    end
  else
    s.add_dependency(%q<fattr>, [">= 0"])
    s.add_dependency(%q<facets>, [">= 0"])
  end
end
