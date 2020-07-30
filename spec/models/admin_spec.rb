require 'rails_helper'

RSpec.describe 'Adminモデルのテスト', type: :model do

  describe 'バリデーションのテスト' do
    let(:admin) { FactoryBot.create(:admin) }
    subject { test_admin.valid? }
    context 'nameカラム' do
      let(:test_admin) { admin }
      it '空欄でないこと' do
        test_admin.name = ''
        is_expected.to eq false;
      end
    end
    describe 'アソシエーションのテスト' do
    context 'Roomモデルとの関係' do
      it '1:1となっている' do
        expect(Admin.reflect_on_association(:room).macro).to eq :has_one
      end
     end
    end
  end
end
