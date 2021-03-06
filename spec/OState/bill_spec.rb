require 'spec_helper'

describe OState::Bill do

  describe "self.find" do
    it "raise exception if bill_id is not valid" do
      expect do
        OState::Bill.find('invalid')
      end.to raise_error(OState::NotFoundError)
    end

    it "raise ArgumentError if id is not passed" do
      expect do
        OState::Bill.find
      end.to raise_error(ArgumentError)
    end

    it "return valid response if id is valid" do
      expect do
        OState::Bill.find('DCB00002029')
      end.to_not raise_error
    end
  end

  describe "self.search" do
    it "raise BadRequestError if options is empty or not passed" do
      expect do
        OState::Bill.search
      end.to raise_error(OState::BadRequestError)
    end

    it "return valid response if options is valid" do
      VCR.use_cassette('OState/bills/search') do
        expect do
          OState::Bill.search(state: "dc", per_page: 10)
        end.to_not raise_error
      end
    end
    it "should return different responses based on filter options - different state" do
      dc_bills =  VCR.use_cassette('OState/bills/search/dc') do
        OState::Bill.search(state: "dc", per_page: 5)
      end
      ny_bills = VCR.use_cassette('OState/bills/search/ny') do
        OState::Bill.search(state: "ny", per_page: 5)
      end
      expect(dc_bills).to_not equal(ny_bills)
    end

    it "sort should vary with sort options" do
      sort_by_first = VCR.use_cassette('OState/bills/sort/first') do
        OState::Bill.search(state: "dc", per_page: 5, sort: 'first')
      end

      sort_by_created_at = VCR.use_cassette('OState/bills/sort/created_at') do
        OState::Bill.search(state: "dc", per_page: 5, sort: 'created_at')
      end

      expect(sort_by_first).to_not equal(sort_by_created_at)
    end

    it "response should vary with pagination by per page" do
      paginate_by_5_per_page = VCR.use_cassette('OState/bills/paginate/paginate_by_5_per_page') do
        OState::Bill.search(state: "dc", per_page: 5)
      end

      paginate_by_10_per_page = VCR.use_cassette('OState/bills/paginate/paginate_by_10_per_page') do
        OState::Bill.search(state: "dc", per_page: 10)
      end

      expect(paginate_by_5_per_page.collection.count).to_not equal(paginate_by_10_per_page.collection.count)
    end
  end

end
