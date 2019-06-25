require 'rails_helper'

RSpec.describe Experience, type: :model do
  let(:valid_attributes) {
    {
        title: 'My testing experience',
        first_day: '09/07/2019',
        company: 'Fantasy Company'
    }
  }

  describe "Validations" do

    context "when all necessary data is present" do
      it "generates a new instance" do
        expect(
          Experience.new(valid_attributes).valid?
        ).to be_truthy
      end
    end

    context "when no title is given" do
      it "produces a title error" do
        valid_attributes.delete(:title)
        expect(
            Experience.create(valid_attributes)
                .errors.messages
        ).to have_key :title
      end
    end

    context "when no first day is given" do
      it "produces a first day error" do
        valid_attributes.delete(:first_day)
        expect(
            Experience.create(valid_attributes)
                .errors.messages
        ).to have_key :first_day
      end
    end

    context "when no company name is given" do
      it "produces a company error" do
        valid_attributes.delete(:company)
        expect(
            Experience.create(valid_attributes)
                .errors.messages
        ).to have_key :company
      end
    end

    context "when a lastr day is given" do
      it "cannot validate a last day before the first one" do
        e = Experience.create(valid_attributes)
        e.last_day = '08/07/2019'
        expect(e.valid?).to be_falsey
      end

      it "cannot validate a last day with invalid format" do
        e = Experience.create(valid_attributes)
        e.last_day = '08-10-2019'
        expect(e.valid?).to be_falsey
      end
    end
  end
end
