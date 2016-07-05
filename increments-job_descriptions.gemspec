$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'increments/job_descriptions/version'

Gem::Specification.new do |spec|
  spec.name          = 'increments-job_descriptions'
  spec.version       = Increments::JobDescriptions::VERSION
  spec.authors       = ['Konishi Tomoya', 'Yuku Takahashi', 'Hiroshige Umino', 'Takuya Oikawa']
  spec.email         = 'info@qiita.com'
  spec.summary       = 'Increments Job Descriptions'
  spec.homepage      = 'https://github.com/increments/increments-job_descriptions'
  spec.license       = 'CC0 1.0 Universal'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.0.0'

  spec.add_dependency 'qiita-markdown'
  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 11.2'
  spec.add_development_dependency 'redpen', '~> 0.1'
  spec.add_development_dependency 'rspec', '~> 3.5'
  spec.add_development_dependency 'rubocop', '~> 0.40.0'
end
