colourArray = ["#6B0C22","#D9042B","#F4CB89","#588C8C","#011C26","#F77A52","#BEEF00", "#DEAD00"]
rows = 2
cols = 4

width  = Screen.width / cols
height = Screen.height / rows
itemCount = 0

for rowIndex in [0..rows-1] 
	for colIndex in [0..cols-1]
		cellLayer = new Layer
			width: width
			height: height
			x: colIndex * (width) 			
			y: rowIndex * (height)
			backgroundColor: colourArray[itemCount]
		
		Utils.labelLayer cellLayer, "#{rowIndex}:#{colIndex},#{itemCount}", "font-size":"24px"
		
		itemCount++
		
		if itemCount > colourArray.length - 1
			itemCount = 0