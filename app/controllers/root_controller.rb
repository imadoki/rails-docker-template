# frozen_string_literal: true

class RootController < ApplicationController
  def index
    # test session
    session[:random_number] ||= Random.rand(100)
    @raw_cache = Rails.cache.fetch('root_cache', expire_in: 12.hours) do
      Random.rand(100)
    end
  end
end
