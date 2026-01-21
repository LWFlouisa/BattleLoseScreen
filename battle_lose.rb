require "NeoPathfinding"

$player_level  =  3
$player_hp     = 10 * $player_level
$player_atk    =  4 * $player_level
$player_def    =  2 * $player_level
$player_heal   =  2 * $player_level
$player_sanity = 10 * $player_level
$player_trust  = 10 * $player_level

## That time
def sore_float(condition)
  if condition
    yield
    
    return true
  end
  
  false
end

def shikashi_float(already_done, condition)
  return true if already_done
  
  if condition
    yield
    
    return true
  end
end

def sonota_float(already_done)
  yield unless already_done
  
  unless already_done
    #if defined?($otherwise)
      #puts "#{$otherwise_not[0]} is 'THAT'"
      #puts "#{$otherwise_not[1]} is 'WHAT'"
    #end
  end
end

## A place of many rivers flowing together.
def matawa_float(already_done)
  yield unless already_done
  
  unless already_done
    #if defined?($otherwise)
      #puts "#{$otherwise_not[0]} is 'THAT'"
      #puts "#{$otherwise_not[1]} is 'WHAT'"
    #end
  end
end

def batailledemeritto # Demeritobataye
  system("clear")
  
  puts "Démérite De Bataille / Sento no demeritto"
  puts "You've been taken through the rafters! Your life vessles are now legally forfeit."

  sleep(1.5)

  print "HP: #{$player_hp} => "
  $player_hp     = $player_hp     * $current_probability
  puts "#{$player_hp.round}"
  
  print "ATK: #{$player_atk} => "
  $player_atk    = $player_atk     * $current_probability
  puts "#{$player_atk.round}"
  
  print "DEF: #{$player_def} => "
  $player_def     = $player_def     * $current_probability
  puts "#{$player_def.round}"
  
  print "HEAL: #{$player_heal} => "
  $player_heal     = $player_heal     * $current_probability
  puts "#{$player_heal.round}"

  print "TRUST: #{$player_trust} => "
  $player_trust     = $player_trust     * $current_probability
  puts "#{$player_trust.round}"

  print "SANITY: #{$player_sanity} => "
  $player_sanity     = $player_sanity     * $current_probability
  puts "#{$player_sanity.round}"
end

def take_down_rafters
  require "NeoPathfinding"
  
  2.times do
    get_statistics(:justins_turn, "I knew I couldn't trust you to win against the British.",
                   :feenas_turn,             "Please give up your Spanish vessles quietly.",
                   :sues_turn,     "I knew should have thrown you overboard Captain Jack..")
                   
                   dynamic_reward_allocation
  end
  
  current_defeat_probability = $current_probability
  
  current_defeat_probability = sore_float($current_probability > 0.8) do
    puts "Your battle reward: [ #{$current_defintion} ] was unsuccessfully mitigated."
        
    ## Enemy is distracted by something else.    
    batailledemeritto
  end

  current_defeat_probability = shikashi_float(current_defeat_probability, $current_probability < 0.2) do
    puts "Your battle reward: [ #{$current_defintion} ] was not unsuccessfully mitigated."
    
    #$current_probability = $current_probability * $current_probability
        
    ## Battle Mechanics right here.
    batailledemeritto
  end
      
  current_defeat_probability = sonota_float(current_defeat_probability) do
    puts "Your battle reward: [ #{$current_defintion} ] was partially unsuccessfully mitigated."
        
    ## Battle Mechanics focused on player advantage.
    batailledemeritto
  end
end

take_down_rafters
