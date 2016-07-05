require 'pathname'
require 'increments/job_descriptions/job_description'

module Increments
  module JobDescriptions
    DOCUMENT_MARKDOWNS = %w(README.md).freeze

    class << self
      include Enumerable

      # @param filename [String]
      # @return [Increments::JobDescriptions::JobDescription, nil]
      def [](filename)
        return nil if DOCUMENT_MARKDOWNS.include?(filename)
        File.open(project_root.join(filename)) do |file|
          JobDescription.new(filename, file.read)
        end
      rescue Errno::ENOENT
        nil
      end

      # @yieldparam [Increments::JobDescriptions::JobDescription]
      def each
        keys.each { |filename| yield self[filename] }
      end

      # @return [Array<String>] an array of the name of job descriptions
      def keys
        @keys ||= markdown_filenames - DOCUMENT_MARKDOWNS
      end

      private

      def markdown_filenames
        Dir.glob(project_root.join('*.md'))
           .map { |path| path.split('/').last }
      end

      # @return [Pathname]
      def project_root
        Pathname.new(File.expand_path('../../../', __FILE__))
      end
    end
  end
end
