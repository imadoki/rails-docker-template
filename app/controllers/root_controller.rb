# frozen_string_literal: true

class RootController < ApplicationController
  def index
    # test session
    session[:random_number] ||= Random.rand(100)
  end
end
