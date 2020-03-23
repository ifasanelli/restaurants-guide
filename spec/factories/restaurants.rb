FactoryBot.define do
  factory :restaurant do
    name { 'Gourmetzão' }
    address { 'Rua de Santos, 13' }
    neighborhood { 'Ponta da praia' }
    city { 'Santos' }
    status { 0 }
    phone { '13 98765-1234' }
    phone2 { '13 91234-9876' }
    cost { '50.00' }
    timmings { 'Seg-Qui 10h ás 18h, Sáb-Dom 12h ás 0h' }
    happy_hour { 'Qui-Sex 18h ás 20h' }
    coffee { true }
    delivery { true }
    ac { true }
    wifi { true }
    cards { true }
    tickets { true }
    outside { true }
    club { true }
    vegetarian { true }
    map { 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d20622.571049395177!2d-46.303125769285494!3d-23.974935683825358!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x344b00a453db9644!2zRW1ww7NyaW8gZGEgUHJhw6dh!5e0!3m2!1spt-BR!2sbr!4v1584842006399!5m2!1spt-BR!2sbr' }
    cuisine
  end
end
