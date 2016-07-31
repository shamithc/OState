require 'spec_helper'

describe OState::StateMetadata do

  describe "self.find" do

    it "raise exception if meta_data is not valid" do
      expect do
        OState::StateMetadata.find('ma232')
      end.to raise_error(OState::NotFoundError)
    end

    it "raise ArgumentError if id is not passed" do
      expect do
        OState::StateMetadata.find
      end.to raise_error(ArgumentError)
    end


    it "return valid response if id is valid" do
      OState::Configuration.api_key = "7dc1ba922a424d88af580364c7b8bd05"
      expect do
        OState::StateMetadata.find('ma')
      end.to_not raise_error
    end
  end

end
