require 'spec_helper'

describe OState::StateMetadata do

  describe "self.find" do

    it "raise exception if API key is not valid" do
      OState::Configuration.api_key = "invalid"
      p  OState::StateMetadata.find('ma')
      # expect do
      #   OState::StateMetadata.find('ma')
      # end.to raise_error(OState::AuthenticationError)
    end

    it "raise exception if meta_data is not valid" do
      expect do
        OState::StateMetadata.find('ma232')
      end.to raise_error(OState::AuthenticationError)
    end


    it "return valid rsponse if id is valid"
  end

end
