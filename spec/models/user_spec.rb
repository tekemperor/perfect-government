require 'spec_helper'

describe User do

	before :each do
		@valid = {
			:name => "Valid User",
			:email_address => "valid@example.com",
			:password => "V4lid_P4ss" }

		@distinct = {
			:name => "Distinct User",
			:email_address => "distinct@example.com",
			:password => "Distinct_P4ss" }

		@blank = "\n  \t \n  "
	end

	it "should be created when given valid attributes" do
		User.create!(@valid)
		User.create!(@distinct)
	end

	describe "name validation" do

		it "should reject blank names" do
			User.new(@valid.merge(:name => nil)).should_not be_valid
			User.new(@valid.merge(:name => "")).should_not be_valid
			User.new(@valid.merge(:name => @blank)).should_not be_valid
		end

		it "should reject duplicate names" do
			User.create!(@valid)
			User.new(@distinct.merge(:name => @valid[:name])).
				should_not be_valid
		end

	end

	describe "password validation" do

		it "should accept valid password_confirmation" do
			confirm = @valid[:password]
			User.new(@valid.merge(:password_confirmation => confirm)).
				should be_valid
		end

		it "should reject invalid password_confirmation" do
			confirm = @distinct[:password]
			User.new(@valid.merge(:password_confirmation => confirm)).
				should_not be_valid
		end

	end

	describe "defaults" do

		before :each do
			@user = User.create!(@valid)
		end

		it "should not create an administrator" do
			@user.should_not be_administrator
		end

		it "should require email activation" do
			@user.state.should_not == "active"
		end

	end

end
