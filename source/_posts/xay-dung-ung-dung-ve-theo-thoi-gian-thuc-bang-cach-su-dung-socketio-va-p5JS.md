---
title: Xây dựng ứng dụng vẽ theo thời gian thực bằng cách sử dụng Socket.IO và p5.js
date: 2019-04-02 19:00:00
authorId: hoang_an
tags:
---
![Xây dựng ứng dụng vẽ thời gian thực bằng cách sử dụng Socket.IO và p5.js](https://res.cloudinary.com/djeghcumw/image/upload/v1561089384/blog/0_9_J0jUbehpi2kJ4S.jpg)
Xây dựng một ứng dụng vẽ theo thời gian thực cho phép người dùng vẽ cùng nhau trong một dự án.
Trong hướng dẫn này, chúng tôi sẽ xây dựng một ứng dụng vẽ thời gian thực, cho phép người dùng vẽ cùng nhau trong một dự án.
Ứng dụng được xây dựng bằng  [Express js](https://expressjs.com/) server và [p5.js](https://p5js.org/) cho các tính năng vẽ. Về phái Client-side được xử lý thông qua WebSockets - cụ thể là [Socket.IO](https://socket.io/).
Vì vậy, không lãng phí thêm thời gian nào nữa, hãy để bắt đầu.
<!-- more -->
## Thiết lập
Trước khi chúng ta có thể bắt đầu code, trước tiên chúng ta cần `setup` dự án của mình và cài đặt tất cả các phụ thuộc cần thiết. Đối với điều đó, bạn cần mở `terminal` của bạn và chạy các lệnh sau.
Đầu tiên, chúng ta cần tạo một thư mục và `cd` vào nó.
```
mkdir drawingapp 
cd drawingapp
```
Sau đó, chúng ta có thể bắt đầu cài đặt các phụ thuộc và tạo các tệp cần thiết.
```
npm init
```
[npm](https://www.npmjs.com/) sẽ hỏi bạn một số câu hỏi - chỉ cần trả lời chúng và tiếp tục với hướng dẫn.
```
npm install express p5 socket.io --save
```
Bây giờ, bạn cần tạo cấu trúc thư mục và các tệp cần thiết cho dự án. Ở đây, một hình ảnh của cấu trúc thư mục của tôi.

![enter image description here](https://res.cloudinary.com/djeghcumw/image/upload/v1561089385/blog/1_V7gC0fLu2GNYmKvA28wDQw.png)

Bạn cũng có thể tìm thấy cấu trúc trên [Github](https://github.com/TannerGabriel/DrawingApp) của tôi.
Thiết lập ban đầu được thực hiện, vì vậy chúng tôi có thể bắt đầu tạo `layout` của mình và thực hiện chức năng vẽ.

## Giao diện ứng dụng
Bây giờ chúng ta đã thiết lập dự án, hãy để bắt đầu tạo bố cục trong tệp `index.html` của bạn.

```html
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8" />
  <title>Websockets drawing app</title>
  <link rel="stylesheet" type="text/css" href="styles.css" />
  <script type="text/javascript" src="https://cdn.socket.io/socket.io-1.4.5.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.7.3/p5.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.7.3/addons/p5.dom.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.7.3/addons/p5.sound.min.js">
  </script>
  <script type="text/javascript" src="sketch.js"></script>
</head>

<body>
  <p>Choose color (# hex)</p>
  <input type="text" name="custom_color" placeholder="#FFFFFF" id="pickcolor" class="call-picker" />
  <div id="color-holder" class="color-holder call-picker"></div>
  <button id="color-btn">Change color</button>
  <br />
  <p>Choose stroke width</p>
  <input type="text" name="stroke_width" placeholder="4" id="stroke-width-picker" class="stroke_width_picker" />
  <button id="stroke-btn">Change stroke width</button>
</body>

</html>
```
Ở đây, chúng tôi chỉ tạo một tệp HTML cơ bản với hai trường đầu vào. Chúng ta sẽ sử dụng những thứ này sau để thay đổi màu sắc và chiều rộng của nét vẽ của chúng ta.

Chúng ta cũng hãy thêm một số kiểu CSS cơ bản vào ứng dụng của mình để làm cho các trường nhập và `button` trông đẹp hơn.

```css
input.call-picker {
  border: 1px solid #AAA;
  color: #666;
  text-transform: uppercase;
  float: left;
  outline: none;
  padding: 10px;
  text-transform: uppercase;
  width: 85px;
}

.color-picker {
  width: 130px;
  background: #F3F3F3;
  height: 81px;
  padding: 5px;
  border: 5px solid #fff;
  box-shadow: 0px 0px 3px 1px #DDD;
  position: absolute;
  top: 61px;
  left: 2px;
}

.color-holder {
  background: #fff;
  cursor: pointer;
  border: 1px solid #AAA;
  width: 40px;
  height: 36px;
  float: left;
  margin-left: 5px;
}

input.stroke_width_picker {
  border: 1px solid #AAA;
  color: #666;
  text-transform: uppercase;
  float: left;
  outline: none;
  padding: 10px;
  text-transform: uppercase;
  width: 85px;
}

p {
  margin-top: 2rem;
  margin-bottom: 2rem;
}

button {
  margin-left: 1rem;
}
```
Sau đó, chúng ta có thể bắt đầu triển khai các tính năng vẽ của mình bằng thư viện `p5.js`.

## Tạo chức năng vẽ
P5.js là một thư viện xử lý JavaScript, với mục tiêu làm các `artists` hay `designers` cũng có thể sử dụng nó.

Nó cung cấp một tập hợp đầy đủ các chức năng vẽ và thậm chí là `DOM` của riêng nó (Document Object Model). Trong hướng dẫn này, chúng tôi sẽ sử dụng nó để tạo và quản lý khung vẽ của chúng tôi, cũng như thêm `event listeners` vào hai `button` mà chúng tôi đã thêm ở trên.

## Thêm Canvas
Trước tiên, bạn cần tạo một tệp `sketch.js` trong thư mục chung của bạn, nếu bạn chưa có. Sau đó, chúng ta có thể bắt đầu bằng cách thực hiện hàm p5 `setup()` cơ bản.
```javascript
function  setup() {}
```
Sau đó, chúng ta có thể bắt đầu bằng cách tạo một `canvas` và thiết lập `position`.
```javascript
const cv = createCanvas(800, 600)
cv.position(600, 100)
cv.background(0)
```

## Thực hiện bản vẽ
Bây giờ, chúng tôi tiếp tục triển khai hàm `mouseDragged()`, vì vậy chúng tôi có thể vẽ khi người dùng nhấp vào khung vẽ.
```javascript
function mouseDragged() {
 // Draw
 stroke(color)
 strokeWeight(strokeWidth)
 line(mouseX, mouseY, pmouseX, pmouseY)
}
```
Ở đây, chúng tôi đặt `color` và `width` của nét vẽ, sau đó vẽ một đường bằng tọa độ chúng tôi có được thông qua thư viện p5.

## Thêm Button Listeners
Chúng ta chỉ cần lấy `color` và `width` nét vẽ từ các `input fields`, sử dụng `p5.js DOM`. Để làm được điều đó, chúng ta cần thêm *onclick listener* vào hai `button` của mình và sau đó lấy `input` từ  `field`.

Chúng tôi bắt đầu bằng cách tạo hai biến trên đầu tập lệnh của chúng tôi để giữ `color` và `width` của nét vẽ và gán cho chúng một giá trị mặc định.
```javascript
let color = '#FFF'
let strokeWidth = 4
```
Chúng tôi nhận được `buttons` và `inputs`, sử dụng hàm `select()` được cung cấp bởi `p5.js DOM`.

```javascript
// Getting our buttons and the inputs through the p5.js dom
const color_picker = select('#pickcolor')
const color_btn = select('#color-btn')
const color_holder = select('#color-holder')
const stroke_width_picker = select('#stroke-width-picker')
const stroke_btn = select('#stroke-btn')
```
Sau đó, chúng tôi thêm `mousePressed` listener vào các `button` của chúng tôi, `button` này sẽ được thực thi bất cứ khi nào nút được nhấp. Sau đó, chúng tôi xác nhận giá trị đầu vào hiện tại và lưu nó vào biến của chúng tôi nếu nó hợp lệ.
```javascript
// Adding a mousePressed listener to the buttoncolor_btn.mousePressed(() => {
 // Checking if the input is a valid hex color
 if (/(^#[0-9A-F]{6}$)|(^#[0-9A-F]{3}$) /i.test(color_picker.value())){
  color = color_picker.value()
  color_holder.style('background-color', color)
}
 else {console.log('Enter a valid hex value')}
}
// Adding a mousePressed listener to the button
stroke_btn.mousePressed(() => {
 const width = parseInt(stroke_width_picker.value())
 if (width > 0) strokeWidth = width
})
```

## Source code hoàn chỉnh cho Sketch.js
Đây là source code hoàn chỉnh mà chúng tôi viết cho đến nay.
```javascript
let color = '#FFF'
let strokeWidth = 4

function setup() {
	// Creating canvas
	const cv = createCanvas(800, 600)
	cv.position(600, 100)
	cv.background(0)

	// Getting our buttons and the holder through the p5.js dom
	const color_picker = select('#pickcolor')
	const color_btn = select('#color-btn')
	const color_holder = select('#color-holder')

	const stroke_width_picker = select('#stroke-width-picker')
	const stroke_btn = select('#stroke-btn')

	// Adding a mousePressed listener to the button
	color_btn.mousePressed(() => {
		// Checking if the input is a valid hex color
		if (/(^#[0-9A-F]{6}$)|(^#[0-9A-F]{3}$)/i.test(color_picker.value())) {
			color = color_picker.value()
			color_holder.style('background-color', color)
		}
		else {console.log('Enter a valid hex value')}
	})

	// Adding a mousePressed listener to the button
	stroke_btn.mousePressed(() => {
		const width = parseInt(stroke_width_picker.value())
		if (width > 0) strokeWidth = width
	})
}

function mouseDragged() {
	// Draw
	stroke(color)
	strokeWeight(strokeWidth)
	line(mouseX, mouseY, pmouseX, pmouseY)
}
```

## Thêm Server Side
Bây giờ hãy xem cách chúng ta có thể sử dụng `Express.js` để chạy ứng dụng vẽ của mình trong trình duyệt.

Trước tiên, chúng ta cần tạo một `basic express server` và lắng nghe nó trên một cổng trên PC của chúng ta. Chúng tôi sẽ làm như vậy trong tệp `server.js` của chúng tôi.
```javascript
const http = require('http')
const express = require('express')
const app = express()
app.set('port', '3000')
const server = http.createServer(app)
server.on('listening', () => {
 console.log('Listening on port 3000')
})
server.listen('3000')
```
Bây giờ chúng tôi chỉ cần nói với ứng dụng của chúng tôi là sử dụng các tài nguyên nằm trong thư mục `public`.
```javascript
app.use(express.static('public'))
```
Sau đó, chúng tôi có thể kiểm tra ứng dụng của mình bằng cách chạy lệnh `node server `

Sau khi chạy nó, bạn sẽ thấy một khung vẽ màu đen ở giữa màn hình của bạn khi bạn truy cập http://localhost: 3000/ trong trình duyệt của bạn và bạn sẽ có thể vẽ trên đó.

## Source code hoàn chỉnh cho Server.js
```javascript
const http = require('http')
const express = require('express')

const app = express()
app.use(express.static('public'))

app.set('port', '3000')

const server = http.createServer(app)
server.on('listening', () => {
 console.log('Listening on port 3000')
})

server.listen('3000')
```

## Socket.IO
Bây giờ chúng ta đã hoàn thành việc xây dựng chức năng vẽ và máy chủ, hãy xem cách sử dụng Socket.IO, để cho phép giao tiếp theo thời gian thực giữa người dùng.
### Socket.IO setup:
Trước tiên, hãy xem cách có thể thiết lập Socket IO trong dự án của chúng tôi và cách chúng tôi có thể lắng nghe các sự kiện của chính mình.
Vì vậy, chúng ta cần `import` Socket.IO trong `server.js`  và truyền biến máy chủ cho nó.
```javascript
const  io  =  require('socket.io')(server)
```
Sau đó, chúng tôi cần thêm một số `listeners` vào `socket` để chúng tôi có thể phản ứng với các sự kiện như gửi dữ liệu.
```javascript
io.sockets.on('connection', (socket) => {
 console.log('Client connected: ' + socket.id)
 socket.on('mouse', (data) => socket.broadcast.emit('mouse', data))
 socket.on('disconnect', () => console.log('Client has disconnected'))
})
```
Lưu ý rằng `mouse event` là một sự kiện tùy chỉnh mà chúng tôi sẽ tạo trong tệp `sketch.js` của chúng tôi sau này. `Socket.broadcast.emit` được sử dụng để gửi dữ liệu tới tất cả các `sockets` hiện đang trực tuyến, ngoại trừ `socket` đang gửi nó.

### Sử dụngSocket.IO trong sketch.js
Tiếp theo, chúng ta cần tạo triển khai phía `client side` của Socket.IO.
Vì vậy, chúng ta cần tạo một biến socket sẽ giữ Socket.IO client.
```javascript
We then initialize a socket by calling the `connect()` function on our IO object, and passing it the URL our website runs on (in this example localhost:3000).
```
Sau đó, chúng tôi khởi tạo một socket bằng cách gọi hàm `connect()` trên đối tượng IO của chúng tôi và reuyeefncho nó URL mà trang web của chúng tôi chạy trên (trong ví dụ này localhost:3000).
```javascript
// Start the socket connection
socket = io.connect('http://localhost:3000')
```
Bây giờ chúng ta có thể bắt đầu gửi dữ liệu của mình đến tất cả các `socket` khác hiện đang trực tuyến, bằng cách lấy dữ liệu bản vẽ của chúng tôi và gửi nó bằng hàm `emit()`.
```javascript 
// Sending data to the socket
function sendmouse(x, y, pX, pY) {
 const data = {
  x: x,
  y: y,
  px: pX,
  py: pY,
  color: color,
  strokeWidth: strokeWidth,
 }
 socket.emit('mouse', data)
}
```
Emit đưa đến ID tham số (của sự kiện cần gửi đến. Trong trường hợp `mouse` của chúng tôi như chúng tôi đã defined trong tệp `server.js`) và dữ liệu chúng tôi muốn gửi.
Bây giờ, chúng ta chỉ cần gọi hàm bất cứ khi nào chúng ta vẽ trong hàm `mousDragged()`.
```javascript
sendmouse(mouseX, mouseY, pmouseX, pmouseY)
```
Sau đó, chúng ta chỉ cần lấy dữ liệu được gửi bởi các sockets khác. Chúng ta có thể làm như vậy bằng cách lắng nghe `mouse event` , nó sẽ được gọi bất cứ khi nào một socket gửi dữ liệu. Sau đó, chúng ta chỉ cần vẽ các dòng với dữ liệu chúng ta nhận được.
```javascript
socket.on('mouse', data => {
 stroke(data.color)
 strokeWeight(data.strokeWidth)
 line(data.x, data.y, data.px, data.py)
})
```
Yeah! Bây giờ bạn chỉ cần kiểm tra ứng dụng của mình bằng cách mở nó trong nhiều cửa sổ và vẽ chúng.

## Complete Code
### Sketch.js:
```javascript
let socket
let color = '#FFF'
let strokeWidth = 4

function setup() {
	// Creating canvas
	const cv = createCanvas(800, 600)
	cv.position(600, 100)
	cv.background(0)

	// Start the socket connection
	socket = io.connect('http://localhost:3000')

	// Callback function
	socket.on('mouse', data => {
		stroke(data.color)
		strokeWeight(data.strokeWidth)
		line(data.x, data.y, data.px, data.py)
	})

	// Getting our buttons and the holder through the p5.js dom
	const color_picker = select('#pickcolor')
	const color_btn = select('#color-btn')
	const color_holder = select('#color-holder')

	const stroke_width_picker = select('#stroke-width-picker')
	const stroke_btn = select('#stroke-btn')

	// Adding a mousePressed listener to the button
	color_btn.mousePressed(() => {
		// Checking if the input is a valid hex color
		if (/(^#[0-9A-F]{6}$)|(^#[0-9A-F]{3}$)/i.test(color_picker.value())) {
			color = color_picker.value()
			color_holder.style('background-color', color)
		}
		else {console.log('Enter a valid hex value')}
	})

	// Adding a mousePressed listener to the button
	stroke_btn.mousePressed(() => {
		const width = parseInt(stroke_width_picker.value())
		if (width > 0) strokeWidth = width
	})
}

function mouseDragged() {
	// Draw
	stroke(color)
	strokeWeight(strokeWidth)
	line(mouseX, mouseY, pmouseX, pmouseY)

	// Send the mouse coordinates
	sendmouse(mouseX, mouseY, pmouseX, pmouseY)
}

// Sending data to the socket
function sendmouse(x, y, pX, pY) {
	const data = {
		x: x,
		y: y,
		px: pX,
		py: pY,
		color: color,
		strokeWidth: strokeWidth,
	}

	socket.emit('mouse', data)
}
```
### Server.js:
```javascript
const http = require('http')
const express = require('express')

const app = express()
app.use(express.static('public'))

app.set('port', '3000')

const server = http.createServer(app)
server.on('listening', () => {
 console.log('Listening on port 3000')
})

// Web sockets
const io = require('socket.io')(server)

io.sockets.on('connection', (socket) => {
	console.log('Client connected: ' + socket.id)

	socket.on('mouse', (data) => socket.broadcast.emit('mouse', data))

	socket.on('disconnect', () => console.log('Client has disconnected'))
})

server.listen('3000')
```
Toàn bộ source code cũng có thể được tìm thấy trên [Github của tôi](https://github.com/TannerGabriel/DrawingApp)

## Kết luận
Tôi hy vọng bài viết này đã giúp bạn hiểu những điều cơ bản của SocketIO và cách bạn có thể sử dụng nó trong các dự án của mình.

Tài liệu tham khảo:
[https://medium.com/better-programming/building-a-realtime-drawing-app-using-socket-io-and-p5-js-86f979285b12](https://medium.com/better-programming/building-a-realtime-drawing-app-using-socket-io-and-p5-js-86f979285b12)



