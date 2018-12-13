require 'rails_helper'
RSpec.describe 'Gift Page header check (logged in)', type: :feature do

  it 'Check header logo link', js: true do
    visit 'https://www.scentbird.com/register/log-in'
    find(:id, 'emailRegister').set('andrey.o.dmitriev+1@gmail.com')
    find(:id, 'passwordRegister').set('123321123')
    find(:id, 'loginFormSubmitBtn').click
    sleep 3
    visit 'https://www.scentbird.com/gift'
    find(:css, '.XmQS3V').click
    expect(current_path).to eq('/subscription/smartsearch')
  end

  it 'Check header Get a Free Scent link', js: true do
    visit 'https://www.scentbird.com/register/log-in'
    find(:id, 'emailRegister').set('andrey.o.dmitriev+1@gmail.com')
    find(:id, 'passwordRegister').set('123321123')
    find(:id, 'loginFormSubmitBtn').click
    sleep 3
    visit 'https://www.scentbird.com/gift'
    find(:css, '._2lKP_b', :text => 'Get a Free Scent').click
    expect(current_path).to eq('/invite')
  end

  gift_menu_items = ['ALL GIFTS', 'GIFT CARD', 'GIFTS FOR HIM', 'GIFTS FOR HER', 'SCENTBIRD GIFT SETS', 'GIFT SUBSCRIPTION']
  gift_menu_paths = {'ALL GIFTS' => '/gifts', 'GIFT CARD' => '/giftcard', 'GIFTS FOR HIM' => '/giftset-men',
   'GIFTS FOR HER' => '/giftset', 'SCENTBIRD GIFT SETS' => '/skincare-set', 'GIFT SUBSCRIPTION' => '/gift'}
  gift_menu_items.each do |gift_menu_item|
  it "Check Send a Gift / #{gift_menu_item} / dropdown menu item", js: true do
    visit 'https://www.scentbird.com/register/log-in'
    find(:id, 'emailRegister').set('andrey.o.dmitriev+1@gmail.com')
    sleep 1
    find(:id, 'passwordRegister').set('123321123')
    sleep 1
    find(:id, 'loginFormSubmitBtn').click
    sleep 4
    visit 'https://www.scentbird.com/gift'
    find(:css, '._2UqGHY', :text => 'Send a Gift').hover
    find(:css, '._2ZCRfo.eixEwi._1ih-Tl', :text => /\A#{gift_menu_item}\z/).click
    expect(current_path).to eq("#{gift_menu_paths[gift_menu_item]}")
  end
  end

  it 'Check Tracking button', js: true do
    visit 'https://www.scentbird.com/register/log-in'
    find(:id, 'emailRegister').set('andrey.o.dmitriev+1@gmail.com')
    find(:id, 'passwordRegister').set('123321123')
    find(:id, 'loginFormSubmitBtn').click
    sleep 3
    visit 'https://www.scentbird.com/gift'
    find(:css, '._2U5mFw', :text => /\ATracking\z/).click
    expect(current_path).to eq('/tracking')
  end

  it 'Check FAQ button', js: true do
    visit 'https://www.scentbird.com/register/log-in'
    find(:id, 'emailRegister').set('andrey.o.dmitriev+1@gmail.com')
    find(:id, 'passwordRegister').set('123321123')
    find(:id, 'loginFormSubmitBtn').click
    sleep 3
    visit 'https://www.scentbird.com/gift'
    find(:css, '._2U5mFw', :text => /\AFAQ\z/).click
    sleep 5
    within_window(switch_to_window(windows.last)) do
    expect(current_path).to eq('/hc/en-us')
    end
    #expect(current_path).to eq('hc/en-us')
  end
  menu_items = ['MY QUEUE', 'TRACKING', 'SUBSCRIPTION STATUS', 'SEND A GIFT', 'INVITE FRIENDS', 'RETAKE QUIZ',
  'PERSONAL INFO', 'BILLING & SHIPPING', 'CHANGE PASSWORD']
  page_paths = {'MY QUEUE' => '/queue', 'TRACKING' => '/tracking', 'SUBSCRIPTION STATUS' => '/profile/orders-status',
     'SEND A GIFT' => '/gift', 'INVITE FRIENDS' => '/invite', 'RETAKE QUIZ' => 'onboarding-men',
  'PERSONAL INFO' => '/profile/personal', 'BILLING & SHIPPING' => '/profile/billing-and-shipping', 'CHANGE PASSWORD' => '/profile/password'}
  menu_items.each do |menu_item|
  it "Check Scentbird's Profile / #{menu_item} / dropdown menu item", js: true do
    visit 'https://www.scentbird.com/register/log-in'
    find(:id, 'emailRegister').set('andrey.o.dmitriev+1@gmail.com')
    find(:id, 'passwordRegister').set('123321123')
    find(:id, 'loginFormSubmitBtn').click
    sleep 3
    visit 'https://www.scentbird.com/gift'
    find(:id, 'profileSubMenu').hover
    find(:css, '._2ZCRfo.eixEwi._1ih-Tl', :text => /\A#{menu_item}\z/).click
    expect(current_path).to eq("#{page_paths[menu_item]}")
  end
  end

  it 'Check logout button', js: true do
    visit 'https://www.scentbird.com/register/log-in'
    find(:id, 'emailRegister').set('andrey.o.dmitriev+1@gmail.com')
    find(:id, 'passwordRegister').set('123321123')
    find(:id, 'loginFormSubmitBtn').click
    sleep 4
    visit 'https://www.scentbird.com/gift'
    find(:id, 'profileSubMenu').hover
    find(:css, '._2ZCRfo.eixEwi._1ih-Tl', :text => /\ALOGOUT\z/).click
    expect(current_path).to eq('/')
    expect(page).to have_selector('._3l9XoA', :text => 'Log in', visible: true)
  end

end
