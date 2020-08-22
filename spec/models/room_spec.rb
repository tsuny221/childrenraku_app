require 'rails_helper'

RSpec.describe 'Roomモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { test_room.valid? }

    let(:admin) { FactoryBot.create(:admin) }
    let!(:room) { FactoryBot.create(:room, admin_id: admin.id) }

    context 'nameカラム' do
      let(:test_room) { room }

      it '空欄でないこと' do
        test_room.name = ''
        is_expected.to eq false
      end
    end

    context 'keyカラム' do
      let(:test_room) { room }

      it '空欄でないこと' do
        test_room.key = ''
        is_expected.to eq false
      end
    end

    describe 'アソシエーションのテスト' do
      context 'Userモデルとの関係' do
        it 'N:1となっている' do
          expect(Room.reflect_on_association(:users).macro).to eq :has_many
        end
      end
    end
  end
end
