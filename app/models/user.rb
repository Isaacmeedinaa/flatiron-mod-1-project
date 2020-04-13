class User < ActiveRecord::Base
  has_many :reviews
  has_many :restaurants, through: :reviews

  def self.find_user_by_name(name)
    User.find_by(name: name)
  end
end