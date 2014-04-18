module Aptible
  module Api
    class Disk < Resource
      belongs_to :account
      belongs_to :database
      has_many :operations
      has_many :permissions
    end
  end
end
