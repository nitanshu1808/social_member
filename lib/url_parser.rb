module UrlParser
  require 'open-uri'

  def fetch_headings( url )
    response           = Nokogiri::HTML.parse( open( url ) )
    response_headings  = response.css( Heading::HEADING_TAGS.join(',') )
    heading            = []
    response_headings.each do |head|
      heading << {
        tag:        head.name,
        text:       head.text.strip
      }
    end
    heading
  end
end
