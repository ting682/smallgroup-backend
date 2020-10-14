class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email_address
end
