require 'rails_helper'

=begin
RSpec.describe "User Pages", type: :request do
  describe "GET /user_pages" do
    it "works! (now write some real specs)" do
      get user_pages_index_path
      expect(response).to have_http_status(200)
    end
  end
end
=end

describe "User pages" do

  subject { page } #all test will call this var
  
  describe "signup page" do
    before { visit signup_path }  # call to sign up URL
    it { should have_content('Sign up') }
    it { should have_title(full_title('Sign up')) } 
    
    let(:submit) { "Create my account" }
    describe "with vaild information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end
      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
    
    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end
  end
  
  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) } # call to user profile URL, no define
    
    it { should have_content(user.name) }
    it { should have_title  (user.name) }
  end
end
