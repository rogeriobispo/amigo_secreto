require 'rails_helper'

RSpec.describe MembersController, type: :controller do
  include Devise::Test::ControllerHelpers

  before(:each) do
    request.env["HTTP_ACCEPT"] = 'application/json'

    @request.env["devise.mapping"] = Devise.mappings[:user]
    @current_user = FactoryBot.create(:user)
    @campaign = create(:campaign, user: @current_user)
    sign_in @current_user
  end

  describe "GET #create" do
    before(:each) do
      @member_attributes = attributes_for(:member, campaign: @campaign)
      @member_attributes[:campaign_id] = @campaign.id
      post :create, params: {member: @member_attributes}
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it 'user belongs to the correct campaign' do
      expect(Member.last.campaign.id).to eql(@campaign.id)
    end

    it 'member with the right attributes' do
      expect(Member.last.name).to eql(@member_attributes[:name])
      expect(Member.last.email).to eql(@member_attributes[:email])
    end

    it 'when member already added returns 422' do
      post :create, params: {member: @member_attributes, campaign: @campaign}
      expect(response).to have_http_status(422)
    end
  end

  describe "DELETE #destroy" do
    it "returns http success" do
      member = create(:member, campaign: @campaign)
      delete :destroy, params: {id: member.id}
      expect(response).to have_http_status(:success)
    end

    it 'member was errased' do
      member = create(:member, campaign: @campaign)
      delete :destroy, params: {id: member.id}
      expect(Member.where(email: member.email).present?).to eql(false)
    end

    it 'member was removed from campaign' do
      member = create(:member, campaign: @campaign)
      delete :destroy, params: {id: member.id}
      expect(@campaign.members.where(id: member.id).present?).to eql(false)
    end

    it 'when member is not found - redirect 302' do
      delete :destroy, params: {id: 'A15B'}
      expect(response).to have_http_status(302)
    end
    it 'user cant remove at this campaign' do
      sign_in create(:user)
      member = create(:member, campaign: @campaign)
      delete :destroy, params: {id: member.id}
      expect(response).to have_http_status(403)
    end
  end

  describe "PUT #update" do
    before(:each) do
      @new_member_attributes = attributes_for(:member)
      request.env["HTTP_ACCEPT"] = 'application/json'
    end

    it "returns http success" do
      member = create(:member, campaign: @campaign)
      put :update, params: {id: member.id, member: @new_member_attributes}
      expect(response).to have_http_status(:success)
    end

    it 'member was updated' do
      member = create(:member, campaign: @campaign)
      put :update, params: {id: member.id, member: @new_member_attributes}
      expect(Member.last.name).to eql(@new_member_attributes[:name])
      expect(Member.last.email).to eql(@new_member_attributes[:email])
    end

    it 'Email has been already taken' do
      member = create(:member, campaign: @campaign, email: 'already@taken.com')
      member_email_exist = attributes_for(:member, email: 'already@taken.com')
      member_email_exist[:campaign_id] = @campaign.id
      put :update, params: {id: member.id, member: member_email_exist}
      expect(response).to have_http_status(422)
    end
  end
end
