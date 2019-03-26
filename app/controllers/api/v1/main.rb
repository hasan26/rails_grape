require "grape-swagger"
module API
  module V1
    class Main < Grape::API
      # Default Config API
      include API::V1::Config

      prefix :api
      version 'v1', using: :path

      # Exception Handlers
      include API::V1::ExceptionHandlers

      # Helpers
      include API::V1::Helpers

      # Mounting Modules Api
      mount API::V1::HelloWorlds::Routes

      # Swagger config
      add_swagger_documentation(
          api_version:             'v1',
          doc_version:             'v1',
          hide_documentation_path: true,
          mount_path:              "documentation/json",
          hide_format:             true,
          host:                    ENV['HOST']
      )
    end
  end
end
