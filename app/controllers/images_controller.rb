class ImagesController < ApplicationController
    require 'rubygems'
    require 'nokogiri'
    require 'open-uri'

  def index
    url = "http://feeds2.feedburner.com/slashfilm"

    # doc = Nokogiri::HTML(open(url))
    # @scrapeVar = doc.at_css("title").text
    #@scrapeVar = doc.at_css("title").text

    @a = []
    @t = ["1","www.google.com/one.jpg","3.","teste sds", "om.jpg"]

  
    @t.select!{ |s| s.match( "[jpg]" )}

    xmldoc = Nokogiri::XML(open(url))  
    xmldoc = xmldoc.to_html
    htmldoc = Nokogiri::HTML(xmldoc)

    @g=htmldoc
    htmldoc.xpath("//a").each do |paragraph|
    #htmldoc.xpath("//a[//*[contains(text(), '')]]").each do |paragraph|

    @a.push(paragraph.inner_html)
    
    @b = @a.size
    #@a.to_s
    @a.select!{ |s| s.match( "[jpg]" )}
 


    end


   #@a.select!{ |s| s.match( /[\.jpg|\.png]/ )}

  end

end
