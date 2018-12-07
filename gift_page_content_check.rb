require 'rails_helper'
RSpec.describe 'Gift Page content check', type: :feature do

  text_positions = ['._1zpZNQ', '._2Yom1G', '._1Jw7Km', '._1EyPJi', '._1Hf1sM', '._7syX0E', '._3c7wMh', '._3sbcCc',
    '._3ODo3i', '._2kjCdb']
  texts = {'._1zpZNQ' => 'GIVE THE GIFT OF THE SCENT', '._2Yom1G' => 'A Scentbird subscription is the gift that keeps
    on giving! For her or for him', '._1Jw7Km' => 'The Perfect Gift', '._1EyPJi' => 'No guess work, they choose the
    perfume or cologne they want', '._1Hf1sM' => 'Who is this gift for?', '._7syX0E' => 'All the designer fragrances
    you can imagine in one place', '._3c7wMh' => 'Check out our brand portfolio below.', '._3sbcCc' => 'Scentbird,
    Inc. is wholly independent and separate from the designer or the designer\'s manufacturers. Scentbird states that
    the contents are genuine product independently rebottled by Scentbird, Inc., New York, NY 10001',
    '._3ODo3i' => 'No guess work, they choose the perfume or cologne they want', '._2kjCdb' => 'SCENTBIRD © 2018,
    All rights reserved. Made with love in NYC.'}
    text_positions.each do |text_position|
   it "Check page content / #{texts[text_position]}", js: true do
     visit 'https://www.scentbird.com/gift'
     expect(find(:css, "#{text_position}")).to have_content "#{texts[text_position]}"
   end
  end

  other_texts = ['GENEROUS SUPPLY OF FRAGRANCE (120 SPRAYS MONTHLY)', '3-, 6-, AND 12-MONTH OPTIONS AVAILABLE',
   '450 PERFUMES AND 100+ COLOGNES IN OUR COLLECTION', 'STARTING AT JUST $44']
   other_texts.each do |other_text|
   it "Check page content / #{other_text}", js: true do
     visit 'https://www.scentbird.com/gift'
     expect(page).to have_selector('._25mxUQ', :text =>  "#{other_text}", visible: true)
   end
  end

end
