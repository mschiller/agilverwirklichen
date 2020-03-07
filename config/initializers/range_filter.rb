# (c) Thomas Fritzsche
# This is prove-of-concept coding only
# iOS devices insist on support for byte-rage http header, that is not native
# supported by rack apps like dragonfly
# this rack middleware will evaluate the http header and provide byte range support.

# For a dragonfly Rails (3.2.3) app I have tested this will call like this.
# I reload Rack::Cache that case trouble when initialized by Rails.
# This small trick makes it working :-)
#-----------------------
#require 'dragonfly/rails/images'
#require "range"
#
#
#Rails.application.middleware.delete(Rack::Cache)
#Rails.application.middleware.insert 0, Rack::Cache, {
#  :verbose     => true,
#  :metastore   => URI.encode("file:#{Rails.root}/tmp/dragonfly/cache/meta"),
#  :entitystore => URI.encode("file:#{Rails.root}/tmp/dragonfly/cache/body")
#}
#
#Rails.application.middleware.insert_before Rack::Cache, RangeFilter
#
# [...]
#-------------------


class RangeFilter
  def initialize(app)
    @app = app
  end

  def call(env)
    dup._call(env)
  end

  def _call(env)
    @status, @headers, @response = @app.call(env)
    range = env["HTTP_RANGE"]
    if @status == 200 and range and /\Abytes=(\d*)-(\d*)\z/ =~ range
      @first_byte, @last_byte = $1, $2


      @data = "".encode("BINARY")
      @response.each do |s|
        @data << s
      end
      @length = @data.bytesize if @length.nil?
      if @last_byte.empty?
        @last_byte = @length - 1
      else
        @last_byte = @last_byte.to_i
      end
      if @first_byte.empty?
        @first_byte = @length - @last_byte
        @last_byte = @length - 1
      else
        @first_byte = @first_byte.to_i
      end
      @range_length = @last_byte - @first_byte + 1
      @headers["Content-Range"] = "bytes #{@first_byte}-#{@last_byte}/#{@length}"
      @headers["Content-Length"] = @range_length.to_s
      [@status, @headers, self]
    else
      [@status, @headers, @response]
    end
  end

  def each(&block)
    block.call(@data[@first_byte..@last_byte])
    @response.close if @response.respond_to?(:close)
  end

end

Rails.application.middleware.use RangeFilter unless Rails.env.development?