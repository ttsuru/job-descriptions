require 'bundler/gem_tasks'
require 'redpen'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RSpec::Core::RakeTask.new(:spec)
RuboCop::RakeTask.new

DEFAULT_LANG = 'en'.freeze
PROJECT_MARKDOWNS = %w(README.md).freeze

task :redpen do
  error = false

  (Dir.glob('*.md') - PROJECT_MARKDOWNS).each do |target_file|
    match = /\.(?<lang>\w+)\.md$/.match(target_file)
    lang = match ? match[:lang].downcase : DEFAULT_LANG
    config_file = "./config/redpen/#{lang}.xml"
    redpen = Redpen.check(config_file, target_file, format: 'markdown')
    next if redpen.valid?
    redpen.messages.each { |message| puts message }
    error = true
  end

  exit 1 if error
end

task default: [:rubocop, :spec, :redpen]
