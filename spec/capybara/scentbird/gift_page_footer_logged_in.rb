require 'rails_helper'
RSpec.describe 'Gift Page footer check (logged in)', type: :feature do

footer_items = ['About Us', 'Blogger Program', 'Affiliate Program', 'For Press', 'Blog',
  'Careers', 'Reviews', 'Shop', 'Send a Gift', 'Shop perfumes', 'Shop colognes']
footer_page_paths = {'About Us' => '/team', 'Blogger Program' => '/blogger', 'Affiliate Program' => '/affiliate-program',
  'For Press' => '/press', 'Blog' => '/blog/', 'Careers' => '/careers', 'Reviews' => '/scentbird-reviews',
'Shop' => '/subscription/smartsearch', 'Send a Gift' => '/gift', 'Shop perfumes' => '/subscription/colognes',
'Shop colognes' => '/subscription/colognes'}
footer_items.each do |footer_item|
it "Check Footer links / #{footer_item}", js: true do
  visit 'https://www.scentbird.com/register/log-in'
  find(:id, 'emailRegister').set('andrey.o.dmitriev+1@gmail.com')
  find(:id, 'passwordRegister').set('123321123')
  find(:id, 'loginFormSubmitBtn').click
  sleep 4
  visit 'https://www.scentbird.com/gift'
  find(:css, '._2gE6bX', :text => /\A#{footer_item}\z/).click
  sleep 2
  expect(current_path).to eq("#{footer_page_paths[footer_item]}")
 end
end
      genders = ['buyForHim', 'buyForHer']
      gender_hovers = {'buyForHim' => '._2EQuDQ.qIgTCJ', 'buyForHer' => '._2EQuDQ._1EaBly'}
      gender_names = {'buyForHim' => 'HIM', 'buyForHer' => 'HER'}
      gift_buttons = ['giftSize0Button', 'giftSize1Button', 'giftSize2Button']
      gift_sizes = {'giftSize0Button' => '3-month gift', 'giftSize1Button' => '6-month gift', 'giftSize2Button' => '12-month gift'}
      gift_prices = {'giftSize0Button' => '$44.00', 'giftSize1Button' => '$84.00', 'giftSize2Button' => '$164.00'}
      genders.each do |gender|
     gift_buttons.each do |gift_button|
    it "Check Buy the gift for #{gender_names[gender]} button / #{gift_sizes[gift_button]} / Send an email right now", js: true do
      visit 'https://www.scentbird.com/register/log-in'
      find(:id, 'emailRegister').set('andrey.o.dmitriev+1@gmail.com')
      find(:id, 'passwordRegister').set('123321123')
      find(:id, 'loginFormSubmitBtn').click
      sleep 3
      visit 'https://www.scentbird.com/gift'
      find(:id, 'buyGiftNow').click
      find(:css, "#{gender_hovers[gender]}").hover
      find(:id, "#{gender}").click
        find(:id, "#{gift_button}").click
        find(:id, 'giftModalRecipientName').set('Ivan')
        find(:id, 'giftModalRecipientEmail').set('ivan@aaa.aaa')
        find(:id, 'giftModalPersonalMessage').set('test')
        find(:id, 'giftPersonNextButton').click
        expect(page).to have_selector('._1OaPgX')
        find(:id, 'giftRightNowButton').click
        expect(current_path).to eq('/gift/payment')
        expect(find(:id, 'billSubscriptionTotalRow')).to have_content "#{gift_prices[gift_button]}"
    end

  it "Check Buy the gift for #{gender_names[gender]} button / #{gift_sizes[gift_button]} / Choose a specific date", js: true do
    visit 'https://www.scentbird.com/register/log-in'
    find(:id, 'emailRegister').set('andrey.o.dmitriev+1@gmail.com')
    find(:id, 'passwordRegister').set('123321123')
    find(:id, 'loginFormSubmitBtn').click
    sleep 3
    visit 'https://www.scentbird.com/gift'
    find(:id, 'buyGiftNow').click
    find(:css, "#{gender_hovers[gender]}").hover
    find(:id, "#{gender}").click
      find(:id, "#{gift_button}").click
      find(:id, 'giftModalRecipientName').set('Ivan')
      find(:id, 'giftModalRecipientEmail').set('ivan@aaa.aaa')
      find(:id, 'giftModalPersonalMessage').set('test')
      find(:id, 'giftPersonNextButton').click
      expect(page).to have_selector('._1OaPgX')
      find(:id, 'giftDateButton').click
      find(:id, 'giftNextButton').click
      expect(current_path).to eq('/gift/payment')
      expect(find(:id, 'billSubscriptionTotalRow')).to have_content "#{gift_prices[gift_button]}"
    end

    it "Check Buy the gift for #{gender_names[gender]} buton", js: true do
      visit 'https://www.scentbird.com/register/log-in'
      find(:id, 'emailRegister').set('andrey.o.dmitriev+1@gmail.com')
      find(:id, 'passwordRegister').set('123321123')
      find(:id, 'loginFormSubmitBtn').click
      sleep 3
      visit 'https://www.scentbird.com/gift'
      find(:id, 'buyGiftNow').click
      find(:css, "#{gender_hovers[gender]}").hover
      page.save_screenshot('Buy_the_gift_for_her_hover.png')
      find(:id, "#{gender}").click
      expect(page).to have_selector('._3kItdw._1OaPgX')
      find(:css, '._2_-gNZ._14F1Gj').click_link
      expect(page).not_to have_selector('._3kItdw._1OaPgX')
    end

    it "Check BACK button for #{gender_names[gender]} / Who is this gift for? / #{gift_sizes[gift_button]}", js: true do
      visit 'https://www.scentbird.com/register/log-in'
      find(:id, 'emailRegister').set('andrey.o.dmitriev+1@gmail.com')
      find(:id, 'passwordRegister').set('123321123')
      find(:id, 'loginFormSubmitBtn').click
      sleep 3
      visit 'https://www.scentbird.com/gift'
      find(:id, 'buyGiftNow').click
      find(:css, "#{gender_hovers[gender]}").hover
      find(:id, "#{gender}").click
        find(:id, "#{gift_button}").click
        find(:css, '._2nQ2pA._3ltY_c._2VuzPJ._3_ZeX1').click
        expect(page).to have_selector('._3kItdw._1OaPgX')
      end

      it "Check BACK button for #{gender_names[gender]} / when do you want to notify the recipient of your gift?/ #{gift_sizes[gift_button]}", js: true do
        visit 'https://www.scentbird.com/register/log-in'
        find(:id, 'emailRegister').set('andrey.o.dmitriev+1@gmail.com')
        find(:id, 'passwordRegister').set('123321123')
        find(:id, 'loginFormSubmitBtn').click
        sleep 3
        visit 'https://www.scentbird.com/gift'
        find(:id, 'buyGiftNow').click
        find(:css, "#{gender_hovers[gender]}").hover
        find(:id, "#{gender}").click
          find(:id, "#{gift_button}").click
          find(:id, 'giftModalRecipientName').set('Ivan')
          find(:id, 'giftModalRecipientEmail').set('ivan@aaa.aaa')
          find(:id, 'giftModalPersonalMessage').set('test')
          find(:id, 'giftPersonNextButton').click
          expect(page).to have_selector('._1OaPgX')
          find(:css, '._2nQ2pA._3ltY_c._3BJw4m._2VuzPJ._3_ZeX1').click
          expect(page).to have_selector('.KjUypu._1OaPgX')
      end

      it "Check CROSS button for #{gender_names[gender]} /Choose a specific date / #{gift_sizes[gift_button]}", js: true do
        visit 'https://www.scentbird.com/register/log-in'
        find(:id, 'emailRegister').set('andrey.o.dmitriev+1@gmail.com')
        find(:id, 'passwordRegister').set('123321123')
        find(:id, 'loginFormSubmitBtn').click
        sleep 3
        visit 'https://www.scentbird.com/gift'
        find(:id, 'buyGiftNow').click
        find(:css, "#{gender_hovers[gender]}").hover
        find(:id, "#{gender}").click
          find(:id, "#{gift_button}").click
          find(:id, 'giftModalRecipientName').set('Ivan')
          find(:id, 'giftModalRecipientEmail').set('ivan@aaa.aaa')
          find(:id, 'giftModalPersonalMessage').set('test')
          find(:id, 'giftPersonNextButton').click
          expect(page).to have_selector('._1OaPgX')
          find(:id, 'giftDateButton').click
          find(:css, '._2_-gNZ._14F1Gj').click
          expect(page).to have_selector('._1OaPgX')
        end
   end
end


end
