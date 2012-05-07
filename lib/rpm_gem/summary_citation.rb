require 'rexml/document'

module RpmGem

  class SummaryCitation
  
    FIELDS = ['PubDate', 'Title', 'Source', 'Volume', 'Issue', 'Pages', 'Author', 'FullJournalName']
    
    attr_reader :id
    
    def initialize id=nil
      @id = id
    end
    
    def id= new_id
      unless @id == new_id
        @xml = nil
        @id = new_id
      end
    end
    
    def xml_doc
      @xml ||= REXML::Document.new PubMedXMLFetcher.summary_xml_for_id(@id)
    end
    
    def authors
      xpath_map 'Author'
    end
    
    private
    
    def self.define_fields
      FIELDS.each do |field|
        define_method field.downcase.to_sym do
          xpath_map field
        end
      end
    end
    
    def xpath_map name
      if xml_doc
        return REXML::XPath.each(xml_doc, "//Item[@Name='#{name}']").map {|x| x.text}
      else
        return nil
      end
    end
    
    define_fields
  end

end
