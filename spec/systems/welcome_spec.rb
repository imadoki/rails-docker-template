RSpec.describe 'Welcomeページ', type: :system do
  describe 'welcomeページが開ける' do
    before do
      visit '/'
    end

    example do
      expect(page).to have_content('')
    end
  end
end