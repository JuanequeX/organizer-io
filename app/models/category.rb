# == Schema Information
#
# Table name: categories
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Category < ApplicationRecord
  has_many :tasks
  # Con esto no permitiremos registrar campos vacios
  validates :name, :description, presence: true
  # Podremos validar que el nombre sea unico y tomando en cuenta
  # Mayusculas y minusculas
  validates :name, uniqueness: { case_sensitive: false }
end
