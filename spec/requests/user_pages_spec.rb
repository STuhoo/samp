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
    before { visit root_path } 
    it { should have_content('Sign up') }
    it { should have_title(full_title('Home')) } 
  end
end
