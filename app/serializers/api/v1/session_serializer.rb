class Api::V1::SessionSerializer < Api::V1::BaseSerializer
  #just some basic attributes
  attributes :id, :email, :username, :authentication_token
end
