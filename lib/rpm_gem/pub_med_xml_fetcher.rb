require 'open-uri'

module RpmGem

  class PubMedXMLFetcher
  
    ID_SUMMARY = ['http://eutils.ncbi.nlm.nih.gov/entrez/eutils/esummary.fcgi?db=pubmed&id=', '&retmode=xml']
    ID_FETCH = ['http://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=pubmed&id=', '&retmode=xml']

    def self.summary_xml_for_id id
      open(ID_SUMMARY[0] + id.to_s + ID_SUMMARY[1]).read      
    end
    
    def self.fetch_xml_for_id id
      open(ID_FETCH[0] + id.to_s + ID_FETCH[1]).read      
    end
  
  end
end
