module Aptible
  module Api
    class LogDrainBackend < Resource
      has_many :log_drains

      field :id
      field :current, type: Aptible::Resource::Boolean
      field :channel
      field :gentlemanjerry_image
      field :gentlemanjerry_tag
      field :joecool_image
      field :joecool_tag
      field :created_at, type: Time
      field :updated_at, type: Time
    end
  end
end
