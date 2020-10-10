class PigSerializer < ActiveModel::Serializer
  attributes :id, :name, :weight, :highest_medal_achieved, :img_url, :greased, :specialty
end
