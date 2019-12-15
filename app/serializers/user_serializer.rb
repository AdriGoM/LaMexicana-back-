class UserSerializer < ActiveModel::Serializer
  attributes :fullname, :username, :password
end
