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

new_fridge =  Fridge.create(location: location, brand: brand, size: size, has_foods: has_foods, has_drinks: has_drinks)
puts new_fridge
end

def delete_fridge
    puts "Aww, you wanna delete a fridge? Fine. Type in the fridge's name(numbers) and hit enter."
    show_fridges
    fridge_to_delete = gets.chomp
    Fridge.find(fridge_to_delete).destroy
end    



def show_items_in_fridge
    fridges = Fridge.all
    fridges.each do |fridge|
        puts "In this #{fridge.brand} we have...#{has_food} and #{has_drinks}"
    end
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




user_input = gets.chomp.to_i

puts user_input

if user_input === 1 
    show_fridges
elsif user_input === 2
    add_fridge
elsif user_input === 3    
    delete_fridge
elsif user_input === 4
    show_items_in_fridge
end

