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
    latitude { '51.501564' }
    longitude { '-0.141944' }
    cuisine
  end
end
