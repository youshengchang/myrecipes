require 'test_helper'
class RecipeTest < ActiveSupport::TestCase
    
    def setup
        @chef = Chef.create(chefname: "Bob", email: "bob@recipe.com")
        @recipe = @chef.recipes.build(name: "chicken parm", summary: "This is the best chicken parm recipe ever",
                    description: "add oil, add tomato, add onions, add chicken, add water and cook for 20 mins")
    end
    
    test "recipe should be valid" do
        assert @recipe.valid?
    end
    
    test "recipe should have a chef_id set" do
        @recipe.chef_id = nil
        assert_not @recipe.valid?
    end
    
    test "name must be present" do
        @recipe.name = " "
        assert_not @recipe.valid?
    end
    
    test "name length must not be too long" do
        @recipe.name = "a" * 101
        assert_not @recipe.valid?
    end
    
    test "name length must not be too short" do
        @recipe.name = "a" * 4
        assert_not @recipe.valid?
    end
    
    test "summary must be present" do
        @recipe.summary = " "
        assert_not @recipe.valid?
    end
    
    test "summary length must not be too long" do
        @recipe.summary = "a" * 151
        assert_not @recipe.valid?
    end
    
    test "summary length must not be too short" do
        @recipe.summary = "a" * 9
        assert_not @recipe.valid?
    end
    
    test "description must be present" do
        @recipe.description = " "
        assert_not @recipe.valid?
    end
    
    test "description length must not be too long" do
        @recipe.description = "a" * 501
        assert_not @recipe.valid?
    end
    
    test "description length must not be too short" do
        @recipe.description = "a" * 19
        assert_not @recipe.valid?
    end
end
