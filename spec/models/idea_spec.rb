require 'spec_helper'

describe Idea do

	describe "user validation" do

		it "should require a user" do
			Idea.new(:content => "Test content").should_not be_valid
		end

	end

end
