Given(/^I have an Energy Card$/) do
  @energy_card = EnergyCard.new
end

When(/^Element Type is required$/) do
  @energy_card.validate
  @errors = @energy_card.errors
end

Then(/^Error list should contains the Element Type$/) do
  expect(@errors.added? :element_type, :blank).to be_truthy
end
