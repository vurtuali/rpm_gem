require 'rexml/document'

module RpmGem

  # Citation 
  #
  class Citation
  
    XPATHS = {
      :journal_title => '//*/Journal/Title',
      :journal_abbrev => '//*/ISOAbbreviation',
      :year =>  '//*/Journal/JournalIssue/PubDate/Year',
      :month_string =>  '//*/Journal/JournalIssue/PubDate/Month',
      :volume =>  '//*/Journal/JournalIssue/Volume',
      :issue =>  '//*/Journal/JournalIssue/Issue',
      :pages => '//*/Pagination/MedlinePgn',
      :q =>'//*/Article/ArticleTitle',
      :abstract_text => '//*/Abstract/AbstractText',
      :last_names => '//*/Author/LastName',
      :fore_names => '//*/Author/ForeName',
      :initials => '//*/Author/Initials',
      :affiliation => '//*/Article/Affiliation'
    }
    
    MONTHS = %w{Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec}
    
    attr_reader :id, :xml
    
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
      @xml ||= REXML::Document.new PubMedXMLFetcher.fetch_xml_for_id(@id)
    end
    
    def month
      unless month_string.nil? || month_string.empty?
        MONTHS.index(month_string.first) + 1
      end
    end
    
    def authors
       authors = []
       last_names.each_index do |i|
         authors << "#{last_names[i]} #{initials[i]}"     
       end
       authors
    end
    
    private
    
    def self.define_fields
      XPATHS.each do |k,v|
        define_method k do
          xpath_map v
        end
      end
    end
    
    def xpath_map xpath
      if xml_doc
        return cond_rem_sq_brackets(REXML::XPath.each(xml_doc, xpath).map {|x| x.text})
      else
        return nil
      end
    end
    
    def cond_rem_sq_brackets x
      if  x.is_a?(Array) && (x.size < 2)
        x[0]
      else
        x
      end      
    end
    
    define_fields
  end

end
