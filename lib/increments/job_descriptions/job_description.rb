require 'qiita-markdown'

module Increments
  module JobDescriptions
    class JobDescription
      TITLE_REGXPT = /#\s*(?<title>.+)/

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

      # @return [String, nil] the job title
      def title
        return unless (match = markdown.split("\n").first.match(TITLE_REGXPT))
        match[:title]
      end

      private

      def processor
        @processor ||= Qiita::Markdown::Processor.new
      end
    end
  end
end
