require_relative '../config/environment'
require 'rails_helper'

describe "Module #4: Navigation Tests", :type => :routing do
    include Capybara::DSL

    before :all do
        $continue = true
    end

    around :each do |example|
        if $continue
            $continue = false 
            example.run 
            $continue = true unless example.exception
        else
            example.skip
        end
    end

    context "TodoList" do
        scenario "TodoList scaffolding was generated and it was set as root path" do 
            visit (root_path) 
            expect(page.status_code).to eq(200)
            rootPage = page
            visit (todo_lists_path)
            expect(page.status_code).to eq(200)
            expect(page).to be(rootPage)
        end
    end

    context "Authenticate" do
    
        before :all do    
            TodoItem.destroy_all
            TodoList.destroy_all
            User.destroy_all
            load "#{Rails.root}/db/seeds.rb"  
        end

        subject(:user) {
            User.find_by(:username=>"jim").authenticate("abc123")
        }
          end
 end
