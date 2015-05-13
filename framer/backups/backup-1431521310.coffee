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
distance = 200

m80 = new Layer
	width: 120
	height: 120
	opacity: 0
	backgroundColor: "transparent"
	shadowSpread: 4
	shadowColor: "#79BD8F" 
m80.center()
m80x = m80.x
m80y = m80.y

m80anime = new Animation({
	layer: m80,
	properties: {opacity: 1, y: m80.y - distance, rotationZ: 220, scale:1.5, cornerRadius: 90},	time: 0.5,
	originX: m80x,
})
m8 = m80anime.reverse()

# Circle btns - 2
numCircles = 5
radius = 250
circleSize = 200

for i in [0...numCircles]
	circle = new Layer
		width: circleSize
		height: circleSize
		midX: radius*Math.cos(i/numCircles*2*Math.PI - 0.5*Math.PI)
		midY: radius*Math.sin(i/numCircles*2*Math.PI - 0.5*Math.PI)
		borderRadius: "50%"
		backgroundColor: "transparent"
		shadowSpread: 4
		shadowColor: "hsla(#{i/numCircles*360},80%,50%,1)"
	circle.midX += Screen.width/2 
	circle.midY += Screen.height/2 
	
print circle.midX
		
# Events
circlebtn.on Events.Click, ->
	if 	cirleMask is "off"
		maskStart.start()
		cirleMask = "on"
		closeAnimation.start()

		circleClicked.start()
		#Circular animatino goes here		
	else
		maskEnd.start()
		closeEnd.start()
		revCircleClicked.start()
		cirleMask = "off"
		

