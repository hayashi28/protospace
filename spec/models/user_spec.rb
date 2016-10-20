require 'rails_helper'

describe User do
  describe '#create' do
    it "is invalid without a nickname, member, profile, works, password, password_confirmation" do
      user = build(:user, email: "ccc@ccc.com")
      expect(user).to be_valid
    end

    it "is invalid without a nickname" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a member" do
      user = FactoryGirl.build(:user, member: nil)
      user.valid?
      expect(user.errors[:member]).to include("can't be blank")
    end

    it "is invalid without a profile" do
      user = FactoryGirl.build(:user, profile: nil)
      user.valid?
      expect(user.errors[:profile]).to include("can't be blank")
    end

    it "is invalid without a member" do
      user = FactoryGirl.build(:user, works: nil)
      user.valid?
      expect(user.errors[:works]).to include("can't be blank")
    end

    it "is invalid with a duplicate email address" do
      user = FactoryGirl.create(:user, email: "p@ppp.com")
      another_user = FactoryGirl.build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "is invalid with a password that has less than 7 characters" do
      user = FactoryGirl.build(:user, password: "000", password_confirmation: "000", email: "rrr@rrr.com")
      user.valid?
      expect(user.errors[:password][0]).to include("is too short")
    end
  end
end
