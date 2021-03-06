require 'rails_helper'

RSpec.describe "people/edit", type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString@MyString",
      :address_line_one => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip_code => "MyString"
    ))
  end

  it "renders the edit person form" do
    render

    assert_select "form[action=?][method=?]", person_path(@person), "post" do

      assert_select "input#person_first_name[name=?]", "person[first_name]"

      assert_select "input#person_last_name[name=?]", "person[last_name]"

      assert_select "input#person_email[name=?]", "person[email]"

      assert_select "input#person_address_line_one[name=?]", "person[address_line_one]"

      assert_select "input#person_city[name=?]", "person[city]"

      assert_select "input#person_state[name=?]", "person[state]"

      assert_select "input#person_zip_code[name=?]", "person[zip_code]"
    end
  end
end
