---
title: Thực hiện xác thực (authentication) với JWT (jsonwebtoken), Node.js và Express.js
date: 2018-07-03 20:26:41
---

# Thực hiện xác thực (authentication) với JWT (jsonwebtoken), Node.js và Express.js

![Thực hiện xác thực (authentication) với JWT (jsonwebtoken), Node.js và Express.js](https://res.cloudinary.com/djeghcumw/image/upload/v1562125444/blog/authentication-jwt-nodejs-logo.png)

## Giới thiệu khái quát
Các bạn sẽ thấy có rất nhiều cách xác thực như là dùng session, cookie, vậy tại sao lại phải sử dụng JWT để xác thực? Vì xác thực bằng cách trên sẽ rất khó để mở rộng (scale) bởi vì một số trạng thái (state) được phía server thực hiện. Vậy tại sao lại dùng JWT? Vì nó cung cấp một giải pháp stateless cho việc xác thực. Và các ứng dụng không có trạng thái như vậy sẽ dễ scale hơn.

<!-- more -->

## Điểm mạnh của JWT
- Cung cấp giải pháp xác thực stateless.
- Rất nổi tiếng và được dùng bởi rất nhiều nhà cung cấp dịch vụ OAuth như Google, Facebook.
- Rất dễ sử dụng.
- Đáng tin cậy hơn việc xác thực bằng session và cookie.
- Có thể sử dụng cho các dịch vụ xác thực khác.
- Ngoài việc xác thưc, nó còn có thể dùng để phân quyền.

## Nội dung
- Cấu trúc của JWT và cái nhìn khái quát.
- Cách thức xác thực của JWT.
- Sử dụng JWT với để xác thực với Node.js

## JWT là gì?
> Một JSON Web Token (JWT) là một [JSON object](https://json.org/json-vi.html) được định nghĩa là một biện pháp an toàn để thể hiện một tập thông tin giữa 2 tổ chức. Token được cấu thành bởi header, payload và signature.

JWT được sử dụng cho việc xác thực và cũng có thể dùng để chia sẻ thông tin. Phần lớn các token được đánh dấu bằng một khóa mở (public key) và khóa kín (private key), do đó rất khó để giả mạo. JWT gồm ba phần: header, payload và signature. Mỗi một phần được chia cách bằng dấu ".".

![JWT structure](https://res.cloudinary.com/djeghcumw/image/upload/v1562124980/blog/authentication-jwt-nodejs-1.png "JWT Structure")

Nguồn: [https://nordicapis.com/why-cant-i-just-send-jwts-without-oauth/](https://nordicapis.com/why-cant-i-just-send-jwts-without-oauth/)

### Header
Phần đầu (head) là một chuỗi JS Object **Base64URL** được mã hóa chứa thông tin về  token như: *loại* token, nội dung của token và thuật toán để tạo nên token. Phần *loại* token được miêu tả cụ thể bằng hai trường là typ và alg để tạo nên token.

``` javascript
{
    "alg": "HS256",
    "typ": "JWT"
}
```

Object đó sẽ được chuyển sang một chuỗi và mã hóa bằng **Base64URL**. Đoạn code dưới đây miêu tả cách thức mã hóa sử dụng module [buffer](https://nodejs.org/api/buffer.html) của Node.js.

``` javascript
Buffer.from(JSON.stringify({
    "alg": "HS256",
    "typ": "JWT"
})).toString('base64')
    .replace(/=/g, "")                               
    .replace(/\+/g, "-")                               
    .replace(/\//g, "_");
```

> Base64 và Base64URL giống nhau nhưng dấu `+` được chuyển thành `-` và `/` được chuyển thành `-`.

Việc này sẽ đảm bảo rằng sẽ không có sự đụng độ nào giữa query string và token, bởi vì dấu `+` có ý nghĩa đặc biệt trong query string, dấu `/` cũng vậy.

### Body
Body cũng giống như Header nhưng nó có thêm *quyền* hoặc *dữ liệu* được truyền tải. Phần body đôi khi sẽ chứa các thuộc tính đặc biệt như là `iss`, `sub`, `aud`, `exp`, `iat`, `jit`,...các thuộc tính trên có một chuẩn để sử dụng và được chấp thuận bởi rất nhiều dịch vụ [oAuth](https://en.wikipedia.org/wiki/OAuth). 

Một vài thuộc tính đặc biệt là **exp** và **iat**. **exp** xác định thời gian khi nào token hết hạn và **iat** xác định thời gian token được khởi tạo.

``` javascript
{
    "sub": "90129920",
    "uuid": "sfgdsrfg434fdt535fg",
    "iat": 1516239022,
    "exp": 1545926973
}
```
Móc thời gian được tính bằng giây và từ tháng Một năm 1970. Phần *Body* cũng được mã hóa Base64URL giống như phần *Header*.

### Signature
Là phần quan trọng nhất của token bởi vì nó sẽ chứng thực token. Hãy xem cách mà *Signature* được tạo.

``` javascript
signature = sha256(base64URL(head) +"." +base64URL(body))
```
Token bao gồm phần *Body* và *Header* được mã hóa bởi bất kì thuật toán nào, trường hợp này là **sha256**. Đoạn code bên dưới sẽ chỉ ra cách mà chúng ta tạo ra một *Signature* cho token.

``` javascript
const crypto = require('crypto');
const private_key = "dfhghhghgdoghoghg";
const sign = crypto.createHmac('SHA256', private_key)
    .update(head + '.' + body)
    .digest('base64')
    .replace(/=/g, "")                      
    .replace(/\+/g, "-")                               
    .replace(/\//g, "_")
```

Đầu tiên chúng ta sẽ tạo một [stream](https://www.freecodecamp.org/news/node-js-streams-everything-you-need-to-know-c9141306be93/) từ `crypto.createHmac`, sau đó sẽ đưa phần head và body được mã hóa Base64URL, được tách rời bởi dấu *chấm*(.) để tạo nên một *stream* và chuyển đổi [buffer](https://www.freecodecamp.org/news/do-you-want-a-better-understanding-of-buffer-in-node-js-check-this-out-2e29de2968e8/) thành chuỗi Base64 và sau đó là Base64URL.

### Xác minh
Server sẽ tạo một chuỗi băm từ *private key* nếu chuỗi băm đúng với *Signature* ở token thì token là hàng **real**. Sau khi đã xác thực được token thì user cũng sẽ đồng thời được xác thực bằng cách sử dụng dữ liệu ở phần *Body*.

``` javascript
token = base64url(head) +"." +baser64url(body) +"." +signature
```

## Cách xác thực với JWT
Token với userId được gửi đi bởi client và client gửi lại token cho server mỗi khi khởi tạo một HTTP Request tới server. 

``` javascript
body = { userId: "123nfdwf283" }
```

Client phải lưu trữ token trên trình duyệt. Token có thể được lưu trữ ở *local storage* hoặc *session storage*. Sử dụng *local storage* sẽ giữ cho user *signed in* bất cứ lúc nào cho tới khi token được signed hết hạn. Sử dụng session storage sẽ giữ cho user *loged in* cho tới khi user đóng trình duyệt. Và sau đó token sẽ được gửi tới server ở Authorization header như sau:

`Bearer { token }`.

## Sử dụng JWT với Node.js
Vì chỉ với mục đích chỉ ra cách thức để sử dụng JWT, nên mình sẽ cố gắng giảm thiểu những phần không liên quan. Do đó bạn sẽ có thể thấy có một vài logic không hợp với thực tế. Mình sẽ bỏ qua phần validation, security,...chỉ đơn thuần là JWT. 

Nói cũng nhiều rồi, thì cần gì để code đây. Chúng ta sẽ cần một IDE để code Node.js và phần mềm/extention [Postman](https://www.getpostman.com/) để test API cũng như là token. Trước đó thì chúng ta cần cài đặt một vài packages.

```
$ npm i --S express jsonwebtoken mongoose body-parser

- express: tạo server
- body-parser: parse dữ liệu từ req.body
- mongoose: tạo database model
- jsonwebtoken: tạo JWT token
```

Cấu trúc thư mục
```
root
    - app.js
    - key.js
    - user.js
```

File chứa key cho việc mã hóa token của chúng ta.
``` javascript
// key.js

module.exports = { secretOrKey: 'mySecretKey' };
```

Tạo một mongoose model nào.
``` javascript
// user.js
const mongoose = require('mongoose');
// mongo key
const mongoURI = 'mongodb://localhost:27017/coderstokyo';
const options = {
    useNewUrlParser: true,
    useFindAndModify: false,
}

// Tạo kết nối tới database
mongoose.connect(mongoURI, options)
    .then(
        () => console.log('Database connection established'),
        err => console.log('Database connection unestablied, error occurred')
    )

// Tạo một model mới
const userSchema = new mongoose.Schema({
    username: {
        type: String,
        required: true
    },
    password: {
        type: String,
        required: true
    },
})

module.exports = mongoose.model('users', userSchema);
```

Tạo một server với express nhé
``` javascript
// app.js

// require dependencies
const jwt = require('jsonwebtoken');
const bodyParser = require('body-parser');

const User = require('./user');
const { secretOrKey } = require('./key');

const app = require('express')();

// use middlewares
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.post('/register', (req, res) => { 
    // Chúng ta sẽ tạo 1 instance mới của User model để lưu newUser vào database
    const newUser = new User({
        username: req.body.username.toString(),
        password: req.body.password.toString()
    });
    // Nếu tạo user thành công thì chúng ta response lại status code là 200, còn thất bại thì là 400
    newUser.save()
        .then(success => res.status(200).send('Successful to create new user'))
        .catch(err => res.status(400).send('Failed to create new user'));
});

app.listen(3000, () => console.log('Server is starting'));
```
Và tới đây là đã xong tất cả những phần cài đặt căn bản. Trước khi vào phần code logic, mình xin giải thích khái quát những thứ mà chúng ta phải làm.

![How JWT works](https://res.cloudinary.com/djeghcumw/image/upload/v1562124980/blog/authentication-jwt-nodejs-2.png "How JWT works")

Nguồn: [https://dzone.com/articles/jwtjson-web-tokens-are-better-than-session-cookies](https://dzone.com/articles/jwtjson-web-tokens-are-better-than-session-cookies)

- Như các bạn đã thấy ở hình trên thì khi `user` truy cập vào /login từ *browser* và gửi một HTTP request gồm hai params là `username` và `password` thì phía *server* sẽ tạo một JWT gửi lại cho browser. Sau đó browser sẽ set JWT vào Authorization header (lúc này JWT cũng được lưu vào *local storage* hay là *session storage* nói trên). 

- Sau khi JWT đã được gán vào Authorization header thì server sẽ dựa vào đó mà xác thực token cũng như là user bằng những thông tin từ *Signature*. Nếu token (hoặc user) là hợp lệ thì sẽ có quyền truy cập vào những private APIs.

``` javascript
// app.js

..........

app.post('/login', (req, res) => {
    User.findOne({ username: req.body.username })
        .then(user => {
            // Check nếu không user nào tộn tại với username nhận được từ req.body
            if(!user) {
                return res.status(404).send('No user found');
            }
            // Ở đây mình mặc định là password đã đúng rồi nên không cần check nữa
            // Tạo 1 token và payload data và response lại với status code là 200 cùng với payloaded data
            const token = jwt.sign({ userId: user.id }, secretOrKey);
            res.status(200).json({
                userId: user.id,
                token: token
            })
        })
        .catch(err => res.status(400).send('Invalid username or password'));
});

app.listen(3000, () => console.log('Server is starting'));
```

Phần code logic để regist và login user cũng đã xong, chúng ta test cùng Postman nhé. Đầu tiên là start server.

![Start server](https://res.cloudinary.com/djeghcumw/image/upload/v1562124980/blog/authentication-jwt-nodejs-start.png "Start server")

Test route POST /register bằng Postman

![/register](https://res.cloudinary.com/djeghcumw/image/upload/v1562124980/blog/authentication-jwt-nodejs-register.png "/register")

Chúng ta đã tạo thành công một user có username là coderstokyo và password là 123456, login để xem phép màu ở đây nhé.

![/login](https://res.cloudinary.com/djeghcumw/image/upload/v1562124980/blog/authentication-jwt-nodejs-login.png "/login")

Cũng như bạn thấy đấy, token đã được trả về rồi, vậy giờ làm gì nữa nhỉ? Cùng đi tới phần quan trọng nhất của việc sử dụng JWT là xác thực user. Đoạn code dưới đây chúng ta sẽ tạo hai middleware để xác thực token và người dùng, một private API yêu cầu token để truy cập.

``` javascript
// app.js

..........

const checkToken = (req, res, next) => {
    try {
        const token = req.headers.authorization;
        
        // Xác thực token
        jwt.verify(token, secretOrKey, (err, payload) => {
            if(payload) {
                req.user = payload;
                next();
            } else {
                // Nếu token tồn tại nhưng không hợp lệ, server sẽ response status code 401 với msg bên dưới
                res.status(401).send('Unauthorized');
            }
        })
    } catch(err) {
        // Nếu không có token ở header, server sẽ response status code 401 với msg bên dưới        
        res.status(401).send('No token provided');
    }    
};

const protectedRoute = (req, res, next) => {
    // Nếu req.user tồn tại nghĩa là token cũng tồn tại
    if(req.user) {        
        return next();
    } 

    // Ngược lại server sẽ response status code 401 với msg bên dưới 
    res.status(401).send('Unauthorized');
}

// Nếu pass cả 2 middleware có nghĩa là token là hàng real, server sẽ response status code là 200 cùng với req.user
app.get(
    '/protectedRoute'
    , checkToken, protectedRoute
    , (req, res) => {
        res.status(200).send(req.user);
});

app.listen(3000, () => console.log('Server is starting'));
```

Truy cập protectedRoute mà không cung cấp token
![/noToken](https://res.cloudinary.com/djeghcumw/image/upload/v1562124980/blog/authentication-jwt-nodejs-noToken.png "/noToken")

Khi sử dụng Postman chúng ta sẽ kiểm thử token bằng cách login user và lấy token từ response được bắn ra ở server. Sau đó sẽ copy và để nó vào Authorization header như hình bên dưới.
![/getToken](https://res.cloudinary.com/djeghcumw/image/upload/v1562124980/blog/authentication-jwt-nodejs-getToken.png "/getToken")
![/putToken](https://res.cloudinary.com/djeghcumw/image/upload/v1562124980/blog/authentication-jwt-nodejs-putToken.png "/putToken")

Token không hợp lệ
![/invalidToken](https://res.cloudinary.com/djeghcumw/image/upload/v1562124980/blog/authentication-jwt-nodejs-invalidToken.png "/invalidToken")

Token hợp lệ
![/protectRoute](https://res.cloudinary.com/djeghcumw/image/upload/v1562124980/blog/authentication-jwt-nodejs-protectRoute.png "/protectRoute")

## Kết
Đó là những thú cơ bản để sử dụng JWT authentication. Các bạn có thể cải thiện bằng cách thêm vào các thông số như `exp`: thời gian hết hạn,.. cho token. Validate input cũng như là hash password trước khi lưu nó vào database để làm cho API cũng như dữ liệu người dùng bảo mật hơn.

Qua bài viết này mình muốn giúp các bạn hiểu về một trong những phương pháp bảo mật API của mình bằng token và cách sử dụng JWT. Nếu có gì thắc mắc các bạn có thể liên hệ fanpage của [Coders.Tokyo](https://www.facebook.com/coders.tokyo/?ref=br_rs) trên facebook để giải đáp thắc mắc.

Chúc các bạn học tốt cùng Coders.Tokyo!

## Tài liệu tham khảo
[1] A practical guide for JWT authentication using Node.js and Express: https://medium.com/swlh/a-practical-guide-for-jwt-authentication-using-nodejs-and-express-d48369e7e6d4

[2] Node.js Streams: Everything you need to know: https://www.freecodecamp.org/news/node-js-streams-everything-you-need-to-know-c9141306be93/

[3] Do you want a better understanding of Buffer in Node.js? Check this out.: https://www.freecodecamp.org/news/do-you-want-a-better-understanding-of-buffer-in-node-js-check-this-out-2e29de2968e8/

Đọc thêm nhiều blog tại: [Coders.tokyo](https://coders.tokyo/blog/)