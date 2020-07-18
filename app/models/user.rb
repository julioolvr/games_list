# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :group
  has_many :reviews, dependent: :destroy

  def username
    self[:username] || email
  end

  def reviewed?(game)
    reviews.where(game: game).any?
  end

  private

  def username_from_email
    Mail::Addresss.new(email).local
  end
end
