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
m81 = new Layer
	width: 120
	height: 120
	opacity: 0
	backgroundColor: "transparent"
	shadowSpread: 4
	shadowColor: "#E74C3C" 
m81.center()
m81x = m81.x
m81y = m81.y

m81anime = new Animation({
	layer: m81,
	properties: {opacity: 1, y: m81.y + distance, rotationZ: 220, scale:1.5, cornerRadius: 90},	time: 0.5,
	originX: m81x,
})
m81r = m81anime.reverse()

# Circle btns - 3
m82 = new Layer
	width: 120
	height: 120
	opacity: 0
	backgroundColor: "transparent"
	shadowSpread: 4
	shadowColor: "#FFFF9D" 
m82.center()
m82x = m82.x
m82y = m82.y

m82anime = new Animation({
	layer: m82,
	properties: {opacity: 1, x: m82.x - distance, rotationZ: 220, scale:1.5, cornerRadius: 90},	time: 0.5,
	originX: m82x,
})
m82r = m82anime.reverse()

# Circle btns - 4
m83 = new Layer
	width: 120
	height: 120
	opacity: 0
	backgroundColor: "transparent"
	shadowSpread: 4
	shadowColor: "#979C9C" 
m83.center()
m83x = m83.x
m83y = m83.y

m83anime = new Animation({
	layer: m83,
	properties: {opacity: 1, x: m83.x + distance, rotationZ: 220, scale:1.5, cornerRadius: 90},	time: 0.5,
	originX: m83x,
})
m83r = m83anime.reverse()
	
# Events
circlebtn.on Events.Click, ->
	if 	cirleMask is "off"
		maskStart.start()
		cirleMask = "on"
		m80anime.start()
		m81anime.start()
		m82anime.start()
		m83anime.start()
		
		circleClicked.start()
		#Circular animatino goes here		
	else
		maskEnd.start()
		m8.start()
		m81r.start()
		m82r.start()
		m83r.start()
		revCircleClicked.start()
		cirleMask = "off"
		


		

