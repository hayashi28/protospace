require 'rails_helper'

describe Prototype do
  describe 'with comments' do
    let!(:prototype) { create(:prototype) }
    it "deletes the comments when prototype is deleted" do
      comment = create(:comment, prototype: prototype)
      expect { prototype.destroy }.to change{ Comment.count }.by(-1)
    end
  end

  describe 'with likes' do
    it 'deletes the likes when Prototype is deleted' do
      prototype = build(:prototype)
      like = create(:like, prototype: prototype)
      expect { prototype.destroy }.to change { Like.count }.by(-1)
    end
  end

  describe 'validations' do
    describe 'with valid attributes' do
      it 'has a valid factory' do
        prototype = build(:prototype)
        expect(prototype).to be_valid
      end
    end

    describe 'without valid attributes' do
      it 'is missing a title' do
        prototype = build(:prototype, title: "")
        prototype.valid?
        expect(prototype.errors[:title]).to include("can't be blank")
      end

      it 'is missing a catch_copy' do
        prototype = build(:prototype, catchcopy: "")
        prototype.valid?
        expect(prototype.errors[:catchcopy]).to include("can't be blank")
      end

      it 'is missing a concept' do
        prototype = build(:prototype, concept: "")
        prototype.valid?
        expect(prototype.errors[:concept]).to include("can't be blank")
      end
    end
  end

  describe '#liked_by?(user)' do
    describe 'when liked by a user' do
      it 'returns true' do
        prototype = create(:prototype)
        prototype.likes.create
        expect(prototype).to be_valid
      end
    end

    describe 'when not liked by a user' do
      it 'returns nill' do
        user = create(:user, nickname: 'aaa')
        like = create(:like, user_id: 'nil')
        expect(Like.find_by(user_id: user.id)).to be_falsey
      end
    end
  end
end

