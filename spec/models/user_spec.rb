require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do

  describe 'バリデーションのテスト' do
    let(:user) { FactoryBot.create(:user) }
    subject { test_user.valid? }
    context 'first_nameカラム' do
      let(:test_user) { user }
      it '空欄でないこと' do
        test_user.first_name = ''
        is_expected.to eq false;
      end
    end
    context 'last_nameカラム' do
      let(:test_user) { user }
      it '空欄でないこと' do
        test_user.last_name = ''
        is_expected.to eq false;
      end
    end
    context 'first_name_kanaカラム' do
      let(:test_user) { user }
      it '空欄でないこと' do
        test_user.first_name_kana = ''
        is_expected.to eq false;
      end
      it 'カタカナであること' do
        test_user.first_name_kana = 'てすと'
        is_expected.to eq false;
      end
    end
    context 'last_name_kanaカラム' do
      let(:test_user) { user }
      it '空欄でないこと' do
        test_user.first_name_kana = ''
        is_expected.to eq false;
      end
      it 'カタカナであること' do
        test_user.last_name_kana = 'てすと'
        is_expected.to eq false;
      end
    end
    context 'last_name_kanaカラム' do
      let(:test_user) { user }
      it '空欄でないこと' do
        test_user.first_name_kana = ''
        is_expected.to eq false;
      end
      it 'カタカナであること' do
        test_user.last_name_kana = 'てすと'
        is_expected.to eq false;
      end
    end
    describe 'アソシエーションのテスト' do
    context 'Roomモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:room).macro).to eq :belongs_to
      end
     end
    end
  end
end
