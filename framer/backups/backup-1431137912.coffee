# Colour Grid set up
colourArray = ["#6B0C22","#D9042B","#F4CB89","#588C8C","#011C26","#F77A52","#BEEF00", "#DEAD00"]
cols = 2
rows = 4

width  = Screen.width / cols
height = Screen.height / rows
itemCount = 0

# Colour Grid
for rowIndex in [0..rows-1] 
	for colIndex in [0..cols-1]
		cellLayer = new Layer
			width: width
			height: height
			x: colIndex * (width) 			
			y: rowIndex * (height)
			backgroundColor: colourArray[itemCount]
		
		Utils.labelLayer cellLayer, "Row #{rowIndex}, Col #{colIndex}, Item #{itemCount}", "font-size":"24px"
		
		itemCount++
		
		if itemCount > colourArray.length - 1
			itemCount = 0
	
# Circle btn set up
cirleMask = "off"
circlebtn = new Layer
	width: 240
	height: 240
	backgroundColor: "black"

circlebtn.cornerRadius = circlebtn.width * 0.5
circlebtn.center()

circlebg = new Layer
	width: circlebtn.width
	height: circlebtn.height
	backgroundColor: "#222222"
	opacity: 0
	cornerRadius: circlebtn.cornerRadius
	
circlebg.center()

maskStart = new Animation({
    layer: circlebg,
    properties: {opacity: 1, cornerRadius: 0, rotationZ: 180, scale: 10},
    time: 0.5    
    curve: "ease-in-out"
 })

maskEnd = maskStart.reverse()


# Events
circlebtn.on Events.Click, ->
	if 	cirleMask is "off"
		maskStart.start()
		cirleMask = "on"
		#Circular animatino goes here		
	else
		animationB.start()
		cirleMask = "off"
		



		

