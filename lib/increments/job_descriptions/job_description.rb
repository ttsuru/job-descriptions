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
        @processor ||= Processor.new
      end

      class Processor < Qiita::Markdown::Processor
        def filters # rubocop:disable Metrics/MethodLength
          [
            Qiita::Markdown::Filters::Greenmat,
            Qiita::Markdown::Filters::ImageLink,
            Qiita::Markdown::Filters::Footnote,
            Qiita::Markdown::Filters::Code,
            Qiita::Markdown::Filters::Checkbox,
            Qiita::Markdown::Filters::Emoji,
            Qiita::Markdown::Filters::SyntaxHighlight,
            Qiita::Markdown::Filters::Mention,
            Qiita::Markdown::Filters::GroupMention,
            Qiita::Markdown::Filters::Sanitize
          ]
        end
      end
    end
  end
end
