class Publisher
  include Mongoid::Document
  has_many :books
end
