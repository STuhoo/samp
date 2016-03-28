require 'rails_helper'
=begin
RSpec.describe "StaticPages", type: :request do
  describe "GET /static_pages" do
    it "works! (now write some real specs)" do
      get static_pages_index_path
      expect(response).to have_http_status(200)
    end
  end
end
=end

describe "Static pages" do
  subject { page }
  describe "Home Page" do
  
	before { visit root_path }
	it { should have_content('Sample App') }
	it { should have_title("Ruby on Rails Tutorial Sample App") }
	it { should_not have_title('Homeless') }
  end

  describe "Help Page" do
  
	before { visit help_path }
	it { should have_content('Help') }
	it { should have_title(full_title('Help')) }
  end  
  describe "About Page" do
  
	before { visit about_path }
	it { should have_content('About') }
	it { should have_title(full_title('About')) }
  end
  describe "Contact Page" do
  
	before { visit contact_path }
	it { should have_content('Contact') }
	it { should have_title(full_title('Contact')) }
  end  
end
