b= Menu.create(name: 'Breakfast')
l= Menu.create(name: 'Lunch')
d= Menu.create(name: 'Dinner')
ln= Menu.create(name: 'Late Night')

def add_menu_items(menu)
  10.times do
    menu.menu_items.create(
    name: Faker::Beer.style,
    description: Faker::Hipster.paragraph,
    price: Faker::Number.between(5.50, 100.75)
    )
  end
end

add_menu_items(b)
add_menu_items(l)
add_menu_items(d)
add_menu_items(ln)

puts 'Menus Seeded'
