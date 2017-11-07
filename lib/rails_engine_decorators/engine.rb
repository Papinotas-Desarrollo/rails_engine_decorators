module RailsEngineDecorators
  module Engine
    extend ActiveSupport::Concern

    included do
      initializer 'rails_engine_decorators.load' do
        config.to_prepare do
          Dir.glob(Engine.root.join('app/decorators/**/*_decorator*.rb')).each do |c|
            require_dependency(c)
          end
        end
      end
    end
  end
end

::Rails::Engine.class_eval do
  include RailsEngineDecorators::Engine
end
