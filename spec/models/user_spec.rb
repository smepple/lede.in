# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  x_auth_uid         :integer
#  x_auth_username    :string(255)
#  oauth_token        :string(255)
#  oauth_token_secret :string(255)
#  email              :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'spec_helper'

describe User do
  
  before do
    @user = User.new(x_auth_uid: 123, 
                     x_auth_username: 'jdoe',
                     oauth_token: 'abc123xyz789',
                     oauth_token_secret: 'zyx987cba321')
  end

  subject { @user }

  it { should be_valid }

  it { should respond_to :x_auth_uid }
  it { should respond_to :x_auth_username }
  it { should respond_to :oauth_token }
  it { should respond_to :oauth_token_secret }
  it { should respond_to :email }

  
  # test validations that required attributes are present

  describe "when x_auth_uid is not present" do
    before { @user.x_auth_uid = '' }
    it { should_not be_valid }
  end

  describe "when x_auth_username is not present" do
    before { @user.x_auth_username = '' }
    it { should_not be_valid }
  end

  describe "when oauth_token is not present" do
    before { @user.oauth_token = '' }
    it { should_not be_valid }
  end

  describe "when oauth_token_secret is not present" do
    before { @user.oauth_token_secret = '' }
    it { should_not be_valid }
  end


  # test validations that required attributes are unique

  describe "when a user already exists with same x_auth_uid" do
    before do
      user_with_same_x_auth_uid = User.new(x_auth_uid: @user.x_auth_uid,
                                           x_auth_username: 'psmith',
                                           oauth_token: 'def456uvw456',
                                           oauth_token_secret: 'wvu654fed654')
      user_with_same_x_auth_uid.save
    end
    it { should_not be_valid }
  end

  describe "when a user already exists with same x_auth_username" do
    before do
      user_with_same_x_auth_username = User.new(x_auth_uid: 456,
                                           x_auth_username: @user.x_auth_username,
                                           oauth_token: 'def456uvw456',
                                           oauth_token_secret: 'wvu654fed654')
      user_with_same_x_auth_username.save
    end
    it { should_not be_valid }
  end

  describe "when a user already exists with same oauth_token" do
    before do
      user_with_same_oauth_token = User.new(x_auth_uid: 456,
                                           x_auth_username: 'psmith',
                                           oauth_token: @user.oauth_token,
                                           oauth_token_secret: 'wvu654fed654')
      user_with_same_oauth_token.save
    end
    it { should_not be_valid }
  end

  describe "when a user already exists with same oauth_token_secret" do
    before do
      user_with_same_oauth_token_secret = User.new(x_auth_uid: 456,
                                           x_auth_username: 'psmith',
                                           oauth_token: 'def456uvw456',
                                           oauth_token_secret: @user.oauth_token_secret)
      user_with_same_oauth_token_secret.save
    end
    it { should_not be_valid }
  end

  describe "when a user already exists with same email" do
    before do
      @user.email = 'jdoe@example.com'
      user_with_same_email = User.new(x_auth_uid: 456,
                                           x_auth_username: 'psmith',
                                           oauth_token: 'def456uvw456',
                                           oauth_token_secret: 'wvu654fed654',
                                           email: @user.email)
      user_with_same_email.save
    end
    it { should_not be_valid }
  end

  describe "email uniqueness should not be validated when email is nil" do
    before do
      @user.email = nil
      user_with_null_email = User.new(x_auth_uid: 456,
                                           x_auth_username: 'psmith',
                                           oauth_token: 'def456uvw456',
                                           oauth_token_secret: 'wvu654fed654')
      user_with_null_email.save
    end
    it { should be_valid }
  end



  # test valid email format

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end      
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid
      end      
    end
  end
end
