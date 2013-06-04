class User < Api::SingularResource

  self.path = 'user'
  field :id, :first_name, :last_name, :phone_number

end