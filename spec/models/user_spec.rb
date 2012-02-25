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

	describe "email validation" do

		it "should reject duplicate emails" do
			User.create!(@valid)
			User.new(@distinct.merge(:email_address => @valid[:email_address])).
				should_not be_valid
		end

		describe "should accept" do

			name_mods = %w[-dash .dot _score 1num +plus]
			dom_mods = %w[-dash .dot 1num]
			tlds = %w[net com org biz info cc ru co.uk]

			emails = ["plain@jane.com"]

			name_mods.each do |mod|
				emails << "test#{mod}@domain.tld"
			end

			dom_mods.each do |mod|
				emails << "name@test#{mod}.tld"
			end

			tlds.each do |tld|
				emails << "name@domain.#{tld}"
			end

			emails.each do |email|

				it "'#{email}'" do
					u = User.new(@valid.merge(:email_address => email))
					u.should be_valid
				end

			end

		end

		describe "should reject" do

			name_mods = %w[- . _ + any,comma]
			dom_mods = %w[- . _ + #]

			emails = ["plain@no-tld"]

			name_mods.each do |mod|
				emails << "#{mod}prefix@domain.tld"
				emails << "suffix#{mod}@domain.tld"
			end

			dom_mods.each do |mod|
				emails << "name@#{mod}prefix.tld"
				emails << "name@suffix#{mod}.tld"
				emails << "name@suffix.#{mod}tld"
				emails << "name@suffix.tld#{mod}"
			end

			emails.each do |email|

				it "'#{email}'" do
					u = User.new(@valid.merge(:email_address => email))
					u.should_not be_valid
				end

			end

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
