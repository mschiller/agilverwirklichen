ActiveStorage::DiskController.class_eval do

  private

  def serve_file(path, content_type:, disposition:)
    Rack::File.new(nil).serving(request, path).tap do |(status, headers, body)|
      self.status = status
      self.response_body = body

      headers.each do |name, value|
        response.headers[name] = value
      end

      response.headers["Cache-Control"] = 'public, max-age=31536000'
      response.headers["Content-Type"] = content_type || DEFAULT_SEND_FILE_TYPE
      response.headers["Content-Disposition"] = disposition || DEFAULT_SEND_FILE_DISPOSITION
    end
  end
end
