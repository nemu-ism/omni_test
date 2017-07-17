class User < ApplicationRecord
  def self.find_or_create_from_auth(auth)
    provider = auth[:provider]
    uid = auth[:uid]
    name = auth[:info][:name]
    nickname = auth[:info][:nickname]
    image_url = auth[:info][:image]
    token = auth[:credentials][:token]
    secret = auth[:credentials][:secret]

    self.find_or_create_by(provider: provider, uid: uid) do |user|
      user.name = name
      user.nickname = nickname
      user.image_url = image_url
      user.token = token
      user.secret = secret
    end
  end
end