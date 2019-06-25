require 'rails_helper'

RSpec.describe ExperiencesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Experience. As you add validations to Experience, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      title: 'test',first_day: '01/01/2019',
      description: 'its a test',
      company: 'My Company'
    }
  }

  let(:invalid_attributes) {
    { title: '', first_day: '01/01/2019', last_day: '', description: 'its a test'}
  }

  let(:correct_key) {
    { key: ENV['APP_KEY'] }
  }

  let(:incorrect_key) { { key: '00000' } }

  describe "GET #index" do
    it "returns a success response" do
      experience = Experience.create! valid_attributes
      get :index
      expect(response).to have_http_status :ok
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      experience = Experience.create! valid_attributes
      get :show, params: {id: experience.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params from the user" do
      it "creates a new Experience" do
        expect {
          post :create, params: {experience: valid_attributes.merge(correct_key)}
        }.to change(Experience, :count).by(1)
      end

      it "gets a 201 (created) HTTP response" do
        post :create, params: {experience: valid_attributes.merge(correct_key)}
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid params" do
      it "gets a 422 (unprocessable_entity) HTTP response" do
        post :create, params: {experience: invalid_attributes.merge(correct_key)}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context "with valid params but without a key" do
      it "gets a 401 (unauthorized) HTTP response" do
        post :create, params: {experience: valid_attributes.merge(incorrect_key)}
        expect(response).to have_http_status(401)
      end
    end
  end

  describe "PUT #update" do

    let(:new_attributes) { { last_day: '01/12/2019' } }

    context "with valid params" do

      it "updates the requested experience" do
        experience = Experience.create! valid_attributes
        put :update, params: {
            id: experience.to_param,
            experience: new_attributes.merge(correct_key)}
        expect(response).to have_http_status(:ok)
      end
    end

    context "with invalid params" do
      it "doesn't update the experience and get a 422 HTTP response" do
        experience = Experience.create! valid_attributes

        put :update, params: {id: experience.to_param, experience: invalid_attributes.merge(correct_key)}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context "with incorrect key given" do
      it "doesn't update the experience and get a 401 HTTP response" do
        experience = Experience.create! valid_attributes

        put :update, params: {
            id: experience.to_param,
            experience: new_attributes.merge(incorrect_key)}
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested experience if key is correct" do
      experience = Experience.create! valid_attributes
      expect {
        delete :destroy, params: {id: experience.to_param, experience: correct_key}
      }.to change(Experience, :count).by(-1)
    end

    it "doesn't destroy the requested experience if key is incorrect" do
      experience = Experience.create! valid_attributes
      expect {
        delete :destroy, params: {id: experience.to_param, experience: incorrect_key}
      }.to change(Experience, :count).by(0)
    end
  end

end
