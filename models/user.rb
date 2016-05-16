class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :email, String, required: true, unique: true
  property :gender, Enum[:female, :male], required: true
  property :admin, Boolean, required: true, default: false
  property :password, BCryptHash, required: true
  property :number, String

  # has n, :posts
  # has n, :comments

end