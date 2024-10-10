# frozen_string_literal: true

require_relative "lib/replica/version"

Gem::Specification.new do |spec|
  spec.name = "replica"
  spec.version = Replica::VERSION
  spec.authors = ["Waruna de Silva"]
  spec.email = ["warunacds@gmail.com"]

  spec.summary = "Rack based Ruby web framework."
  spec.description = "Rack based Ruby webframework. Closley follows Ruby on Rails architecture model. Hence the name replica. I'm building to learn deep architecutre of ruby on rails. Not intend for production use."
  spec.homepage = "https://github.com/warunacds"
  spec.required_ruby_version = ">= 3.0.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # register a new dependency of your gem
  spec.add_dependency "rack", "~> 3.0.9.1"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
