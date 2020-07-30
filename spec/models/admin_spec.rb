require 'rails_helper'

RSpec.describe Admin, type: :model do

  context "データが正しく保存される" do
    before do
      @admin = Admin.new
      @admin.name = "admin"
      @admin.email = "test@admin.com"
      @admin.password = "111111"
      @admin.password_confirmation = "111111"
      @admin.save
    end
    it "全て入力してあるので保存される" do
      expect(@admin).to be_valid
    end
  end

  context "データが正しく保存されない" do
    before do
      @admin = Admin.new
      @admin.name = ""
      @admin.email = "test@admin.com"
      @admin.password = "111111"
      @admin.password_confirmation = "111111"
      @admin.save
    end
    it "nameが入力されていないので保存されない" do
      expect(@admin).to be_invalid
      expect(@admin.errors[:name]).to include("を入力してください", "は2文字以上で入力してください")
    end
  end

end
