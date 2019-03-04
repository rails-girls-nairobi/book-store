module EncryptedEncoder
  def self.encode(str)
    Base64.urlsafe_encode64(str)
  end

  def self.decode(str)
    Base64.urlsafe_decode64(str)
  end
end
