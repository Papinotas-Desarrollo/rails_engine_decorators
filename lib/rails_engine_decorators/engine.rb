module RailsEngineDecorators
  module Engine
    extend ActiveSupport::Concern

    included do
      initializer 'rails_engine_decorators.load' do
        engine_root_path = config.root
        config.to_prepare do
          Dir.glob("#{engine_root_path}/app/decorators/**/*_decorator*.rb").each do |c|
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
