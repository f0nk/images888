class ImagesController < ApplicationController
    require 'rubygems'
    #require 'nokogiri'
    require 'open-uri'
    require 'httpclient'

  def index

    @sites = ["http://feeds2.feedburner.com/slashfilm", "http://feeds.feedburner.com/totalfilm/news", "http://feeds.ign.com/ign/movies-all","http://moviesblog.mtv.com/feed", "http://www.mtv.com/rss/news/movies_full.jhtml", "http://www.iwatchstuff.com/index.xml", "http://feeds.movieweb.com/movieweb_movienews", "http://imgur.com/r/movies", "http://feeds.feedburner.com/Cinecast", "http://feeds.feedburner.com/thr/film", "http://rss.firstshowing.net/firstshowing"]

    @urls = Array.new

    @sites.each do |site|

    response = HTTPClient.get site
     @urls += response.body.scan( /http[^<>]*jpg/)
     @urls.reject!{|s|s.match(/yahoo/)}

    #@urls += response.body.scan(/yahoo/)

     @urls.uniq!
    end
  

  end

end
