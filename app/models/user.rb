class User < ActiveRecord::Base
  has_many :albums
  has_many :photos, :through => :albums

  def self.authenticate(params)
    user = User.find_by_name(params[:name])
    (user && user.password == params[:password]) ? user : nil
  end
  
end
