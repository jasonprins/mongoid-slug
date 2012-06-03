class Animal
  include Mongoid::Document
  include Mongoid::Slug
  field :name
  field :nickname
  field :_id, type: String, default: ->{ name }
  # key :name, :nickname
  slug  :name
end
