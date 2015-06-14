module HRPG::Config

  def config
    @config ||= YAML::load_file "#{Dir.home}/.hrpg"
  end

  def user_id
    config["user_id"]
  end

  def api_token
    config["api_token"]
  end

end
