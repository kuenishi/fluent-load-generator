require 'net/http'


module Fluent
  module Loadgen

#        json = "{\"hoge\":\"valueoooooooo ???? special? \",\"id\":#{i}}"

    class HTTPTarget
      def initialize(uri)
        # uri = URI("http://192.168.62.128:8888/riak.test")
        @uri = uri
      end
      def post json
        Net::HTTP.post_form(@uri, 'json' => json)
      end
    end
  end
end
