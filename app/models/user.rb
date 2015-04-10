class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tickets

  # Получаем свойство объекта User, состоящее из 2 полей: имя и фамилия
  # Это нужно для хелпера формы при генерации элементов выпадающего списка
  def full_name
    "#{name} #{surname}"
  end
end
