# frozen_string_literal: true

group = Group.first

pc = Platform.find_by!(name: 'PC')
playstation = Platform.find_by!(name: 'Playstation 4')
switch = Platform.find_by!(name: 'Switch')
xbox = Platform.find_by!(name: 'Xbox One')

Game.seed(
  :name,
  { name: 'Duck Game', platforms: [pc, playstation, switch], group: group },
  { name: 'Satisfactory', platforms: [pc], group: group },
  { name: 'Superliminal', platforms: [pc, playstation, xbox], group: group }
)
