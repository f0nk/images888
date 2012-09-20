class TagSystemController < ApplicationController
  require 'nokogiri'
  require 'open-uri'

  def index


@sites4 = ["http://feeds2.feedburner.com/slashfilm", "http://feeds.feedburner.com/totalfilm/news","http://moviesblog.mtv.com/feed", "http://www.mtv.com/rss/news/movies_full.jhtml", "http://www.iwatchstuff.com/index.xml", "http://feeds.movieweb.com/movieweb_movienews", "http://imgur.com/r/movies", "http://feeds.feedburner.com/thr/film", "http://rss.firstshowing.net/firstshowing", "http://www.guardian.co.uk/film/filmblog/rss", "http://www.guardian.co.uk/film/rss","http://www.telegraph.co.uk/culture/film/rss", "http://www.fandango.com/rss/moviefeed", "http://latino-review.com/feed/", "http://imgur.com/r/movies/rss","http://www.joblo.com/newsfeeds/rss.xml", "http://geektyrant.com/news/rss.xml", "http://blastr.com/atom.xml", "http://www.iamrogue.com/news?format=feed", "http://www.denofgeek.com/feeds/all", "http://www.cinemablend.com/rss-all.xml"]

@title = []

    @sites4.each do |site|
      xml_doc  = Nokogiri::XML(open(site))
      
        if xml_doc.xpath("//title").first == nil
        	@title.push(site)
        else
        	@title.push(xml_doc.xpath("//title").first.inner_text.to_s)

    	end

  end
end
end
