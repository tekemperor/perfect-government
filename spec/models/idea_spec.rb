require 'spec_helper'

describe Idea do

	before :each do

		@idea_user = User.create!(
			:name => "Idea User",
			:email_address => "idea@domain.tld",
			:password => "$$$$$$$$" )

		@update_user = User.create!(
			:name => "Idea Update User",
			:email_address => "idea.update@domain.tld",
			:password => "$$$$$$$$" )

		@valid = {
			:content => "Some valid idea",
			:user => @idea_user }

		@blank = "  \t \n "

	end

	it "should be created when given valid attributes" do
		Idea.create!(@valid)
	end

	describe "interface" do

		it "should include a :content field" do
			Idea.new.should respond_to :content
		end

		it "should include a :user field" do
			Idea.new.should respond_to :user
		end

	end

	describe "content validation" do

		it "should reject blank ideas" do
			Idea.new(@valid.merge(:content => nil)).should_not be_valid
			Idea.new(@valid.merge(:content => "")).should_not be_valid
			Idea.new(@valid.merge(:content => @blank)).should_not be_valid
		end

	end

	describe "user validation" do

		it "should require a user" do
			Idea.new(@valid.merge(:user => nil)).should_not be_valid
		end

	end

end
