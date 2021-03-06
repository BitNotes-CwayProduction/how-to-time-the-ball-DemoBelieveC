require 'test_helper'

class StateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @state = State.new
  end

  test 'state should not save without name' do
    @state.name = nil
    assert_not @state.save, 'State without name is accepted'
  end

  test 'state name should be atleast 5 character' do
    @state.name = '1234'
    assert_not @state.save, 'State with name less than 5 char is accepted'
  end

  test 'state name should be unique' do
    @state.name = 'Maharashtra'
    @state.save
    @state2 = State.new
    @state2.name = 'Maharashtra'
    assert_not @state2.save, 'State without unique name is accepted'
  end
end
