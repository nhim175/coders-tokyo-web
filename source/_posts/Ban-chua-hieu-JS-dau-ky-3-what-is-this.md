---
title: Bạn chưa hiểu JavaScript đâu kỳ 3 - What is `this`?
date: 2019-08-26 20:30:00
authorId: nhat_anh
tags: javascript
---

![Bạn chưa biết JavaScript đâu](https://res.cloudinary.com/djeghcumw/image/upload/v1566613910/blog/th.png)

Chắc hẳn nhiều lần trong đời, bạn sẽ phải thốt lên _What is `this`_. Vâng, `this` ở đây, ở kia, ở khắp mọi nơi trong vương quốc JavaScript. Chết tiệt, xxx loạn mất rồi. Này, bình tĩnh nào. Trước hết, bạn cần dọn dẹp não đã, để có chỗ cho kiến thức mới vào. Nghỉ ngơi, uống trà. Tik tak ... Đã tới giờ hoàng đạo. Ready? 3 2 1

<!-- more -->

## `this` là cái quái gì?

Xét về mặt ngôn ngữ học, nghĩa của `this` phụ thuộc vào **context** (_ngữ cảnh_).

Ví dụ, bạn đi ăn với bạn gái. Khi thức ăn được mang tới, cô ấy hỏi "What is this?". Bạn nói đó là bánh mỳ đen nguyên cám. Rồi cô ấy lại chỉ sang đĩa nhỏ màu xanh lá phía bên phải hỏi "What is this?". Bạn nói đó là sốt bơ. Ở đây, `this` lúc thì là cái bánh mỳ, lúc thì là sốt bơ. Nghĩa của `this` luôn đi kèm với **context** (_ngữ cảnh_) - cái bàn nơi 2 người ngồi, rồi món ăn được mang tới và ngôn ngữ cơ thể của bạn gái. Điều này cũng tương tự trong JavaScript.

## Đừng nhầm với `this`

### Function itself

```javascript
function greeting() {
  var name = "Nhat Anh";
  console.log("Hi", this.name);
  // console.log(this.name === global.name) // log ra true nếu chạy trên nodejs
  // console.log(this.name === window.name) // log ra true nếu chạy trên browser
}

var name = "Quang";

greeting(); // 'Hi Quang' ???

// `this` ở đây không phải là `greeting()` mà là `global/window object`
```

### Funciton's lexical scope

```javascript
function greeting() {
  var name = "Nhat Anh";
  this.sayHi();
}

function sayHi() {
  console.log("Hi", this.name);
}

var name = "Quang";

greeting(); // 'Hi Quang' ???

// Hiển nhiên, `this` ở đây không phải là `sayHi()`.
// Hàm sayHi() được gọi trong scope của `greeting()` nhưng
// `this` không phải là `greeting()` mà vẫn là `global/window object`.
```

- Thông tin bên lề: _lexcical scope_ (còn có tên gọi khác là static scope) là scope mà trong đó, scope con có thể truy cập vào biến được khai báo ở scope cha mẹ. Hầu hết scopes trong JavaScript đều là _lexical scopes_.

## Call site - Gọi tôi ở đâu?

`this` binding (ràng buộc) được xác định bởi **call-site**.

**Call site** là **nơi hàm được gọi**, không phải nơi nó được khai báo. _Hàm được gọi ở đâu?_

**Call stack** là một khái niệm chỉ **vị trí của thread\*** khi chương trình đang thực thi. Khi hàm được gọi (_call_), nó được xếp chồng lên nhau thành một đống (_stack_). Call-stack sẽ đẩy function vào (_push_) khi nó được gọi (_call_) và ném function ra (_pop_) khỏi stack khi function đó _return_.

\* Hiểu đại khái là trong một lúc JacaScript thực hiện một nhiệm vụ theo thứ tự từ trên xuống dưới trong call stack, khi nào xong mới chuyển qua nhiệm vụ khác.

![Callstack](https://res.cloudinary.com/djeghcumw/image/upload/v1566602675/blog/callstack.png)

Ví dụ về **call site** và **call stack**:

```javascript
function makeOne() {
  // call-stack: `makeOne` (function makeOne được gọi và được đẩy vào call-stack)
  // call-site: the global scope (function makeOne được gọi ở global scope)

  console.log("oneee");
  makeTwo(); // <-- call-site cho `makeTwo` (nơi gọi function makeTwo)
}

function makeTwo() {
  // call-stack: `makeOne` -> `makeTwo` (function makeTwo được xếp chồng lên function makeOne trong call-stack)
  // call-site: `makeOne`

  console.log("twooo");
  makeThree(); // <-- call-site cho `makeThree`
}

function makeThree() {
  // call-stack: `makeOne` -> `makeTwo` -> `makeThree`
  // call-site: `makeTwo`

  console.log("threee");
}

makeOne(); // <-- call-site cho `makeOne`
```

## Bốn thứ tự ưu tiên xác định `this`

### **Quy tắc 1 - New binding** (_Xuất hiện từ khóa `new`_): `this` là **object mới** vừa được tạo với từ khóa `new`.

```javascript
function CodersX(name) {
  this.name = name;
}

var na = new CodersX("Nhat Anh");
na.name; // 'Nhat Anh'
```

**Vậy điều gì đã xảy ra khi chúng ta dùng từ khóa `new`?**

1. Tạo một object mới.
2. Link object mới này với một object khác.
3. `this` được ràng buộc với object mới tạo ở bước 1.
4. Trả về `this` nếu hàm không trả về object.

```javascript
function CodersX(name) {
  this.name = name;
  return {};
}

var na = new CodersX("Nhat Anh");
na.name; // undefined @_@

// Do hàm trả về một object nên this ở đây là CodersX,
// không phải là object na vừa tạo nên kết quả là undefined
```

### **Quy tắc 2 - Explicit binding** (_Ràng buộc rõ ràng_): `this` là một object được chỉ định rõ. _Hàm có được gọi cùng với `call`, `apply` hoặc `bind` không?_

```javascript
function showName() {
  console.log(this.name);
}

var member = {
  name: "Nhat Anh"
};

// this được chỉ định rõ là member bằng từ khóa `call`
var na = showName.call(member);
na.name; // Nhat Anh
```

**Phân biệt `call`, `apply` và `bind`**

- `call`: **gọi hàm ngay lập tức** và cho phép **pass từng arguments một**.

```javascript
var member = {
  name: "Nhat Anh"
};

function greeting(text1, text2) {
  console.log(`${text1}, ${this.name}. ${text2}.`);
}

greeting.call(member, "Hello", "Nice to meet you");
// Hello, Nhat Anh. Nice to meet you.
```

- `apply`: **gọi hàm ngay lập tức** như `call`, chỉ khác là `apply` cho phép **pass một array** có một hoặc nhiều elements.

```javascript
var member = {
  name: "Nhat Anh"
};

function greeting(text1, text2) {
  console.log(`${text1}, ${this.name}. ${text2}.`);
}

greeting.apply(member, ["Hello", "Nice to meet you"]);
// Hello, Nhat Anh. Nice to meet you.
```

- `bind`: không gọi hàm ngay mà **trả về một hàm mới**

```javascript
var member = {
  name: "Nhat Anh"
};

function greeting(text1, text2) {
  console.log(`${text1}, ${this.name}. ${text2}.`);
}

// `bind` trả về một function. Gán function này với sayHi.
var sayHi = greeting.bind(member, "Hello", "Nice to meet you");
sayHi(); // Hello, Nhat Anh. Nice to meet you.
```

### **Quy tắc 3 - Implicit binding** (_Ràng buộc ẩn_): _Hàm có được gọi cùng với **context** không?_

```javascript
function showName() {
  console.log(this.name);
}

var member = {
  name: "Nhat Anh",
  showName: showName
};

var na = member.showName();
na; // 'Nhat Anh'

// Hàm `showName()` được gọi cùng với context là `member` nên `this` là member
```

### **Quy tắc 4 - Default Binding** (_Ràng buộc mặc định_):

`this` là **window** object (_browser_) hoặc **global** object (_nodejs_) hoặc undefined (`use strict`).

```javascript
// Xét TH 1: Dùng var
function showName() {
  console.log(this.name);
}

var name = "Nhat Anh";

showName(); // 'Nhat Anh'

// `this` được trỏ tới global/window object.
global === this; // true
// Dùng var thì biến name sẽ được thêm vào properties của global/window object.
global.name === this.name; // true
```

```javascript
// Xét TH 2: Dùng let
function showName() {
  console.log(this.name);
}

let name = "Nhat Anh";

showName(); // undefined ???
// `this` được trỏ tới `global/window object`.

global === this; // true
// Dùng `let` thì biến `name` sẽ không được thêm vào properties của `global/window object`.
global.name === this.name; // false
```

```javascript
// Xét TH 3: strict mode
function showName() {
  "use strict";
  console.log(this.name);
}

var name = "Nhat Anh";

showName(); // TypeError: Cannot read property 'name' of undefined
// Nếu có `use strict` thì giá trị của `this` sẽ là undefined
```

### Lưu ý:

```javascript
var member1 = {
  id: "123",
  mentor: "Nhat Anh",
  askMentor(question) {
    console.log(this.mentor, question);
  }
};

var member2 = {
  id: "456",
  mentor: "Quang",
  askMentor(question) {
    console.log(this.mentor, question);
  }
};

member1.askMentor("What is this?"); // Nhat Anh What is this?

member1.askMentor.call(member2, "What is this?"); // Quang What is this?

// Khi gọi hàm askMentor() với call, `this` sẽ là member2
// vì ràng buộc rõ ràng được ưu tiên hơn ràng buộc ẩn.
```

## Tổng kết

- `this` binding phụ thuộc vào ngữ cảnh (_context_).
- **Call site** là **nơi hàm được gọi**.
- **Call stack** là một khái niệm chỉ **vị trí của thread** khi chương trình đang thực thi (_execution_).
- **Bốn quy tắc** theo thứ tự ưu tiên xác định `this`:
  1. Từ khóa `new`.
  2. **Explicit binding** (_ràng buộc rõ ràng_): `this` là object được gọi cụ thể cùng với `call`, `apply` và `bind`.
  3. **Implicit binding** (_ràng buộc ẩn_): `this` là object chứa context.
  4. **Default Binding**: mặc định `this` là `global/window object` hoặc là `undefined` nếu có `use strict`.

## Tài liệu tham khảo

- Tập 4 _this & Object_ - Bộ sách _You don't know JS_ của Kyle Simpson
- MDN documentation về `this`, `new`, `call`, `apply`, `bind`.

Nếu bạn có phần nào chưa rõ hay muốn trao đổi thêm với mình, đừng ngần ngại [inbox mình](https://www.facebook.com/japananh) nhé. Chúc các bạn đọc vui.

Nếu bạn muốn có nhiều cơ hội trải nghiệm hơn, hãy tham gia cộng đồng học lập trình miễn phí [Coders.Tokyo](https://school.coders.tokyo/) với chúng mình. Together, we change the world.
