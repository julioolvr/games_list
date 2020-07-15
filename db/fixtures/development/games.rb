# frozen_string_literal: true

pc = Platform.find_by!(name: 'PC')
playstation = Platform.find_by!(name: 'Playstation 4')
switch = Platform.find_by!(name: 'Switch')
xbox = Platform.find_by!(name: 'Xbox One')

Game.seed(
  :name,
  { name: 'Duck Game', platforms: [pc, playstation, switch] },
  { name: 'Satisfactory', platforms: [pc] },
  { name: 'Superliminal', platforms: [pc, playstation, xbox] }
)
