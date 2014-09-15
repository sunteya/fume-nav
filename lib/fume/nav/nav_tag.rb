module Fume
  module Nav
    class NavTag
      attr_accessor :helper, :current, :active_class, :hide_if_empty

      def initialize(attributes = {})
        attributes.each_pair do |name, value|
          send("#{name}=", value)
        end
        @empty = true
      end

      def hide?
        hide_if_empty && @empty
      end

      def li_tag(value, options = {}, &block)
        content_tag(value, :li, options, &block)
      end

      def content_tag(value, tag_name, options = {}, &block)
        match = case value
                when Regexp
                  value.match(current)
                else
                  value.to_s == current.to_s
                end

        if match
          if options[:class]
            options[:class] += " #{active_class}"
          else
            options[:class] = "#{active_class}"
          end
        end

        @empty = false
        helper.content_tag(tag_name, options, &block)
      end
    end
  end
end
