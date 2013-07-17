require 'spec_helper'
require 'loop_lingo'

describe LoopLingo::User do
  let(:klass) { LoopLingo::User }

  let(:valid_attributes) do
    {
      "birthdate"      => nil,
      "gender"         => "u",
      "generic_points" => 0,
      "name"           => nil,
      "points"         => 75,
      "id"             => 22082
    }
  end

  let(:valid_json) { MultiJson.dump(valid_attributes) }

  let(:valid_user) { klass.new(valid_json) }

  let(:mock_boolean_response) do
    double(:boolean_response)
  end

  describe "#initialize" do
    it "must populate @attributes with the passed data" do
      h = '{ "a": "b" }'
      k = klass.new(h)
      k.attributes.must == { 'a' => 'b' }
    end
  end

  describe "#method_missing" do
    it "must return the matching attributes value if there is one" do
      valid_user.gender.must == valid_attributes['gender']
    end

    it "must call super if there no matching attributes value" do
      lambda { valid_user.invalid }.must raise_exception
    end
  end

  describe "redeem_points!" do
    it "must call LoopLingo.redeem() with the appropriate arguments" do
      LoopLingo.should_receive(:redeem_user_points).with(
        valid_attributes['id'], 111
      ).and_return(mock_boolean_response)

      valid_user.redeem_points!(111).must == mock_boolean_response
    end
  end
end