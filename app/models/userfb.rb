class Userfb < ActiveRecord::Base
  def self.omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |userfb|
      userfb.provider = auth.provider
      userfb.uid = auth.uid
      userfb.name = auth.info.name
      userfb.image = auth.info.image
      userfb.token = auth.credentials.token
      userfb.expires_at = Time.at(auth.credentials.expires_at)
      userfb.save!
    end
  end
end
