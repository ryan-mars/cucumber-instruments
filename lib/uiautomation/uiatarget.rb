class UIATarget
	def self.localTarget
		return UIATarget.new
	end 

	def frontMostApp
		return UIAApplication.new
	end 
end

class UIAApplication
	def navigationBar
		return UIANavigationBar.new
	end

	def mainWindow 
		return UIAWindow.new
	end 
end 

class UIAWindow 
	def tableViews
		return [UIATableView.new]
	end
end 

class UIATableView
	def cells
		return []
	end 
end

class UIANavigationBar
	def rightButton
		return UIAButton.new 
	end 
end 

class UIAButton
	def tap
	end 
end 