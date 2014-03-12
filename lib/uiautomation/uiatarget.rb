class UIATarget 
	def self.localTarget
		return UIATarget.new
	end 

	def frontMostApp
		return UIAApplication.new
	end
end

class UIAApplication
	def mainWindow
		return UIAWindow.new 
	end 

	def navigationBar 
		return UIANavigationBar.new 
	end 
end 

class UIAWindow 
	def tableViews
		array = UIAElementArray.new
		array << UIATableView.new 
		return array
	end 
end 

class UIAElementArray < Array 

end 

class UIATableView
	def cells
		return UIAElementArray.new
	end 
end 

class UIANavigationBar
	def rightButton
		return UIAButton.new
	end 
end 

class UIAElement
	def tap
	end 
end 

class UIAButton < UIAElement
end 

