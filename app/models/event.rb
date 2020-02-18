  class Event < ApplicationRecord
    validates :start_date, presence: true
    validates :duration, presence: true
    validate :duration_condition
    validates :title, presence: true, length: { minimum: 5, maximum: 140, message: "Il doit faire entre 5 et 140 caractères !"}
    validates :description, presence: true, length: { minimum: 20,maximum: 2000, message: 'La description doit etre entre 20 et 2000 caractères !'}
    validates :price, presence: true
    validate :price_condition
    validates :location, presence: true
    validate :start_date_condition
    has_many :participations
    has_many :users , through: :participations
    belongs_to :admin, class_name: "User"
    
  
    def start_date_condition
      if start_date < DateTime.now
       errors.add(:start_date, "La date de l'evenement  ne peut pas être avant la date actuelle !")
    end
  end
  
  def duration_condition
    if duration % 5 != 0 || duration < 5
      errors.add(:duration, 'La durée doit être un multiple de 5 !')
    end
  end
  
  def price_condition
    if price.between?(1, 1000) 
      return true
    else
      errors.add(:price, 'Le prix doit etre compris entre 1 et 1000 euros')
    end

    
 

  end
  
  
  
  end
  
