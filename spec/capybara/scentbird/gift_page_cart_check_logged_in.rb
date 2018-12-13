require 'rails_helper'
RSpec.describe 'Gift Page cart check', type: :feature do

  it 'Check header cart button', js: true do
  visit 'https://www.scentbird.com/register/log-in'
  find(:id, 'emailRegister').set('andrey.o.dmitriev+1@gmail.com')
  find(:id, 'passwordRegister').set('123321123')
  find(:id, 'loginFormSubmitBtn').click
  sleep 3
  visit 'https://www.scentbird.com/gift'
  find(:id, 'cartCounter').click
  expect(page).to have_selector('._1fDS0m._1bz2Dl', visible: true)
  end

  it 'Check cart CROSS button', js: true do
    visit 'https://www.scentbird.com/register/log-in'
    find(:id, 'emailRegister').set('andrey.o.dmitriev+1@gmail.com')
    find(:id, 'passwordRegister').set('123321123')
    find(:id, 'loginFormSubmitBtn').click
    sleep 3
    visit 'https://www.scentbird.com/gift'
    find(:id, 'cartCounter').click
    find(:css, '._1denU3._14F1Gj').click
    expect(page).not_to have_selector('._1fDS0m._1bz2Dl', visible: true)
  end

  it 'Check item in cart', js: true do
    visit 'https://www.scentbird.com/register/log-in'
    find(:id, 'emailRegister').set('andrey.o.dmitriev+1@gmail.com')
    find(:id, 'passwordRegister').set('123321123')
    find(:id, 'loginFormSubmitBtn').click
    sleep 3
    visit 'https://www.scentbird.com/gift'
    find(:id, 'cartCounter').click
    expect(find(:css, '._1U3gwb')).to have_content "1 Item in cart"
    expect(find(:css, '._3FxkN4')).to have_content "Monthly subscription"
    expect(find(:css, '._36mg9t')).to have_content "0.27 oz (rollerball size)"
    expect(find(:css, '._15fgTm')).to have_content "$14.95"
    expect(find(:css, '._58kuD9._1EjxLW')).to have_content "TOTAL $14.95"
    expect(find(:css, '._3viKgc')).to have_content "FREE STANDARD SHIPPING"
    expect(find(:css, '._1Q-S4A')).to have_content "Add $50.00 to your order to qualify"
  end

  it 'Check remove item from cart', js: true do
    visit 'https://www.scentbird.com/register/log-in'
    find(:id, 'emailRegister').set('andrey.o.dmitriev+1@gmail.com')
    find(:id, 'passwordRegister').set('123321123')
    find(:id, 'loginFormSubmitBtn').click
    sleep 3
    visit 'https://www.scentbird.com/gift'
    find(:id, 'cartCounter').click
    find(:css, '._1cx-iD._14F1Gj._1sAiUv').click
    expect(find(:css, '._3M8qT2')).to have_content "YOU CART IS EMPTY"
  end

end
