class Book
  include Mongoid::Document
  include Mongoid::Slug
  field :title
  embeds_many :authors
  belongs_to :publisher
end
