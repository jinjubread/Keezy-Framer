# Colour Grid set up
colourArray = ["#E94234","#F8CE64","#7BF5B8","#ADC96C","#F19934","#E95074","#BB60BF", "#7DF494"]
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
	opacity: 0.6
	cornerRadius: circlebtn.cornerRadius
	
circlebg.center()

maskStart = new Animation({
    layer: circlebg,
    properties: {opacity: 1, cornerRadius: 0, rotationZ: 90, scale: 10},
    time: 0.5    
    curve: "ease-in-out"
 })

maskEnd = maskStart.reverse()
# Close btns
close = new Layer
	scale:0.8, image:"images/close.png", opacity:0
close.center()

closeAnimation = new Animation({
	layer: close,
	properties: {opacity:1,rotationZ:180},
	time: 0.5,    
	curve: "spring(200,15,0)"
})

closeEnd = closeAnimation.reverse()

# Circle btns	
numCircles = 5
radius = 250
circleSize = 200
circleCount = 0
circleColor =["#79BD8F","#E74C3C","#FFFF9D","#979C9C","#3498DB"]
colorCount = 0

circleContainer = new Layer
	width: Screen.width
	height: Screen.height
	backgroundColor: "Transparent"
	scale: 0
	opacity: 0
	
circleContainer.center()

containerAnimation = new Animation({
	layer: circleContainer,
	properties: {scale:1, opacity:1,rotationZ:180},
	time: 0.3,    
	curve: "ease"
})

EndcontainerAnimation = containerAnimation.reverse()				
for i in [0...numCircles] 
	circle = new Layer
		superLayer: circleContainer
		width: circleSize
		height: circleSize
		midX: radius*Math.cos(i/numCircles*2*Math.PI + 0.5*Math.PI)
		midY: radius*Math.sin(i/numCircles*2*Math.PI + 0.5*Math.PI)
		borderRadius: "50%"
		shadowSpread: 5
		shadowColor: circleColor[colorCount]
		backgroundColor:"Transparent"
		
	colorCount++	
	if colorCount > colourArray.length - 1
		colorCount = 0
		
	circle.midX += Screen.width/2
	circle.midY += Screen.height/2

# Events
circlebtn.on Events.Click, ->
	if 	cirleMask is "off"
		maskStart.start()
		cirleMask = "on"
		closeAnimation.start()
		circleClicked.start()
		containerAnimation.start()
		colorCount = 200

#Circular animatino goes here		
	else
		maskEnd.start()
		closeEnd.start()
		revCircleClicked.start()
		EndcontainerAnimation.start()
		cirleMask = "off"
		colorCount = 0

	
				
