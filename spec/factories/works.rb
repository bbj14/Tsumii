FactoryBot.define do
  factory :work do
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/default_ban.jpg')) }
    number_of_moves { 3 }
    title { "test_title" }
    description { "test_description" }
    hint { "test_hint" }
    explanation { "test_explanation" }
    user
  end
  
  factory :work_with_moves, class: Work do
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/default_ban.jpg')) }
    number_of_moves { 3 }
    title { "test_title" }
    description { "test_description" }
    hint { "test_hint" }
    explanation { "test_explanation" }
    user
    
    after( :create ) do |work|
      create :move, work: work
      create :move, work: work
      create :move, work: work
    end
  end  
end