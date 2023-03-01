module Aptible
  module Api
    class CodeScanResult < Resource
      belongs_to :app
      belongs_to :operation

      field :id
      field :dockerfile_present
      field :procfile_present
      field :aptible_yml_present
      field :git_ref
      field :git_commit

      field :created_at, type: Time
      field :updated_at, type: Time
      field :deleted_at, type: Time
    end
  end
end
