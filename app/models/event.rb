# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :user
  validates :description, :initial_date, :final_date, presence: true
  validates :initial_date, :final_date, uniqueness: true
  validate :bussiness_hour
  validate :bussiness_date

  def bussiness_hour
    if initial_date.nil? || initial_date.hour < 6 || initial_date.hour > 23
      errors.add(:base, 'invalid hour')
    end
end