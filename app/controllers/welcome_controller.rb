class WelcomeController < ApplicationController
  require 'nokogiri'
  require 'open-uri'

  def index
 
    @tmp = Item.order("created_at DESC")
    @tmp2 = Picture.all

  end

  def scrape
    @sites = ["http://feeds2.feedburner.com/slashfilm", "http://feeds.feedburner.com/totalfilm/news", "http://feeds.ign.com/ign/movies-all","http://moviesblog.mtv.com/feed", "http://www.mtv.com/rss/news/movies_full.jhtml", "http://www.iwatchstuff.com/index.xml", "http://feeds.movieweb.com/movieweb_movienews", "http://imgur.com/r/movies", "http://feeds.feedburner.com/Cinecast", "http://feeds.feedburner.com/thr/film", "http://rss.firstshowing.net/firstshowing"]

    @sites2 = ["http://feeds2.feedburner.com/slashfilm", "http://feeds.feedburner.com/totalfilm/news","http://moviesblog.mtv.com/feed", "http://www.mtv.com/rss/news/movies_full.jhtml", "http://www.iwatchstuff.com/index.xml", "http://feeds.movieweb.com/movieweb_movienews", "http://imgur.com/r/movies", "http://feeds.feedburner.com/thr/film", "http://rss.firstshowing.net/firstshowing"]

    @sites3 = ["http://feeds2.feedburner.com/slashfilm"]

    @sites3.each do |site|
      xml_doc  = Nokogiri::XML(open(site))
      
        @items = xml_doc.xpath("//item")

          @items.each do |item|

            img_link =  item.to_html.scan(/http[^<>]*jpg/).reject{|s|s.match(/yahoo/)}.uniq

            break if Picture.where(:url => img_link).exists? == true 
              i = Item.new
              i.title = item.xpath("title").inner_text.to_s
              i.keywords = item.xpath("category").inner_text.to_s.gsub( / /, "," )
              i.description = item.xpath("description").inner_text.to_s
              i.article_url = item.xpath("link").inner_text.to_s
              i.source = item.xpath("link").inner_text.to_s
              i.save

              img_link.each do |p|
                pic = Picture.new
                pic.url = p
                i.pictures << pic

              end           

          end

    end

  end

end
