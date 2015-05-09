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
				
		itemCount++
		
		if itemCount > colourArray.length - 1
			itemCount = 0
	
# Circle btn set up
cirleMask = "off"
circlebtn = new Layer
	width: 240
	height: 240
	backgroundColor: "#222222"

circlebtn.cornerRadius = circlebtn.width * 0.5
circlebtn.center()
circleClicked = new Animation({
	layer: circlebtn,
	properties: {scale: 0.8, opacity: 0.7}
})
revCircleClicked = circleClicked.reverse()

# Dark Mask
circlebg = new Layer
	width: circlebtn.width
	height: circlebtn.height
	backgroundColor: "#222222"
	opacity: 0.5
	cornerRadius: circlebtn.cornerRadius
	
circlebg.center()

maskStart = new Animation({
    layer: circlebg,
    properties: {opacity: 1, cornerRadius: 0, rotationZ: 90, scale: 10},
    time: 0.5    
    curve: "ease-in-out"
 })

maskEnd = maskStart.reverse()

# Circle btns
m80 = new Layer
	width: 180
	height: 180
	opacity: 0
	backgroundColor: "transparent"
	shadowSpread: 6
	shadowColor: "#FFFF9D" 
m80.center()
m80x = m80.x
m80y = m80.y

m80anime = new Animation({
	layer: m80,
	properties: {opacity: 1, y: m80.y - 240, rotationZ: 180, cornerRadius: 90},	time: 0.75
})
m8 = m80anime.reverse()

# Events
circlebtn.on Events.Click, ->
	if 	cirleMask is "off"
		maskStart.start()
		cirleMask = "on"
		m80anime.start()
		circleClicked.start()
		#Circular animatino goes here		
	else
		maskEnd.start()
		m8.start()
		revCircleClicked.start()
		cirleMask = "off"
		

m80.rotationX = 120


		

