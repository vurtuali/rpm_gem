# RpmGem - Ruby PubMed Gem

A very small gem to pull publication details from pubmed, via the ncbi.nlm.nih.gov's Entrez eutils service.
Will fetch the xml document for a given pubmed id and provides handy attribute readers via REXML, ie only requires stlib.

### Like how easy?

    c = RpmGem::Citation.new 12563742
     => #<RpmGem::Citation:0x0000000291d988 @id=12563742> 
    c.article_title
     => "[Dynamic changes in IL-4, IL-5 and IL-10 in liver and bone marrow of mice infected with Schistosoma japonicum]." 
    c.journal_title
      => "Zhongguo ji sheng chong xue yu ji sheng chong bing za zhi = Chinese journal of parasitology & parasitic diseases" 
    c.year
     => "1999" 


