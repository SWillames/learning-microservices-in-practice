# frozen_string_literal

class User < ApplicationRecord
  attr_accessor :name

  validates :first_name, :email, presence: true
  validates :email, uniqueness: true

  def name=(name)
    name = name.split(' ')
    self[:first_name] = name.shift
    self[:last_name] = name.join(' ')
  end

  def name
    values_at(:first_name, :last_name).join(' ')
  end
end
