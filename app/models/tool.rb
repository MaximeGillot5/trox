class Tool < ApplicationRecord
    belongs_to :user
    has_one :loan
    has_one_attached :pic
    validates :title, presence: true, length: {maximum: 30, too_long:"%{count} caractères autorisés pour le titre" }
    validates :description, presence: true, length: { maximum: 500, too_long: "%{count} caractères autorisés pour la description" }
    validates :pic, presence: true 
    validates :location, presence: true
    validates :condition, presence: true, length: {maximum: 30,too_long:"%{count} caractères autorisés pour l'état de l'outil"}
    validates :caution, presence: true, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 10000, message: "La caution doit être comprise entre 0 et 10 000€" }
    after_initialize :set_defaults

    geocoded_by :full_address
    after_validation :geocode 
    

    def full_address
      "#{location}"
    end

    private

    def set_defaults
      self.loaned ||= false
    end

end
