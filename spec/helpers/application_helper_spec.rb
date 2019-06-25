require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do

  describe "#validation_errors" do

    context "given password and app key match" do
      it "should return an empty error hash" do
        password = ENV['APP_KEY']
        expect(validation_errors(password)).to be {}
      end
    end

    context "given password and app key don't match" do
      it "should warn about password and key not matching" do
        password = 'wrong_password'
        expect(validation_errors(password))
            .to have_key :password_dont_match
      end
    end

    context "no given password" do
      it "should warn about password not being passed" do
        expect(validation_errors(nil))
            .to have_key :no_password
      end
    end

    # TODO -- Is it possible to change an ENV variables in execution time?
    # context "app key is empty" do
    #   before(:each) do
    #     @temp = ENV['APP_KEY']
    #     ENV.fetch("APP_KEY") { '' }
    #   end
    #
    #   after(:each) do
    #     ENV.fetch("APP_KEY") { @temp }
    #   end
    #
    #   it "should warn about app key being nil" do
    #     # expect(validation_errors(nil)).to have_key :no_app_key
    #     expect(ENV['APP_KEY']).to be ''
    #   end
    # end
  end
end
