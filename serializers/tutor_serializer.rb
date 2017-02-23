class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :education, :experience, :created_at

  belongs_to :user
end