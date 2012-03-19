require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the HomeHelper. For example:
#
# describe HomeHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe HomeHelper do

  it "should format a post date properly" do
    date = Time.parse("2010-12-23 03:26:19")
    format_post_date(date).should == 'December 23, 2010 @ 03:26<span class="meridian">AM</span>'
  end

end
