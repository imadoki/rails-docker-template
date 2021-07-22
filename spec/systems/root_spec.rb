# frozen_string_literal: true

RSpec.describe 'Rootページ', type: :system do
  describe 'Rootページが開ける' do
    before do
      visit '/'
    end

    example do
      expect(page).to have_content('Rootページ')
    end
  end
end
