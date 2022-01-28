# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  due_date    :date
#  category_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Task < ApplicationRecord
  belongs_to :category

  validates :name, :description, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  # Validacion perzonalizada para que la fecha no se encuentre
  # en una fecha que este en el pasado.
  validate :due_date_validity
  # Esta validacion debe de ser acompanada de un metodo:

  def due_date_validity
    # Primero validaremos que la variable existe
    return if due_date.blank?
    return if due_date > Date.today
    # Usaremos el metodo interno errors para añadir
    # Errores al modelo y asi hacerle saber al usuario
    # Que no puede agregar una fecha fuera de estas validaciones
    # Usaremos la internacionalizacion pero como no podemos usar directamente
    # el helper 't' lo hacemos asi:
    errors.add :due_date, I18n.t('task.errors.invalid_due_date')
  end
end
