# frozen_string_literal: true

group = Group.first

User.seed(
  :email,
  { email: 'user1@example.com', password: 'test1234', group: group },
  { email: 'user2@example.com', password: 'test1234', group: group },
  { email: 'user3@example.com', password: 'test1234', group: group },
  { email: 'user4@example.com', password: 'test1234', group: group }
)
