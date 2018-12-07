require 'rails_helper'
RSpec.describe 'Gift Page who this gift for check', type: :feature do

  it 'Check Buy gift now buton top', js: true do
    visit 'https://www.scentbird.com/gift'
    find(:id, 'buyGiftNow').click
    page.save_screenshot('Buy_gift_now_buton_top.png')
    first(:css, '._2ZNcPP').hover
  end

  it 'Check Buy gift now buton bottom', js: true do
    visit 'https://www.scentbird.com/gift'
    find(:css, '._3xh483._2nQ2pA._3ltY_c._3BJw4m._2VuzPJ._17YI6K').click
    page.save_screenshot('Buy_gift_now_buton_top.png')
    first(:css, '._2ZNcPP').hover
  end

  genders = ['buyForHim', 'buyForHer']
  gender_hovers = {'buyForHim' => '._2EQuDQ.qIgTCJ', 'buyForHer' => '._2EQuDQ._1EaBly'}
  gender_names = {'buyForHim' => 'HIM', 'buyForHer' => 'HER'}
  gift_buttons = ['giftSize0Button', 'giftSize1Button', 'giftSize2Button']
  gift_sizes = {'giftSize0Button' => '3-month gift', 'giftSize1Button' => '6-month gift', 'giftSize2Button' => '12-month gift'}
  gift_prices = {'giftSize0Button' => '$44.00', 'giftSize1Button' => '$84.00', 'giftSize2Button' => '$164.00'}
  genders.each do |gender|

    it "Check Buy the gift for #{gender_names[gender]} buton", js: true do
      visit 'https://www.scentbird.com/gift'
      find(:id, 'buyGiftNow').click
      find(:css, "#{gender_hovers[gender]}").hover
      page.save_screenshot('Buy_the_gift_for_her_hover.png')
      find(:id, "#{gender}").click
      expect(page).to have_selector('._3kItdw._1OaPgX')
      find(:css, '._2_-gNZ._14F1Gj').click
      expect(page).not_to have_selector('._3kItdw._1OaPgX')
    end

 gift_buttons.each do |gift_button|
it "Check Buy the gift for #{gender_names[gender]} button / #{gift_sizes[gift_button]} / Send an email right now", js: true do
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

it "Check BACK button for #{gender_names[gender]} / Who is this gift for? / #{gift_sizes[gift_button]}", js: true do
  visit 'https://www.scentbird.com/gift'
  find(:id, 'buyGiftNow').click
  find(:css, "#{gender_hovers[gender]}").hover
  find(:id, "#{gender}").click
    find(:id, "#{gift_button}").click
    find(:css, '._2nQ2pA._3ltY_c._2VuzPJ._3_ZeX1').click
    expect(page).to have_selector('._3kItdw._1OaPgX')
  end

  it "Check BACK button for #{gender_names[gender]} / when do you want to notify the recipient of your gift?/ #{gift_sizes[gift_button]}", js: true do
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
      all(:css, '._2_-gNZ._14F1Gj')[1].click
      expect(page).to have_selector('._1UCoaq')
    end
end
end

end
