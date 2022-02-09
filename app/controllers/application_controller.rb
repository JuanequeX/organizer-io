class ApplicationController < ActionController::Base
  before_action :set_locale

  # Con esto permitiremos que solo usuarios
  # Logeados puedan acceder a nuestras vistas
  # de task y categories.
  before_action  :authenticate_user!

  def set_locale
    I18n.locale = 'es'
  end
end
