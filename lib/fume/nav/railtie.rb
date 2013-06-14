require "rails/railtie"

module Fume
  module Nav
    class Railtie < ::Rails::Railtie
      initializer 'fume.initialize', :after => :after_initialize do |app|
        ::ActionView::Base.send :include, HelperExtensions
      end
    end
  end
end
