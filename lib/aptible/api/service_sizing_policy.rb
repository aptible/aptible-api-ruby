module Aptible
  module Api
    class ServiceSizingPolicy < Resource
      belongs_to :account
      has_many :services

      field :id
      field :created_at, type: Time
      field :updated_at, type: Time

      field :scaling_enabled
      field :default_policy
      field :metric_lookback_seconds
      field :percentile
      field :post_scale_up_cooldown_seconds
      field :post_scale_down_cooldown_seconds
      field :post_release_cooldown_seconds
      field :mem_cpu_ratio_r_threshold
      field :mem_cpu_ratio_c_threshold
      field :mem_scale_up_threshold
      field :mem_scale_down_threshold
      field :minimum_memory
      field :disable_recommendations
      field :maximum_memory
      field :cpu_consideration_threshold
      field :autoscaling
      field :min_cpu_threshold
      field :max_cpu_threshold
      field :min_containers
      field :max_containers
    end
  end
end
