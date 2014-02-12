require 'fluent/loadgen/datagen.rb'
require 'fluent/loadgen/loader.rb'

module Fluent
  module Loadgen
    def self.main
      # "http://192.168.100.128:8888/load.test")
      uri = URI(ARGV.shift)
      n = ARGV.shift.to_i

      print "making load to #{uri}\n"

      target = HTTPTarget.new uri
      run(target, n)
    end

    #g = Gen.new
    def self.run(target, n)
      g = Fluent::Loadgen::ApacheLogGen.new
      start = Time.now

      (0..n).each do |i|
        today = Date.today
        key = "#{today.to_s}-#{i}"
        #      robj = Riak::RObject.new(bucket, key)
        records = g.gen
        records[:key] = key
        res = target.post records.to_json
        # p records.to_json
        #      robj.raw_data = records.to_json
        #      robj.indexes['year_int'] << today.year
        #      robj.indexes['month_bin'] << "#{today.year}-#{today.month}"
        #      robj.indexes['tag_bin'] << records[:tag]
        #
        #      robj.content_type = 'application/json'
        #      robj.store
        if (i % 10) == 0 then
          print "#{i}: #{res.code}\r"
        end
      end

      duration = (Time.now - start).to_i
      mps = n * 1.0 / duration
      print "#{n} messages in #{duration} secs: #{mps} mps.\n"
    end
  end
end
