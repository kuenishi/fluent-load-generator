#require 'riak'
require 'json'

s = <<EOS
{
 "host":"103.5.142.5",
 "user":"-",
 "method":"PUT",
 "path":"/buckets/moriyoshi/object/riaklogo.png",
 "code":"200",
 "size":"0",
 "referer":"",
 "agent":"",
 "time":"2013-05-27T05:42:09Z",
 "tag":"riak.cluster2"
}
EOS

#c = Riak::Client.new(:protocol => "pbc",
#                     :nodes => [{:host => "localhost",
#                                 :pb_port => 8087
#                                 :pb_port => 10017
#                                }])
#bucket = c.bucket("fluentlog")

module Fluent
  module Loadgen
    class ApacheLogGen
      def initialize
        @r = Random.new
        @methods = ['PUT',
                    'GET', 'GET', 'GET', 'GET', 'GET', 'GET',
                    'POST', 'HEAD', 'DELETE']
        @codes = ['200', '204', '302', '403', '404', '501', '503', '502']
        @tags = ['shibuya', 'asakusa', 'tochigi']
      end

      def host
        "#{@r.rand(256)}.#{@r.rand(256)}.#{@r.rand(256)}.#{@r.rand(256)}"
      end
      def method
        @methods[@r.rand(@methods.length)]
      end
      def path
        "/buckets/moriyoshi/object/riaklogo.png"
      end
      def code
        @codes[@r.rand(@codes.length)]
      end
      def size
        @r.rand(1024).to_s
      end
      def time
        Date.today.to_s
      end
      def tag
      end
      def gen
        {
          :host => host,
          :user => "-",
          :method => method,
          :path => path,
          :code => code,
          :size => size,
          :referer => "",
          :agent => "",
          :time => time,
          :tag => tag
        }
      end
    end
  end
end

