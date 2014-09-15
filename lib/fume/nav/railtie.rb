require "rails/railtie"
require "fume/nav/helper_ext"

module Fume
  module Nav
    class Railtie < ::Rails::Railtie
      initializer 'fume.initialize', after: :after_initialize do |app|
        ::ActionView::Base.send :include, HelperExt
      end
    end
  end
end
