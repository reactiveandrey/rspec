require 'rails_helper'
RSpec.describe 'Gift Page brand portfolio check', type: :feature do

  it 'Check Brand Portfolio', js: true do
    visit 'https://www.scentbird.com/gift'
    find(:css, '._3sbcCc').click
    first(:css, '._28G4Ox').hover
    first(:css, '._1ojLKC').visible?
  end

  a_brands = ['Amouage', 'Annick Goutal', 'Aquolina']
  b_brands = ['Berdoues', 'Burberry', 'Bvlgari']
  c_brands = ['Calvin Klein', 'Cartier', 'Carven Parfums']
  d_brands = ['Caswell-Massey', 'Catherine Malandrino', 'Clinique']
  e_brands = ['Comptoir Sud Pacifique', 'CoSTUME NATIONAL', 'David Yurman']
   amouage = ['Beach Hut Woman', 'Blossom Love', 'Honour Woman', 'Interlude Woman', 'Lilac Love Woman', 'Reflection Woman']
   annick_goutal = ['Eau d’Hadrien', 'Tenue de Soirée']
   aquolina = ['Pink Sugar', 'Pink Sugar Sensual']
   berdoues = ['Assam of India', 'Scorza Di Sicilia', 'Selva Do Brazil', 'Somei Yoshino', 'Vanira Moorea']
   burberry = ['Body', 'Brit Sheer', 'Burberry Brit EDT', 'Burberry Brit Rhythm for Women', 'London', 'My Burberry',
    'My Burberry Black', 'The Beat EDT']
   bvlgari = ['Mon Jasmin Noir L\'Eau Exquise', 'Omnia Amethyste', 'Omnia Crystalline EDT', 'Omnia Indian Garnet', 'Omnia Paraiba']
   calvin_klein = ['Euphoria']
   cartier = ['Baiser Vole', 'Eau de Cartier', 'Eau De Cartier Zeste De Soleil']
   carven_parfums = ['Carven L\'Absolu', 'Carven L\'Eau de Toilette', 'Carven Le Parfum']
   caswell_massey = ['Beatrix', 'Marem']
   catherine_malandrino = ['L\'Energie de New York', 'Romance de Provence', 'Style de Paris']
   clinique = ['Aromatics Elixir', 'Happy', 'Happy Heart']
   comptoir_sud_pacifique = ['Aloha Tiare', 'Amour De CaCao', 'Aqua Motu', 'Coco Figue', 'Vanille Abricot', 'Vanille Banane', 'Vanille Blackberry',
  'Vanille Coco', 'Vanille Extreme']
   costume_national = ['So Nude']
   david_yurman = ['Delicate Essence', 'Exotic Essence', 'Fresh Essence']
 #More brands tbd
  fragrances_brands = {'Amouage' => amouage, 'Annick Goutal' => annick_goutal, 'Aquolina' => aquolina, 'Berdoues' => berdoues,
    'Burberry' => burberry, 'Bvlgari' => bvlgari, 'Calvin Klein' => calvin_klein, 'Cartier' => cartier, 'Carven Parfums' => carven_parfums,
    'Caswell-Massey' => caswell_massey, 'Catherine Malandrino' =>  catherine_malandrino, 'Clinique' =>  clinique, 'Comptoir Sud Pacifique' => comptoir_sud_pacifique,
     'CoSTUME NATIONAL' => costume_national, 'David Yurman' => david_yurman}

    a_brands.each do |a_brand|
  it "Check #{a_brand} Portfolio", js: true do
    visit 'https://www.scentbird.com/gift'
    find(:css, '._3sbcCc').click
    find(:css, '._28G4Ox', :text => /\A#{a_brand}\z/).hover
    fragrances = fragrances_brands[a_brand].to_a
    #puts fragrances
    fragrances.each do |fragrance|
      find(:css, '._1ojLKC', :text => /\A#{fragrance}\z/).visible?
    end
  end
end

    b_brands.each do |b_brand|
  it "Check #{b_brand} Portfolio", js: true do
   visit 'https://www.scentbird.com/gift'
   find(:css, '._3sbcCc').click
   slick_dots = first(:css, '.slick-active')
   slick_dots.native.send_keys :arrow_right
   find(:css, '._28G4Ox', :text => /\A#{b_brand}\z/).hover
   fragrances = fragrances_brands[b_brand].to_a
   #puts fragrances
   fragrances.each do |fragrance|
  find(:css, '._1ojLKC', :text => /\A#{fragrance}\z/).visible?
    end
  end
end

   c_brands.each do |c_brand|
  it "Check #{c_brand} Portfolio", js: true do
   visit 'https://www.scentbird.com/gift'
   slick_dots = first(:css, '.slick-active')
   slick_dots.native.send_keys :arrow_right
   sleep 1
   slick_dots = first(:css, '.slick-active')
   slick_dots.native.send_keys :arrow_right
   sleep 1
   find(:css, '._28G4Ox', :text => /\A#{c_brand}\z/).hover
   fragrances = fragrances_brands[c_brand].to_a
   #puts fragrances
   fragrances.each do |fragrance|
   find(:css, '._1ojLKC', :text => /\A#{fragrance}\z/).visible?
    end
  end
end

   d_brands.each do |d_brand|
  it "Check #{d_brand} Portfolio", js: true do
   visit 'https://www.scentbird.com/gift'
   find(:css, '._3sbcCc').click
   slick_dots = first(:css, '.slick-active')
   slick_dots.native.send_keys :arrow_right
   sleep 1
   slick_dots = first(:css, '.slick-active')
   slick_dots.native.send_keys :arrow_right
   sleep 1
   slick_dots = first(:css, '.slick-active')
   slick_dots.native.send_keys :arrow_right
   sleep 1
   find(:css, '._28G4Ox', :text => /\A#{d_brand}\z/).hover
   fragrances = fragrances_brands[d_brand].to_a
   #puts fragrances
   fragrances.each do |fragrance|
   find(:css, '._1ojLKC', :text => /\A#{fragrance}\z/).visible?
    end
  end
end
   e_brands.each do |e_brand|
  it "Check #{e_brand} Portfolio", js: true do
   visit 'https://www.scentbird.com/gift'
   find(:css, '._3sbcCc').click
   slick_dots = first(:css, '.slick-active')
   slick_dots.native.send_keys :arrow_right
   sleep 1
   slick_dots = first(:css, '.slick-active')
   slick_dots.native.send_keys :arrow_right
   sleep 1
   slick_dots = first(:css, '.slick-active')
   slick_dots.native.send_keys :arrow_right
   sleep 1
   slick_dots = first(:css, '.slick-active')
   slick_dots.native.send_keys :arrow_right
   sleep 1
   find(:css, '._28G4Ox', :text => /\A#{e_brand}\z/).hover
   fragrances = fragrances_brands[e_brand].to_a
   #puts fragrances
   fragrances.each do |fragrance|
   find(:css, '._1ojLKC', :text => /\A#{fragrance}\z/).visible?
    end
  end
end

  it 'Check Brand Portfolio slider', js: true do
    visit 'https://www.scentbird.com/gift'
    find(:css, '._3sbcCc').click
    slick_dots = first(:css, '.slick-active')
    slick_dots.native.send_keys :arrow_right
    page.save_screenshot('Check_Brand_Portfolio_slides_0.png')
    slick_dots = first(:css, '.slick-active')
    slick_dots.native.send_keys :arrow_right
    page.save_screenshot('Check_Brand_Portfolio_slides_1.png')
    slick_dots = first(:css, '.slick-active')
    slick_dots.native.send_keys :arrow_right
    page.save_screenshot('Check_Brand_Portfolio_slides_2.png')
    slick_dots = first(:css, '.slick-active')
    slick_dots.native.send_keys :arrow_right
    page.save_screenshot('Check_Brand_Portfolio_slides_3.png')
    slick_dots = first(:css, '.slick-active')
    slick_dots.native.send_keys :arrow_right
    page.save_screenshot('Check_Brand_Portfolio_slides_4.png')
    slick_dots = first(:css, '.slick-active')
    slick_dots.native.send_keys :arrow_right
    page.save_screenshot('Check_Brand_Portfolio_slides_5.png')
    slick_dots = first(:css, '.slick-active')
    slick_dots.native.send_keys :arrow_right
    page.save_screenshot('Check_Brand_Portfolio_slides_6.png')
    slick_dots = first(:css, '.slick-active')
    slick_dots.native.send_keys :arrow_right
    page.save_screenshot('Check_Brand_Portfolio_slides_7.png')
    slick_dots = first(:css, '.slick-active')
    slick_dots.native.send_keys :arrow_right
    page.save_screenshot('Check_Brand_Portfolio_slides_8.png')
    slick_dots = first(:css, '.slick-active')
    slick_dots.native.send_keys :arrow_right
    page.save_screenshot('Check_Brand_Portfolio_slides_9.png')
    slick_dots = first(:css, '.slick-active')
    slick_dots.native.send_keys :arrow_right
    page.save_screenshot('Check_Brand_Portfolio_slides_10.png')
    slick_dots = first(:css, '.slick-active')
    slick_dots.native.send_keys :arrow_right
    page.save_screenshot('Check_Brand_Portfolio_slides_11.png')
    slick_dots = first(:css, '.slick-active')
    slick_dots.native.send_keys :arrow_right
    page.save_screenshot('Check_Brand_Portfolio_slides_12.png')
    slick_dots = first(:css, '.slick-active')
    slick_dots.native.send_keys :arrow_right
    page.save_screenshot('Check_Brand_Portfolio_slides_13.png')
    slick_dots = first(:css, '.slick-active')
    slick_dots.native.send_keys :arrow_right
    page.save_screenshot('Check_Brand_Portfolio_slides_14.png')
    slick_dots = first(:css, '.slick-active')
    slick_dots.native.send_keys :arrow_right
    page.save_screenshot('Check_Brand_Portfolio_slides_15.png')
    slick_dots = first(:css, '.slick-active')
    slick_dots.native.send_keys :arrow_left
    page.save_screenshot('Check_Brand_Portfolio_slides_16.png')
    slick_dots = first(:css, '.slick-active')
    slick_dots.native.send_keys :arrow_left
    page.save_screenshot('Check_Brand_Portfolio_slides_17.png')
    slick_dots = first(:css, '.slick-active')
    slick_dots.native.send_keys :arrow_left
    page.save_screenshot('Check_Brand_Portfolio_slides_18.png')
    slick_dots = first(:css, '.slick-active')
    slick_dots.native.send_keys :arrow_left
    page.save_screenshot('Check_Brand_Portfolio_slides_19.png')
    slick_dots = first(:css, '.slick-active')
    slick_dots.native.send_keys :arrow_left
    page.save_screenshot('Check_Brand_Portfolio_slides_20.png')
    slick_dots = first(:css, '.slick-active')
    slick_dots.native.send_keys :arrow_left
    page.save_screenshot('Check_Brand_Portfolio_slides_21.png')
    slick_dots = first(:css, '.slick-active')
    slick_dots.native.send_keys :arrow_left
    page.save_screenshot('Check_Brand_Portfolio_slides_22.png')
    slick_dots = first(:css, '.slick-active')
    slick_dots.native.send_keys :arrow_left
    page.save_screenshot('Check_Brand_Portfolio_slides_23.png')
    slick_dots = first(:css, '.slick-active')
    slick_dots.native.send_keys :arrow_left
    page.save_screenshot('Check_Brand_Portfolio_slides_24.png')
    slick_dots = first(:css, '.slick-active')
    slick_dots.native.send_keys :arrow_left
    page.save_screenshot('Check_Brand_Portfolio_slides_25.png')
    slick_dots = first(:css, '.slick-active')
    slick_dots.native.send_keys :arrow_left
    page.save_screenshot('Check_Brand_Portfolio_slides_26.png')
    slick_dots = first(:css, '.slick-active')
    slick_dots.native.send_keys :arrow_left
    page.save_screenshot('Check_Brand_Portfolio_slides_27.png')
    slick_dots = first(:css, '.slick-active')
    slick_dots.native.send_keys :arrow_left
    page.save_screenshot('Check_Brand_Portfolio_slides_28.png')
    slick_dots = first(:css, '.slick-active')
    slick_dots.native.send_keys :arrow_left
    page.save_screenshot('Check_Brand_Portfolio_slides_29.png')
    slick_dots = first(:css, '.slick-active')
    slick_dots.native.send_keys :arrow_left
    page.save_screenshot('Check_Brand_Portfolio_slides_30.png')
    slick_dots = first(:css, '.slick-active')
    slick_dots.native.send_keys :arrow_left
    page.save_screenshot('Check_Brand_Portfolio_slides_31.png')
    end

end
