require 'spec_helper'
require 'cancan/matchers'

describe User do

  describe 'Abilities' do

    before(:each) do
      @user = FactoryGirl.create(:user, :admin => false)
    end

    subject { ability }
    let(:ability) { Ability.new(@user) }

    context "Guests should not be able to view unpublished posts"  do
      it { should_not be_able_to(:read, Post.new(:published => false)) }
    end
    
  end
  
end
