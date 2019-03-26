Rails.application.routes.draw do
  mount API::Init, at: "/"
  mount GrapeSwaggerRails::Engine, as: "doc_v1", at: "/documentation/v1"
end
