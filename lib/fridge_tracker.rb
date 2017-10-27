require_relative '../config/environment'
require_relative '../app/models/fridge'


# puts "test"

my_greeting = %q(
    Welcome to the fridge tracker
    What would you like to do? 
    1. Show all of your fridges 
    2. Add a fridge
    3. Delete a fridge
    4. View all food items in a specific fridge 
    5. Add a food item to a fridge
    6. Eat a food item from a fridge (delete it)
    7. View all drink items in a specific fridge
    8. Add a drink item to a fridge
    9. Consume PART of a drink from a fridge (update its size in ounces)
    10. Consume ALL of a drink from a fridge (delete it)  
)

puts my_greeting


def show_fridges
fridges = Fridge.all

fridges.each do |fridge|
    puts "Your #{fridge.brand} Fridge is in the #{fridge.location} and it's name is: #{fridge.id}"
    end
end


def add_fridge
puts "Location:"
location = gets.chomp
puts "brand:"
brand = gets.chomp
puts "size:"
size = gets.chomp
puts "Has food true or false?"
has_food = gets.chomp
puts "Has drinks true of false?"
has_drinks = gets.chomp

new_fridge =  Fridge.create(location: location, brand: brand, size: size, has_food: has_food, has_drink: has_drink)
puts new_fridge
end

def delete_fridge
    puts "Aww, you wanna delete a fridge? Fine. Type in the fridge's name(numbers) and hit enter."
    show_fridges
    fridge_to_delete = gets.chomp
    Fridge.find(fridge_to_delete).destroy
end    

def show_foods_in_fridge
    puts "Wanna open a fridge? Type in the fridge's name(it's a number) and hit enter."
    show_fridges
    fridge_opened = gets.chomp
    list_of_food = Food.where("fridge_id = #{fridge_opened}")
    list_of_food.each do |food|
        puts "Here we gots #{food.name}. Yumm!"
    end
end



def add_some_food
    # puts "Add a food" 
  
    puts "Which fridge do you want to add to? Type in the fridge's name(it's a number) and hit enter."
    show_fridges
    fridge_opened = gets.chomp

    puts "What food you wanna add?"
    food_name = gets.chomp
    puts "What's the food in pounds?"
    food_weight = gets.chomp.to_i
    # puts "Can you add the date please?"
    # date_added = gets.chomp

    new_food = Food.create(name: :name, weight: :weight).where("fridge_id = #{fridge_opened}")
end


def show_drinks_in_fridge
    puts "Wanna open a fridge? Type in the fridge's name(it's a number) and hit enter"
    show_fridges
    fridge_opened = gets.chomp
    list_of_drinks = Drink.where("fridge_id = #{fridge_opened}")
    list_of_drinks.each do |drink|
        puts "In this fridge, we gots #{drink.name}. Help yourself!"
    end
end


def add_some_drink

    puts "Which fridge do you want to add to? Type in the fridge's name(it's a number) and hit enter."
    show_fridges
    fridge_to_add_to = gets.chomp.to_i

    puts "What drink you wanna add?"
    drink_name = gets.chomp
    puts "What size is your drink in ounces?"
    drink_size = gets.chomp.to_i
    puts "Is your drink an adult beverage? Type only 'true' or 'false'"
    drink_alcoholic = gets.chomp
     
    # so these user inputs are saved to variables and used to build the new hash.
    new_drink = Drink.create(name: drink_name, size: drink_size, alcoholic: drink_alcoholic, fridge_id: fridge_to_add_to)
puts "You've added #{new_drink.name} to fridge #{fridge_to_add_to}."
end





user_input = gets.chomp.to_i

puts user_input

if user_input === 1 
    show_fridges
elsif user_input === 2
    add_fridge
elsif user_input === 3    
    delete_fridge
elsif user_input === 4
    show_foods_in_fridge
elsif user_input === 5
    add_some_food
elsif user_input === 7
    show_drinks_in_fridge
elsif user_input === 8
    add_some_drink
end













# def run_script
# <<~HEREDOC
#     Welcome to the fridge tracker
#     What would you like to do? 
#     1. Show all of your fridges 
#     2. Add a fridge
#     3. Delete a fridge
#     4. View all food items in a specific fridge   
# HEREDOC
#     end