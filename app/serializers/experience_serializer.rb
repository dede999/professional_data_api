class ExperienceSerializer < ActiveModel::Serializer
  attributes :id, :title, :first_day,
             :last_day, :description, :company
end
