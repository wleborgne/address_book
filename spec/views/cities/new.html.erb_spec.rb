require 'rails_helper'

RSpec.describe "cities/new", type: :view do
  before(:each) do
    assign(:city, City.new(
      :name => "MyString",
      :population => 1,
      :elevation => 1,
      :state => "MyString"
    ))
  end

  it "renders new city form" do
    render

    assert_select "form[action=?][method=?]", cities_path, "post" do

      assert_select "input#city_name[name=?]", "city[name]"

      assert_select "input#city_population[name=?]", "city[population]"

      assert_select "input#city_elevation[name=?]", "city[elevation]"

      assert_select "input#city_state[name=?]", "city[state]"
    end
  end
end
