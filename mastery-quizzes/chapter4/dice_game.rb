while true do
    my_dice1 = rand(1..6)
    my_dice2 = rand(1..6)

    opp_dice1 = rand(1..6)
    opp_dice2 = rand(1..6)

    if my_dice1 + my_dice2 > opp_dice1 + opp_dice2
        puts "You rolled #{my_dice1} and #{my_dice2}."
        puts "I rolled #{opp_dice1} and #{opp_dice2}."
        puts "You won!! :-("
    else
        puts "You rolled #{my_dice1} and #{my_dice2}."
        puts "I rolled #{opp_dice1} and #{opp_dice2}."
        puts "LOSER!!!"
    end

    print "Play again? "
    resp = gets.chomp
    if resp.downcase == 'n'
        break
    end
end