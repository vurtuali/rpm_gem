$:.unshift File.dirname(__FILE__)
require 'test_helper'

class TestCitation < Test::Unit::TestCase
    def setup
      @id = "19863768"
      @citation = RpmGem::Citation.new @id
      assert !@citation.checked?
    end

#    def test_returns_xml_for_valid_id
#      tempxml = RpmGem::Citation.get_xml(@id)
#      doc = REXML::Document.new(tempxml)
#      assert_equal @id, REXML::XPath.first(doc, '//Id').text
#    end
#    
#    def test_parses_returned_xml
#      assert @citation.parse
#    end
      
end
