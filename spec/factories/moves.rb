FactoryBot.define do
  factory :move do
    sequence(:number_of_move){|n| n}
    column { 5 }
    row { 3 }
    piece { "銀" }
    state1 { "" }
    state2 { "" }
    state3 { "成" }
    work
  end
end