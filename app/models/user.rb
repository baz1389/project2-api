#
class User < ActiveRecord::Base
  include Authentication
  has_many :words
  has_many :books
end
