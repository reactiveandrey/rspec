require 'rails_helper'
RSpec.describe 'Gift Page footer check', type: :feature do

  footer_items = ['About Us', 'Blogger Program', 'Affiliate Program', 'For Press', 'Blog',
    'Careers', 'Reviews', 'Shop', 'Send a Gift', 'Shop perfumes', 'Shop colognes']
  footer_page_paths = {'About Us' => '/team', 'Blogger Program' => '/blogger', 'Affiliate Program' => '/affiliate-program',
    'For Press' => '/press', 'Blog' => '/blog/', 'Careers' => '/careers', 'Reviews' => '/scentbird-reviews',
  'Shop' => '/register/log-in', 'Send a Gift' => '/gift', 'Shop perfumes' => '/perfumes',
  'Shop colognes' => '/colognes'}
footer_items.each do |footer_item|
  it "Check Footer links / #{footer_item}", js: true do
    visit 'https://www.scentbird.com/gift'
    find(:css, '._2gE6bX', :text => /\A#{footer_item}\z/).click
    sleep 2
    expect(current_path).to eq("#{footer_page_paths[footer_item]}")
  end
end

footer3_items = ['Privacy Policy', 'Terms & Conditions']
footer3_page_paths = {'Privacy Policy' => '/privacy', 'Terms & Conditions' => '/terms'}
footer3_items.each do |footer3_item|
  it "Check Footer links / #{footer3_item}", js: true do
    visit 'https://www.scentbird.com/gift'
    find(:css, '._2ZCRfo._1nu0zI', :text => /\A#{footer3_item}\z/).click
    sleep 2
    expect(current_path).to eq("#{footer3_page_paths[footer3_item]}")
  end
end

footer1_items = ['INVITE FRIENDS AND EARN', 'REQUEST FRAGRANCE']
footer1_page_paths = {'INVITE FRIENDS AND EARN' => '/register/log-in', 'REQUEST FRAGRANCE' => '/request'}
footer1_items.each do |footer1_item|
  it "Check Footer links / #{footer1_item}", js: true do
    visit 'https://www.scentbird.com/gift'
    find(:css, '._2ZCRfo._2sF7EU', :text => /\A#{footer1_item}\z/).click
    expect(current_path).to eq("#{footer1_page_paths[footer1_item]}")
  end
end

  it "Check Footer links / Scentbird FAQs", js: true do
    visit 'https://www.scentbird.com/gift'
    find(:css, '._2gE6bX', :text => /\AScentbird FAQs\z/).click
    sleep 10
    within_window(switch_to_window(windows.last)) do
    expect(current_path).to eq('/hc/en-us')
  end
end

it "Check Footer links / Contact Us", js: true do
  visit 'https://www.scentbird.com/gift'
  find(:css, '._2gE6bX', :text => /\AContact Us\z/).click
  expect(page).to have_selector('.step-content', visible: true)
end

it "Check Contact Us form / Cross button", js: true do
  visit 'https://www.scentbird.com/gift'
  find(:css, '.._2gE6bX', :text => /\AContact Us\z/).click
  expect(page).to have_selector('.step-content', visible: true)
  find(:css, '.SVGInline.svg-icon.close-button').click
  expect(page).not_to have_selector('.step-content', visible: true)
end

footer2_items = ['Facebook', 'Twitter', 'Pinterest', 'Instagram']
footer2_page_paths = {'Facebook' => 'https://www.facebook.com/scentbird', 'Twitter' => 'https://twitter.com/scentbird',
  'Pinterest' => 'https://www.pinterest.com/scentbird/', 'Instagram' => 'https://www.instagram.com/scentbird/'}
footer2_buttons = {'Facebook' => '._3IKYqz._1aDkh8', 'Twitter' => '._3IKYqz._1cR2XP', 'Pinterest' => '._3IKYqz._3fQG6U',
  'Instagram' => '._3IKYqz._3ORZya'}
footer2_items.each do |footer2_item|
it "Check Footer links / FOLLOW US / #{footer2_item}", js: true do
  visit 'https://www.scentbird.com/gift'
  find(:css, "#{footer2_buttons[footer2_item]}").click
  sleep 10
  within_window(switch_to_window(windows.last)) do
  expect(current_url).to eq("#{footer2_page_paths[footer2_item]}")
  end
 end
end

it "Check Footer / Let's keep in touch", js: true do
  visit 'https://www.scentbird.com/gift'
  find(:css, '._1plCz0._1P6sL1').set('andrey.o.dmitriev+1@gmail.com')
  find(:css, '.WilPqf').click
  expect(find(:css, '._1zDT1S')).to have_content "Thanks for subscribing to our newsletter!"
end

end
