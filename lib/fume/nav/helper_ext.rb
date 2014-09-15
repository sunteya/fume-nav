require "fume/nav/nav_tag"

module Fume
  module Nav
    module HelperExt
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

    end
  end
end
