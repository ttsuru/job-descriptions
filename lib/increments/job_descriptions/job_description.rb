require 'qiita-markdown'

module Increments
  module JobDescriptions
    class JobDescription
      attr_reader :filename, :markdown

      # @param filename [String]
      # @param markdown [String]
      def initialize(filename, markdown)
        @filename = filename
        @markdown = markdown
      end

      # @return [String] markdown
      def to_s
        markdown
      end

      # @return [String] html
      def to_html
        processor.call(markdown)[:output].to_s
      end

      private

      def processor
        @processor ||= Qiita::Markdown::Processor.new
      end
    end
  end
end
