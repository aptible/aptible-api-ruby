module Aptible
  module Api
    class Image < Resource
      belongs_to :app
      has_many :operations
      has_many :container_vulnerability_scan_results

      field :id
      field :git_repo
      field :git_ref
      field :docker_repo
      field :docker_ref
      field :dualstack_hint
      field :platform
      field :release
      field :scan
      field :created_at, type: Time
      field :updated_at, type: Time
    end
  end
end
