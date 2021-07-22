# frozen_string_literal: true

class CreateTestModels < ActiveRecord::Migration[6.1]
  def change
    create_table :test_models do |t|
      t.string :name

      t.timestamps
    end
  end
end
