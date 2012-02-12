#!/usr/bin/env ruby

fingers = []
#ignore pinkies! they are reserved for hitting shift
#fingers[0] = ['q', 'a', 'z','1','2']
fingers[1] = ['w','s','x','3']
fingers[2] = ['e','d','c','4']
fingers[3] = ['r','f','v','t','g','b','5','6']
fingers[4] = ['y','h','n','u','j','m','7','8']
fingers[5] = ['i','k','9']
fingers[6] = ['o','l','0']
#fingers[7] = ['p']

hands = []
hands[0] = [fingers[1], fingers[2], fingers[3]]
hands[1] = [fingers[4], fingers[5], fingers[6]]

password = ""

hand = 0
# make sure we don't use the same finger on one hand twice in a row
last_finger = [3, 3] 

while password.length != ARGV[0].to_i do
  # Grab a finger that we didn't use on this hand last time
  finger = Random.rand(hands[hand].length)
  while finger == last_finger[hand] do
    finger = Random.rand(hands[hand].length)
  end
  
  character = hands[hand][finger][Random.rand(hands[hand][finger].length)]

  if Random.rand(10) < 2 then character.upcase! end #maybe some uppercase characters

  password << character

  hand = hand^1 #switch hands
end

puts password
