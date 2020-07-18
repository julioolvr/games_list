namespace :app do
  desc 'Create a random review for each game with each user'
  task spam: :environment do
    users = User.all

    users.each do |user|
      games = GamePolicy::Scope.new(user, Game).resolve.reject { |game| user.reviewed?(game) }

      games.each do |game|
        Review.create(game: game, user: user, score: [-1, 0, 1, 2].sample, body: Faker::Lorem.sentence)
      end
    end
  end
end
