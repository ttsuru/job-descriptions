require 'redpen'

DEFAULT_LANG = 'en'
PROJECT_MARKDOWNS = %w(README.md)

task :redpen do
  error = false

  (Dir.glob('*.md') - PROJECT_MARKDOWNS).each do |target_file|
    match = /\.(?<lang>\w+)\.md$/.match(target_file)
    lang = match ? match[:lang].downcase : DEFAULT_LANG
    config_file = "./config/redpen/#{lang}.xml"
    redpen = Redpen.check(config_file, target_file, format: 'markdown')
    unless redpen.valid?
      redpen.messages.each do |message|
        puts message
      end
      error = true
    end
  end

  exit 1 if error
end

task default: [:redpen]
