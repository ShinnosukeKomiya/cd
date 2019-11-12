require 'rails_helper'
RSpec.feature "Orders", type: :feature do

  describe "購入確認画面へ行って" do

    let!(:user) { FactoryBot.create(:user) }
    let!(:genre) { FactoryBot.create(:genre) }
    let!(:cd) { FactoryBot.create(:cd) }
    let!(:stock) { FactoryBot.create(:stock) }
    let!(:cart) { FactoryBot.create(:cart) }
    let!(:line_item) { FactoryBot.create(:line_item) }
    let!(:order) { FactoryBot.create(:order) }
    #let!(:params) {{:user_id user.id}}
    #let!(:session) {{:user_id user.id, :cart_id cart.id}}
end
#    before do
#      sign_in_as user
#      visit new_order_path
#    end

  #  # 新規登録ページに"Sign up"と表示されていること
#    it "商品名が表示されており、" do
#      expect(page).to have_content "Sign"
#    end#

#    # タイトルが正しく表示されていること
#    it "should have the right title" do
#      expect(page).to have_title full_title('')
#    end
#  end
end
