require "application_system_test_case"

class PropertiesTest < ApplicationSystemTestCase
  setup do
    @property = properties(:one)
  end

  test "visiting the index" do
    visit properties_url
    assert_selector "h1", text: "Properties"
  end

  test "should create property" do
    visit properties_url
    click_on "New property"

    fill_in "Availability", with: @property.availability
    fill_in "Description", with: @property.description
    fill_in "Location", with: @property.location
    fill_in "Name", with: @property.name
    fill_in "Owner agent", with: @property.owner_agent
    fill_in "Plot size", with: @property.plot_size
    fill_in "Price", with: @property.price
    fill_in "Property status", with: @property.property_status
    fill_in "Property type", with: @property.property_type
    click_on "Create Property"

    assert_text "Property was successfully created"
    click_on "Back"
  end

  test "should update Property" do
    visit property_url(@property)
    click_on "Edit this property", match: :first

    fill_in "Availability", with: @property.availability
    fill_in "Description", with: @property.description
    fill_in "Location", with: @property.location
    fill_in "Name", with: @property.name
    fill_in "Owner agent", with: @property.owner_agent
    fill_in "Plot size", with: @property.plot_size
    fill_in "Price", with: @property.price
    fill_in "Property status", with: @property.property_status
    fill_in "Property type", with: @property.property_type
    click_on "Update Property"

    assert_text "Property was successfully updated"
    click_on "Back"
  end

  test "should destroy Property" do
    visit property_url(@property)
    click_on "Destroy this property", match: :first

    assert_text "Property was successfully destroyed"
  end
end
