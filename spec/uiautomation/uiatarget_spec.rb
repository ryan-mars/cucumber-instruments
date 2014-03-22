require 'spec_helper'

describe "UIAutomation" do 

	let(:app) { UIATarget.localTarget.frontMostApp }

	describe "UIATarget" do
		it "#localTarget returns an instance of UIATarget" do
			expect(UIATarget.localTarget.class).to eq(UIATarget)
		end

		context "instruments is not running" do
			it "#localTarget will start the server" do
				Cucumber::Instruments::Server.should_receive(:start)
				sut = UIATarget.localTarget
			end	
		end

		it "#frontMostApp returns an instance of UIAApplication" do 
			target = UIATarget.localTarget
			expect(target.frontMostApp.class).to eq(UIAApplication)
		end
	end

	describe "UIAApplication" do
		it "#mainWindow returns an instance of UIAWindow" do
			expect(UIAApplication.new.mainWindow.class).to eq(UIAWindow)
		end

		it "#navigationBar returns an instance of UIANavigationBar" do
			expect(app.navigationBar.class).to eq(UIANavigationBar)
		end
	end

	describe "UIAWindow" do 
		it "#tableViews returns an instance of UIAElementArray" do
			expect(app.mainWindow.tableViews.class).to eq(UIAElementArray)		
		end

		it "#tableViews returns a UIAElementArray of UIATableViews" do
			expect(app.mainWindow.tableViews[0].class).to eq(UIATableView)
		end

		context "an app with one table view" do
			it "#tableViews has a count of 1" do
				expect(app.mainWindow.tableViews.count).to eq(1) 
			end
		end

		context "an app with no table views" do
			it "#tableViews has a count of 0" do
				pending 
				expect(app.mainWindow.tableViews.count).to eq(0) 
			end
		end
	end 

	describe "UIATableView" do 
		it "#cells returns an instance of UIAElementArray" do
			tableview = app.mainWindow.tableViews[0]
			expect(tableview.cells.class).to eq(UIAElementArray)
		end
	end 

	describe "UIANavigationBar" do 
		it "#rightButton returns an instance of UIAButton" do
			navBar = app.navigationBar
			expect(navBar.rightButton.class).to eq(UIAButton)
		end
	end 

	describe "UIAElement" do
		context "when the element exists" do 
			context "#tap" do 
				it "sends a tap to the server" do
					pending "need to implement transport"
				end 
			end
		end 

		context "when the element does not exist" do 
			it "is a UIAElementNil" do 
				pending 
			end 

			it "is not valid" do 
				pending 
			end 

			#left off here 
			it "raises an error when tapped" do 
				pending "figure out what the error should be"
			end 
		end 
	end
end 