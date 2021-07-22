# frozen_string_literal: true

RSpec.describe 'TestModelページ', type: :system do
  describe 'indexページが開ける' do
    let!(:test_models) { create_list(:test_model, 5) }

    before do
      visit '/test_models'
    end

    example do
      test_models.map do |test_model|
        expect(page).to have_content(test_model.name)
      end
    end
  end
end
