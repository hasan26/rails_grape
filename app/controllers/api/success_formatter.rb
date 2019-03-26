module API
  module SuccessFormatter
    def self.call object, env
      response = {
          :data => object
      }

      if env['api.endpoint'].header.present?
        response[:meta] = {
            :page => env['api.endpoint'].header['X-Page'],
            :per_page => env['api.endpoint'].header['X-Per-Page'],
            :total => env['api.endpoint'].header['X-Total'],
            :links => MetaPagination.links(env)
        }
      end

      return response.to_json
    end
  end
end
