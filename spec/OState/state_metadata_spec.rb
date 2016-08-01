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
      expect do
        OState::StateMetadata.find('ma')
      end.to_not raise_error
    end
  end

  describe "self.all" do
    it "return valid response" do
      VCR.use_cassette('OState/state_metadata/all') do
        expect do
          OState::StateMetadata.all
        end.to_not raise_error
      end
    end

    it "response should be instance of ResourceCollection" do
      all_metadata = VCR.use_cassette('OState/state_metadata/all') do
        OState::StateMetadata.all
      end
      expect(all_metadata).to be_a OState::ResourceCollection
    end
  end
end
