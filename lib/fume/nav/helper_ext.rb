require "hashie"

module Fume
  module Nav
    module HelperExtensions
      def fume_nav(*args, &block)
        attributes = {
          active_class: "active",
          hide_if_empty: true
        }.merge(args.extract_options!)

        attributes[:current] = args.shift
        attributes[:helper] = self
        tag = NavTag.new(attributes)
        content = capture(tag, &block)

        return content if !tag.hide?
      end
      
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
          self.content_tag(value, :li, options, &block)
        end

        def content_tag(value, tag_name, options = {}, &block)
          if value == current
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
end