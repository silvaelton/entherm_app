require 'test_helper'

module Deal
  class InventoriesControllerTest < ActionController::TestCase
    setup do
      @inventory = deal_inventories(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:inventories)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create inventory" do
      assert_difference('Inventory.count') do
        post :create, inventory: {  }
      end

      assert_redirected_to inventory_path(assigns(:inventory))
    end

    test "should show inventory" do
      get :show, id: @inventory
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @inventory
      assert_response :success
    end

    test "should update inventory" do
      patch :update, id: @inventory, inventory: {  }
      assert_redirected_to inventory_path(assigns(:inventory))
    end

    test "should destroy inventory" do
      assert_difference('Inventory.count', -1) do
        delete :destroy, id: @inventory
      end

      assert_redirected_to inventories_path
    end
  end
end
