#require 'rails_helper'
require 'spec_helper'

describe User do
 # pending "add some examples to (or delete) #{__FILE__}"
 # before { @user = User.new(name: "Example User", email: "user@example.com") }
  before do
    @user = User.new(name: "Example User", 
					 email: "user@example.com",
					 password: "foobar",
					 password_confirmation: "foobar") 
  end
  
  subject { @user }
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }
  it { should be_valid } #first: correct; second: error, because the email has been saved in DB of test.sqlite3, not uniqueness
  
  describe "when name is not present" do
    before { @user.name = " " } # must use do...end for "before{}", else will influnce source codes herebefore.
#    it { should_not be_valid }
    it { should_not be_valid } # blank is not vaild for user name.
  end
  
  describe "when email is not present" do
	before { @user.email = " " } 
	it { should_not be_valid } # blank is not vaild
  end
  
  describe "when name is too long" do
	before { @user.name = "a" * 51 } 
	it { should_not be_valid }
  end
  
  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com foo@bar..com ns@baidu.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end
  
  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.save
    end
    
    it { should_not be_valid }
  end
  
  describe "when password is not present" do
    before do
      @user = User.new(name: "Example User", email: "user@example.com",
                       password: " ", password_confirmation: " ")
    end
    it { should_not be_valid }
  end
  
  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end
  
  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by(email: @user.email) } #why no id?

    describe "with valid password" do
      it { should eq found_user.authenticate(@user.password) }
      # why the "user" instance is eq found_user ???
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be_false }
    end
  end  
end
