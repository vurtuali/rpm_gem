# RpmGem - Ruby PubMed Gem

A very small gem to pull publication details from pubmed, via the ncbi.nlm.nih.gov's Entrez eutils service.
Will fetch the xml document for a given pubmed id and provides handy attribute readers via REXML, ie only requires stlib.

It was extracted from a couple of projects, which needed to populate databases or autofill forms

### Easy Peasy?

    c = RpmGem::Citation.new 1234567
     => #<RpmGem::Citation:0x0000000291d988 @id=1234567> 
    c.article_title
     => "The effect of castration and peroral estrogen therapy on some psychological functions." 
    c.journal_title
      => "Frontiers of hormone research" 
    c.year
     => "1975"
     
### Note
    c = RpmGem::Citation.new 12563742
     => #<RpmGem::Citation:0x0000000291d988 @id=1234567>
    c.last_names
     => ["Rauramo", "Lagerspetz", "Engblom", "Punnonen"]
    c.fore_names
     => ["L", "K", "P", "R"]
    c.authors
     => ["Rauramo L", "Lagerspetz K", "Engblom P", "Punnonen R"]
     

 
 
 


