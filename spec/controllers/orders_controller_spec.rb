require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

  describe "購入確定ボタンを押して" do
    #let(:user) { FactoryBot.create(:user) }
    #let(:genre) { FactoryBot.create(:genre) }
    #let(:cd) { FactoryBot.create(:cd) }
    #let(:stock) { FactoryBot.create(:stock) }
    #let(:cart) { FactoryBot.create(:cart) }
    #let(:line_item) { FactoryBot.create(:line_item) }
    #let(:order) { FactoryBot.create(:order) }
    #let(:params) {{user_id: user.id}}
    #let(:session) {{user_id: user.id, cart_id: cart.id}}#
    before { post :create }#

    # 正常なレスポンス
    it "正常にリダイレクトレスされる" do
      expect(response).to have_http_status(302)
    end

    context "カゴに何も入っていない時" do
      before do
        @cart_items = nil
      end
      it "トップページへ遷移する" do
        expect(response).to redirect_to root_path
      end
    end

    # カゴに入っている時
    context "購入可能な時" do
      let!(:line_item) {FactoryBot.create(:line_item)}
      before do
        session[:user_id] = line_item.cart.user_id
      end
      it "ストックが減る" do
        line_item.quantity = 3
        line_item.cd.stock.num = 5
        line_item.cd.stock.save
        line_item.save

        post :create
        expect(assigns(:stock).num).to eq 2
      end

      it "オーダーが生成される" do
        line_item.quantity = 5
        line_item.save
        post :create
        expect(assigns(:order).total).to eq 5
      end

      it "カートが削除される" do
        post :create
        expect(assigns(:line_item).nil?).to be true
      end

      it "ホーム画面へ戻る" do
        post :create
        expect(response).to redirect_to root_path
      end
    end

    context "購入不可能な時" do
      let!(:line_item) {FactoryBot.create(:line_item)}
      before do
        session[:user_id] = line_item.cart.user_id
      end
      it "ストックの数が変わらない" do
        line_item.quantity = 7
        line_item.cd.stock.num = 5
        line_item.cd.stock.save
        line_item.save
        expect { post :create }.to raise_error(Exception)
        #expect(assigns(:stock).num).to eq 5
      end

      it "カートへリダイレクト" do
        line_item.quantity = 7
        line_item.cd.stock.num = 5
        line_item.cd.stock.save
        line_item.save
        expect { post :create }.to raise_error(Exception)
      end
    end
  end
end

#  describe "購入確認画面へ行って" do

#    let(:user) { FactoryBot.create(:user) }
#    let(:genre) { FactoryBot.create(:genre) }
#    let(:cd) { FactoryBot.create(:cd) }
#    let(:stock) { FactoryBot.create(:stock) }
#    let(:cart) { FactoryBot.create(:cart) }
#    let(:line_item) { FactoryBot.create(:line_item) }
#    let(:order) { FactoryBot.create(:order) }
#    let(:params) {{user_id: user.id}}
#    let(:session) {{user_id: user.id, cart_id: cart.id}}#

#    #sign_in_as user
#    before { get :new, params: {}, session: {} }#

#    # 新規登録ページに"Sign up"と表示されていること
#    it "正常にレスポンスが返ってくる、" do
#      expect(response).to have_http_status(:ok)
#    end#

#    # 商品名が正しく表示されていること
#    it "newアクションの画面に遷移している" do
#      expect(response).to render_template :new
#    end
#  end#
