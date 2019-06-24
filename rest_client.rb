require 'rest-client'
class Search
    attr_reader :search
    def initialize(url, query)
        @search = RestClient.get url, params: {q: query}
    end

    def print_links
        matcher = /<h2><a.*?href="(?<link>.*?)"/
        result = search.body.scan(matcher)
        puts "===================="
        result.each_with_index {|link, ind|
        puts "#{ind+1}. #{link.join}"
        puts "===================="
        puts ""
        puts ""}
    end
end
url = 'https://www.bing.com'
query = 'Airbus A320'
result = Search.new(url, query)
result.print_links