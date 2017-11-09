require 'rails/engine/configuration'

# Adds decorators to paths currently set in configuration.
module EngineConfigurationWithDecorators
  def paths
    paths = super
    paths.add "app/decorators", :eager_load => true
    paths
  end
end

Rails::Engine::Configuration.prepend(EngineConfigurationWithDecorators)