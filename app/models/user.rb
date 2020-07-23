# frozen_string_literal: true

class User < ApplicationRecord
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :group
  has_many :reviews, dependent: :destroy

  def username
    self[:username] || email
  end

  def reviewed?(game)
    reviews.where(game: game).any?
  end

  def self.invite!(attributes = {}, invited_by = nil, options = {}, &block)
    if invited_by.present?
      super(
        attributes.merge(group_id: invited_by.group_id),
        invited_by,
        options,
        &block
      )
    else
      super
    end
  end

  private

  def username_from_email
    Mail::Addresss.new(email).local
  end
end
