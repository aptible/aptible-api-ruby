module Aptible
  module Api
    class AmiRelease < Resource
      embeds_many :amis

      field :id
      field :channel
      field :current, type: Aptible::Resource::Boolean
      field :created_at, type: Time
      field :updated_at, type: Time
    end
  end
end
