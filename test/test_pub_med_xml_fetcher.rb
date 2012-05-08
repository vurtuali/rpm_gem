$:.unshift File.dirname(__FILE__)
require 'test_helper'

class TestPubMedXMLFetcher < Test::Unit::TestCase

    def setup
      @id = "19863768"
    end
    
    def test_fetch
      assert RpmGem::PubMedXMLFetcher.fetch_xml_for_id @id
    end
      
end
