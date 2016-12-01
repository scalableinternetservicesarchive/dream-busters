module EditorsHelper
  require 'digest/sha1'
  def hash(speaker)
    Digest::SHA1.hexdigest speaker
  end
end
