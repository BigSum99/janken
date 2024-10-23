loop do
  puts "----------------------------------"
  puts "てきがあらわれた！"
  puts "0(じゃんけんでたたかう) 1(にげる)"
  first_select = gets.chomp

  if ["0", "1"].include?(first_select)
      if first_select == "0"
          puts "あいてはふてきにわらっている"
          break
      elsif first_select == "1"
          puts "しかしまわりこまれてしまった"
          break
      end
  else
      puts "あやまったせんたくをしたからか、ときがまきもどった！"
      next
  end
end

puts "----------------------------------"
puts "さあ、じゃんけんだ"

choices = ["グー", "チョキ", "パー"]
directions = ["うえ", "した", "みぎ", "ひだり"]

def janken_move(choices, player_choice, computer_choice)
  puts "ホイ！"
  puts "----------------------------------"
  puts "あなた: #{choices[player_choice.to_i]} をだしました"
  puts "あいて: #{computer_choice} をだしました"
  puts "----------------------------------"
end

def direction_move(directions, player_direction, computer_direction)
  puts "ホイ！"
  puts "----------------------------------"
  puts "あなた: #{directions[player_direction.to_i]}"
  puts "あいて: #{directions[computer_direction]}"
end

loop do
  puts "----------------------------------"
  puts "0(グー) 1(チョキ) 2(パー) 3(にげる)"
  player_choice = gets.chomp

  if player_choice.match?(/^\d+$/) && ["0", "1", "2", "3"].include?(player_choice)
    computer_choice = choices.sample

    if ["0", "1", "2"].include?(player_choice)
      case [choices[player_choice.to_i], computer_choice]
      when ["グー", "チョキ"], ["チョキ", "パー"], ["パー", "グー"]
        janken_move(choices, player_choice, computer_choice)
        puts "あっちむいて〜"
        puts "0(うえ) 1(した) 2(みぎ) 3(ひだり)"
        player_direction = gets.chomp
        if player_direction.match?(/^\d+$/) && ["0", "1", "2", "3"].include?(player_direction)
          computer_direction = rand(0..3)
          direction_move(directions, player_direction, computer_direction)
          if player_direction == computer_direction.to_s
            puts "てきをやっつけた…"
            break
          else
            next
          end
        else
          puts "じゃんけんからやりなおしてください"
          next
        end
      when ["グー", "パー"], ["チョキ", "グー"], ["パー", "チョキ"]
        janken_move(choices, player_choice, computer_choice)
        puts "あっちむいて〜"
        puts "0(うえ) 1(した) 2(みぎ) 3(ひだり)"
        player_direction = gets.chomp
        if player_direction.match?(/^\d+$/) && ["0", "1", "2", "3"].include?(player_direction)
          computer_direction = rand(0..3)
          direction_move(directions, player_direction, computer_direction)
          if player_direction == computer_direction.to_s
            puts "パーティーはぜんめつした…"
            break
          else
            next
          end
        else
          puts "じゃんけんからやりなおしてください"
          next
        end
      when ["グー", "グー"], ["チョキ", "チョキ"], ["パー", "パー"]
        janken_move(choices, player_choice, computer_choice)
        puts "あいこで…"
      end
    elsif player_choice == "3"
      puts "しかしまわりこまれてしまった！"
      next
    end
  else
    puts "ゆうこうなすうじをにゅうりょくしてください"
    next
  end
end
