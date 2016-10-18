require 'rails_helper'

describe PrototypeImage do
    describe '#create' do
      it 'has the wrong content format' do
        image = FactoryGirl.build(:prototype_image, image: "")
        image.valid?
        expect(image.errors[:image]).to include("can't be blank")
      end

    describe 'with valid attributes' do
      it 'has a valid factory' do
        image = FactoryGirl.build(:prototype_image)
        expect(image.valid?).to eq(true)
      end
    end

    describe 'without content attribute' do
      let(:image) { FactoryGirl.build(:prototype_image, role: nil) }
      it 'returns error' do
        image.valid?
        expect(image.errors[:role]).to include("can't be blank")
      end
    end

    describe '#with association' do
      let(:prototype) { FactoryGirl.create(:prototype) }
      let(:image) { FactoryGirl.create(:prototype_image, :main, prototype: prototype) }
      it 'is associated with a prototype' do
        expect(image.prototype).to eq prototype
      end
    end
  end
end