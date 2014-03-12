require 'spec_helper'

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
end

describe "UIAWindow" do 
	it "#tableViews returns an instance of UIAElementArray" do
		expect(UIAWindow.new.tableViews.class).to eq(UIAElementArray)		
	end

	it "#tableViews returns a UIAElementArray of UIATableViews" do
		expect(UIAWindow.new.tableViews[0].class).to eq(UIATableView)
	end
end 

describe "UIATableView" do 
	it "#cells returns an instance of UIAElementArray" do
		tableview = UIATarget.localTarget.frontMostApp.mainWindow.tableViews[0]
		expect(tableview.cells.class).to eq(UIAElementArray)
	end

	it "#cells returns a UIAElementArray of UIATableCells" do 
		pending 
	end 
end 