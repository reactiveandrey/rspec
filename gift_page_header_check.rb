require 'rails_helper'
RSpec.describe 'Gift Page Header check', type: :feature do

  it 'Check header logo link', js: true do
    visit 'https://www.scentbird.com/gift'
    find(:css, '.XmQS3V').click
    sleep 1
    expect(current_path).to eq('/')
  end

header_items = ['WOMEN', 'MEN', 'HOW IT WORKS']
header_items_paths = {'WOMEN' => '/subscription/main-women', 'MEN' => '/subscription/main-men',
  'HOW IT WORKS' => '/how-it-works'}
  header_items.each do |header_item|
  it "Check header #{header_item} link", js: true do
    visit 'https://www.scentbird.com/gift'
    find(:css, '.qnJCo2._2U5mFw', :text => /\A#{header_item}\z/).click
    expect(current_path).to eq("#{header_items_paths[header_item]}")
  end
end

menu_items = ['GIFTS', 'GIFT CARD', 'GIFTS FOR HIM', 'GIFTS FOR HER', 'SKINCARE SETS', 'GIFT SUBSCRIPTION']
page_paths = {'GIFTS' => '/gifts', 'GIFT CARD' => '/giftcard', 'GIFTS FOR HIM' => '/giftset-men',
  'GIFTS FOR HER' => '/giftset', 'SKINCARE SETS' => '/skincare-set', 'GIFT SUBSCRIPTION' => '/gift'}
menu_items.each do |menu_item|
  it "Check Gift / #{menu_item} / dropdown menu item", js: true do
    visit 'https://www.scentbird.com/gift'
    find(:css, '._2lKP_b.JV3s0u', :text => 'GIFT').hover
    find(:css, '._2ZCRfo.eixEwi._1ih-Tl', :text => /\A#{menu_item}\z/).click
    sleep 1
    expect(current_path).to eq("#{page_paths[menu_item]}")
  end
end

  it 'Check login button', js: true do
    visit 'https://www.scentbird.com/gift'
    find(:css, '._2U5mFw', :text => 'LOGIN').click
    expect(current_path).to eq('/register/log-in')
  end

end
