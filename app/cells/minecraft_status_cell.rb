require 'httparty'

class MinecraftStatusCell < Cell::ViewModel
  #cache :show do
  #  [....order('updated_at ASC').last.updated_at.to_s]
  #end

  def show(options = {})
    command = 'proxy/status'
    api_url = [Figaro.env.api_url, command].join('/')
    auth = {username: Figaro.env.api_username, password: Figaro.env.api_password}
    @minecraft_status = HTTParty.get(api_url, basic_auth: auth)
    render
  end
end
