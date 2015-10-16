require 'test_helper'
class ChefTest < ActiveSupport::TestCase
    
    def setup
        @chef = Chef.new(chefname: "John", email: "John@infotech.com")
    end
    
    test "chef has to be valid" do
        assert @chef.valid?
    end
    
    test "chef name has to be present" do
        @chef.chefname = " "
        assert_not @chef.valid?
    end
    
    test "chefname must not be too long" do
        @chef.chefname = "a" * 41
        assert_not @chef.valid?
    end
    
    test "chefname must not be too short" do
        @chef.chefname = "aa"
        assert_not @chef.valid?
    end
    
    test "email has to be present" do
        @chef.email = " "
        assert_not @chef.valid?
    end
    
    test "email must be in a length boundary" do
        @chef.email = "a" * 101 + "infotech.com" 
        assert_not @chef.valid?
    end
    
    test "email address should be unique" do
        chef_dup = @chef.dup
        chef_dup.email = @chef.email.upcase
        @chef.save
        assert_not chef_dup.valid?
    end
    
    test "email address validation should accept valid address" do
        valid_addresses = %w[user@eer.com T-TH-R@eee.hello.org user@example.com first.last@ee.au david+chang@ee.cm]
        valid_addresses.each do |va|
            @chef.email = va
            assert @chef.valid?, '#{va.inspect} should be valid'
        end
    end
    
    test "email address validation should reject invalid address" do
        invalid_addresses = %w[user@info,com user.he user@info. @david.com]
        
        invalid_addresses.each do |inv|
            @chef.email = inv
            assert_not @chef.valid?, '#{inv.inspect} should be invalid'
        end
    end
    
end
