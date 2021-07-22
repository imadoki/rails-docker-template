# frozen_string_literal: true

class TestModelsController < ApplicationController
  def index
    @test_models = TestModel.all
  end
end
