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

      def link_to(value, *args, &block)
        options = args.extract_options!
        apply_active_options(value, options)
        helper.link_to(*args, options, &block)
      end

      def content_tag(value, tag_name, options = {}, &block)
        apply_active_options(value, options)
        helper.content_tag(tag_name, options, &block)
      end

      def apply_active_options(value, options)
        if match?(value)
          if options[:class]
            options[:class] += " #{active_class}"
          else
            options[:class] = "#{active_class}"
          end
        end

        @empty = false
      end

      def match?(value)
        case value
        when Regexp
          value.match(current)
        else
          value.to_s == current.to_s
        end
      end
    end
  end
end
