---
title: Destructuring in Javascript Phần 2
date: 2019-04-17 08:34:01
authorId: hong_quang
tags:
---

<figure class="wp-block-image">![Object Destructuring - Destructuring in Javascript - CodersX](https://res.cloudinary.com/djeghcumw/image/upload/v1555463416/blog/es6-destructuring.png)
</figure>

## Object Destructuring

Ở blog này, chúng ta sẽ tiếp tục tìm hiểu và khám phá sức mạnh của **destructuring** trong Javascript tiếp nhé. Nếu ai theo dõi phần 1, chắc cũng đã hiểu được khái niệm _destructuring_ là gì, cũng như phần nào sức mạnh của nó rồi đúng không? Không những giúp số `loc` (line of code) của ta giảm đi đáng kể, mà nhìn code của ta cũng `clean` và `professional` hơn rất nhiều.

<!-- more -->

Nếu các bạn chưa xem [phần 1](https://coders-x.com/2019/03/21/Destructuring-in-javascript--phan-1/) thì nên coi lại. Để ta hiểu hơn và có 1 cái nhìn tổng quan về kỹ thuật _destructuring_ trước khi tìm hiểu _**Object destructuring**_ trong blog này nhé.

## Cách code truyền thống với Object Destructuring

<figure class="wp-block-image">![Object Destructuring - Destructuring in Javascript - CodersX](https://res.cloudinary.com/djeghcumw/image/upload/v1555463581/blog/destructring.jpg)
</figure>

Trong ES5, để lấy `values` từ `objects` ta chỉ cần biết các `keys` nào giữ các `values` ta muốn và sau đó là gõ `myObject.myKey` là ta sẽ lấy được phải không? Như ví dụ dưới đây, giả sử ta có 1 person `object`, gồm các `properties`: `name`, `age`, `gender`, `address`, `phone`. Nếu ta muốn lấy các giá trị của `name` và `age` ta sẽ làm:

```javascript
const person = {
	name: 'Coding Sam',
  age: 28,
  gender: 'M',
  address: 'I am not going to tell you',
  phone: '11111111',
}
const name = person.name;
const age = person.age;
```

Còn nếu ta sử dụng **destructuring**, ta có thể làm như sau:
```javascript
const person = {
  name: 'Coding Sam',
  age: 28,
  gender: 'M',
  address: 'I am not going to tell you',
  phone: '11111111',
}
const { name, age, ...rest } = person;
```

**Giải thích**: Ta có thể chỉ lấy những `keys` ta cần trong `object` và còn có thể giữ nguyên các `keys` còn lại ở trong 1 object khác (`gender`, `address` và `phone`) khi kết hợp kỹ thuật _…rest_ với _destructuring_. Và lúc này, `rest` sẽ là 1 object chứa các keys còn lại. Ta thử `console.log(rest)` kết quả sẽ là:

```javascript
console.log(rest); 
// expected: { gender: 'M', address: 'I am not going to tell you xD', phone: '111111111' }
```

## Default Values

Khi cố gắng _assign_ 1 `variable` tương ứng vào 1 `key` mà không tồn tại trong _destructured object_ - đồng nghĩa với việc ta sẽ gán value `undefined` vào key đó. Để khắc phục sự hạn chế này, ta có thể truyền những `default values` như là các `variables`. Dưới đây là ví dụ minh họa:

```javascript
const person = {
  name: 'John Doe',
  country: 'Canada'
};

// Assign default value of 25 to age if undefined
const { name, country, age = 25 } = person;
// Here I am using ES6 template literals
console.log(`I am ${name} from ${country} and I am ${age} years old.`);
// I am John Doe from Canada and I am 25 years old.'
```

**Giải thích:** Trong đoạn snippet trên, chúng ta đã _assign_`value` 25 vào variable `age`. Vì key `age` không tồn tại trong `person` object, `25` đã được gán vào variable `age` thay vì `undefined`.

## Using Different Variable Names

<figure class="wp-block-image">![Object Destructuring - Destructuring in Javascript - CodersX](https://res.cloudinary.com/djeghcumw/image/upload/v1555463667/blog/destrucuring-renaming.png)

</figure>

Từ trước đến giờ, ta chỉ _assign_ vào các `variables` mà có các `keys` giống tên tương ứng trong `object`. Sau phần này, bạn sẽ biết cách gán những `variables` có tên khác vào các `keys` đó, bằng cách sử dụng `syntax`: `[object_key]: [variable_name]`. Bạn cũng có thể truyền những `default values` như sau: `[object_key]: [variable_name] = [default_value]`.

```javascript
const person = {
  name: 'John Doe',
  country: 'Canada'
};

// Assign default value of 25 to years if age key is undefined
const { name: fullname, country: place, age: years = 25 } = person;
// Here I am using ES6 template literals
console.log(`I am ${fullname} from ${place} and I am ${years} years old.`);
// I am John Doe from Canada and I am 25 years old.'
```

Giải thích: Trong đoạn snippet trên, ta đã tạo ra 3 `local variables` có tên là: `fullname`, `place` và `years` và _**map**_ tới các `keys` là `name`, `country` và `age` tương ứng. Chú ý rằng, ta đã gán 1 `default value` là 25 vào variable `years` trong trường hợp key `age` không có trong `person` object

## Nested Object Destructuring

Cùng quay lại với ví dụ đầu tiên, bây giờ `person` object của ta thay đổi 1 chút:

```javascript
const person = {
  name: 'Coding Sam',
  age: 28,
  scores: {
    maths: 74,
    english: 63
  }
}
// We define 3 local variables: name, maths, science
const { name, scores: {maths, science = 50} } = person;
console.log(`${name} scored ${maths} in Maths and ${science} in Elementary Science.`);
// John Doe scored 74 in Maths and 50 in Elementary Science.
```

**Giải thích**: Trong đoạn snippet trên, ta đã `define` 3 `local variable` là: `name`, `maths` và `science`. Thêm nữa, ta cũng `define` 1 `default value` = 50 cho key `science` trong trường hợp nó không tồn tại trong nested `scores`object.

**Chú ý**: Khi sử dụng _nested object destructuring_ không được gán với _**empty object**_. Mặc dù nó không sai về cú pháp, nhưng thực sự là nó không được gán đâu. Ví dụ:

```javascript
// This does no assignment
// Because of the empty nested object literal ({})
const { scores: {} } = student;
```

## Use case (Ứng dụng thực tế)


### Bomberman 2D game

<div class="wp-block-image">
<figure class="aligncenter">![Object Destructuring - Destructuring in Javascript - CodersX](https://res.cloudinary.com/djeghcumw/image/upload/v1553139652/blog/1___Qjq_ioJpGPq8h4phyyng.png)
</figure>
</div>

Bạn còn nhớ game Bombeman mà ta đã sử dụng [Array Destructuring](https://coders-x.com/2019/03/21/Destructuring-in-javascript--phan-1/) trong phần 1 không? Ở blog này, ta sẽ thử code hàm `getPosition` bằng cách sử dụng *Object destructuring* nhé!


```javascript
function getDistance ({x: x1 = 0, y: y1 = 0}, {x: x2 = 0, y: y2 = 0}) {
  return {
    x: x2 - x1,
    y: y2 - y1,
  };
}

const position1 = {x: 2, y: 4};
const position2 = {x: 5, y: 3};
const {x: xDistance, y: yDistance} = getDistance(position1, position2);

// Should log 3
console.log(xDistance);
// Should log -1
console.log(yDistance);
```

Giải thích:

*   `{x: x1 = 0, y: y1 = 0}` đoạn code này có nghĩa là bạn đang _expect_ 1 object với 2 keys x1 và y1 - như là argument đầu tiên của function `getDistance`. Trong đó, bạn cũng đã đặt tên lại 2 keys là x1 và y1 (Việc làm này là rất tốt, vì argument 2 cũng là 1 object với các keys giống argument 1). **Nhớ rằng bạn không được thay đổi bất cứ điều gì trong object được truyền vào function (chỉ được đổi tên key, {x:x1, y:y2), chứ không được đổi tên keys trong object)**. Thêm vào đó, bạn cũng đã gán _default value_ cho các keys x1, ye (x: x1 = 0, y: y1 = 0) trong trường hợp không có giá trị được truyền vào cho các keys đó.

*   `const { x: xDistance, y: yDistance } = getDistance(position1, position2)`: Đoạn code này gọi function `getDistance`. Result của hàm có thể là 1 hằng số, nhưng bạn có thể thấy là, bạn cũng có thể _destructure_ object đó nếu bạn biết chắc chắn rằng những keys được trả về. Như trong ví dụ trên, `x: Distacne` sẽ tương tứng với `x` value - từ `object returned` trong function và được đặt tên lại là `xDistance`.

### Trong RESTful API

Giả sử bạn đang làm module `login` của 1 app nào đó. Và bạn sẽ cần 2 field `username`, `password` để có thể đặng nhập được vào app. Vậy ta sẽ lấy các field này từ dưới client khi gửi `req` lên server như thế nào?. Ta sẽ dùng **Postman** để gửi các `request` thay cho phía client nhé.

Chạy `localhost` với port là 3000 và route sẽ là: `localhost:3000/v1/auth/login`. Trong Postman sẽ có dạng như sau:

<figure class="wp-block-image">![Object Destructuring - Destructurinig in Javascript - CodersX](https://res.cloudinary.com/djeghcumw/image/upload/v1555436808/blog/Screenshot_from_2019-04-17_00-46-25.png)
</figure>

Và code ở trong backend, ta cần phải lấy được `username` và `password` để có thể query vào trong Database.

Ta sẽ không đi sâu vào các trường hơp như user này có tồn tại hay không, mật khẩu này có đúng hay không, … Mà ta sẽ chỉ quan tâm vào cách làm sao để lấy được username và pasword này thôi.

```javascript
// Trong file login.controller.js
// Bad practice
export function login(req, res) {
  const username = req.body.username;
  const password = req.body.password;
  // query DB to check if user exists or not ...
}
```

Khi ta bấm **Send** trong Postman, các field `username`, `password` sẽ được gửi lên server. Và trước khi có thể lấy được data từ `req.body` là`username` và `password`, ta phải sử dụng 1 middeware là `bodyParserapp.use(bodyParser.json())`.

Lúc này, `username` và `password` sẽ nằm trong `req.body` - là 1 object. Và để lấy `username`, `password` trong object này, đoạn code trên sử dụng 1 cách truyền thống là `myObject.myKey`.

Vậy sau khi biết kỹ thuật **Object destructuring** ta sẽ ứng dụng vào code ở hàm trên như thế nào? Cùng xem snippet dưới đây:

```javascript
// Trong file login.controller.js
// Good practice
export function login(req, res) {
  const { username, password } = req.body;
  // query DB to check if user exists or not ...
}
```

## Conclusion

Vậy là chúng ta đã khám phá được từ tổng quan đến chi tiết, cách dùng cũng như ứng dụng của **Array Destructuring** và **Object Destructuring** qua 2 phần rồi đúng không?

Nếu càng dùng nhiều _destructuring_ trong code của mình, chắc chắn rằng bạn sẽ càng yêu thích nó hơn nữa vì sự _tinh tế_ cũng như _chuyên nghiệp_ mà nó đem lại.

Nếu có bất cứ câu hỏi hay thắc mắc nào, hãy để lại ở dưới bình luận và chúng ta sẽ cùng nhau thảo luận nhé!

**Cuối cùng**: chúc các bạn có sức khỏe, tinh thần luôn sảng khoái để học tập thật tốt! Cố lên các học viên CodersX <3

Đọc lại Destructuring in Javascript phần 1 tại: [https://coders-x.com/2019/03/21/Destructuring-in-javascript–phan-1/](https://coders-x.com/2019/03/21/Destructuring-in-javascript--phan-1/)

Bài viết có tham khảo từ các blog sau:

*   [https://medium.freecodecamp.org/array-destructuring-in-es6-30e398f21d10](https://medium.freecodecamp.org/array-destructuring-in-es6-30e398f21d10)
*   [https://medium.com/@codingsam/awesome-javascript-destructuring-assignment-55fd2e9d3dc4](https://medium.com/@codingsam/awesome-javascript-destructuring-assignment-55fd2e9d3dc4)

Đọc thêm các blog khác tại: [https://coders-x.com/blog/](https://coders-x.com/blog/)

Tham gia cộng đồng học lập trình miễn phí: [https://coders-x.com/](https://coders-x.com/)
