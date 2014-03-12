require 'spec_helper'

describe "UIAutomation" do 

	let(:app) { UIATarget.localTarget.frontMostApp }

	describe "UIATarget" do
		it "#localTarget returns an instance of UIATarget" do
			expect(UIATarget.localTarget.class).to eq(UIATarget)
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
		it "sends a #tap to to the UIAutomation Server" do
			pending "need to mock up API"
		end
	end
end 