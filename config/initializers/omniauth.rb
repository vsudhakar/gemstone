OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, 1564361263842694, "d85599cf06627d56262baa8aaaea8ae3"
end
