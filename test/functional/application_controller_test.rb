require 'test_helper'

class ApplicationControllerTest < ActionController::TestCase
  context "errors_for" do
    setup do
      @model = Factory(:presentation)
      @model.errors.add_to_base("is invalid & all")
      @model.errors.add(:name, "is already taken")
    end

    should "escape HTML" do
      result = @controller.class.errors_for(@model)
      assert_equal "<span>is invalid &amp; all</span><br />\n<span>Name is already taken</span>", result
    end
  end
end
