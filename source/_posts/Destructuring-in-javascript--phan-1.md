---
title: Destructuring in Javascript Phần 1
date: 2019-03-21 20:00:01
authorId: hong_quang
tags:
---

<figure class="wp-block-image">![](https://res.cloudinary.com/djeghcumw/image/upload/v1553177981/blog/1_CF2WhDLzrgm3yHH-NT_pmA.jpg)</figure>

**Destructuring** là 1 kỹ thuật được giới thuật trong ES6, giúp cho việc sao chép, trích xuất lại các `variable` 1 cách rất rõ ràng, dễ hiểu hơn rất nhiều so với những cách thông thường khác và chắc chắn là `loc` (line of code) cũng giảm đi đáng kể.

Destructuring là gì? Tôi hiểu như này, destructuring là cấu trúc và khi ta thêm tiền tố _de_ vào trước thành _destructuring_ nghĩa sẽ chuyển thành **_tách cấu trúc_**, tôi luôn cố gắng hiểu các thuật ngữ tiếng anh 1 cách thuần túy, bám sát với nghĩa gốc tiếng anh của chúng như thế. Những cách đặt tên những thuật ngữ trong lập trình cũng chính là dựa vào chức năng, nhiệm vụ của nó mà ta đặt tên thôi.

<!-- more -->

Giống như hàm filter (tạm dịch: lọc) của Array - nhiệm vụ của nó đơn giản là lặp qua lần lượt các `element` của mảng và *lọc* những `element` nào thỏa điều kiện. Hay khái niệm `inheritance` (nghĩa: thừa kế) trong OOP, vì đơn giản là nó có thể dùng lại những `variable` (var) hay `method` của `parent` chúng, như ta thoải mái tiêu tiền của cha mẹ ta thôi hihi.

Tại sao tôi lại đi vào giải thích kỹ định nghĩa destructuring như vậy, vì hiểu được tên gọi của nó là ta đã hiểu được 1 phần nào cách mà nó hoạt động. Chính là từ 1 `structure` có sẵn, nó phá hủy structure đó, *extract* những `properties` ra và biểu diễn lại theo `structure` mà mình muốn.

Destructuring trong Javascript dùng rất nhiều khi làm việc với array và object, phần này chúng ta sẽ cùng nhau tìm hiểu trong giới hạn array thôi nhé!

## Sự khác biệt khi ta sử dụng kỹ thuật destructuring

Ta hãy cùng so sánh 2 đoạn code dưới đây:

```javascript
const [first, second, third] = ["Laide", "Gabriel", "Jets"];
```

_Khi sử dụng destructuring_

```javascript
const first = "laide",
  second = "Gabriel",
  third = "Jets";
```

_Và khi không sử dụng_

Rõ ràng là ta hơn được 2 điểm `readability` và ít `loc` rồi đúng không.?!? Nhưng hãy chú ý 1 điều nho nhỏ là:

> Ta không được dùng `Number` khi làm việc với `destructuring`. Number sẽ tạo ra `error` ngay vì chúng không phải là `constiable name`

```javascript
    const [1, 2, 3] = ["Laide", "Ola", "Jets"];
```

_Đoạn code này sẽ sinh ra lỗi_

*Destructuring* trích xuất dữ liệu từ 1 array rất dễ dàng và dễ nhìn phải không? Thử tượng tượng rằng nếu phải ta có 1 array với 5, 6 levels thì làm theo cách thông thường sẽ mất thời gian và bớt *cool ngầu* hơn thế nào. Ta chỉ cần dùng 1 array literal bên phía trái cho việc gán này.

```javascript
const thing = ["Table", "Chair", "Fan"];
const [a, b, c] = thing;
```

Destructuring làm nhiệm vụ lấy từng `var` trong array literal bên phía trái và `map` chúng với `element` tương ứng cùng vị trí trong mảng array bên phải.

```javascript
console.log(a); // Output: Table
console.log(b); //Output: Chair
console.log(c); //Output: Fan
```

Destructuring làm nhiệm vụ lấy từng `var` trong array literal bên phía trái và `map` chúng với `element` tương ứng cùng vị trí trong mảng array bên phải.

```javascript
const things = ["Table", "Chair", "Fan", "Rug"];
const [a, b, c, d, e] = things;
console.log(c); //Output: Fan
console.log(d); //Output: Rug
console.log(e); //Output: undefined
```

Còn trường hợp ngược lại - **ít hơn** thì chẳng có gì xảy ra cả, chúng vẫn sẽ được map lần lượt và tương ứng thôi

## Destructuring returned Arrays

Destructuring giúp làm việc với function mà return 1 array chính xác hơn nhiều. Ví dụ:

```javascript
function runners() {
  return ["Sandra", "Ola", "Chi"];
}

const [a, b, c] = runners();
console.log(a); //Output: Sandra
console.log(b); //Output: Ola
console.log(c); //Output: Chi
```

## Default Value

Destructuring cho phép 1 `default value` được `assigned` với `var` mà không có `value` gì hay `undefined` được truyền vào. Giống như việc ta có 1 bản dự phòng nếu không có 1 giá trị nào được truyền vào.

```javascript
const a, b;
[a = 40, b = 4] = [];
console.log(a); //Output: 40
console.log(b); //Output: 4

[a = 40, b = 4] = [1, 23];
console.log(a); //Output: 1
console.log(b); //Output: 23
```

`Default value` còn có thể tham chiếu tới những `var` có trong cùng array literal với nó

```javascript
const [first = "Cotlin", second = first] = [];
console.log(first); //Output: Cotlin
console.log(second); //Output: Cotlin

const [first = "Cotlin", second = first] = ["Koku"];
console.log(first); //Output: Koku
console.log(second); //Output: Koku

const [first = "Cotlin", second = first] = ["Koku", "Lydia"];
console.log(first); //Output: Koku
console.log(second); //Output: Lydia
```

## Ignoring Some Values

Ta chỉ việc bỏ `element` mà ta không muốn map giữa 2 dấu phẩy `, ,` là được:

```javascript
const a, b;
[a, , b] = ["Lordy", "Crown", "Roses"];

console.log(a); //Output: Lordy
console.log(b); //Output: Roses
```

## The Rest Parameter And Spread Syntax

1 operator `(...)` mới được thêm vào trong ES6 có thể dùng trong destructuring . Nếu `(...)` operator xuất hiện phía bên trái khi dùng destructuring thì nó gọi là **REST PARAMETER**.

Dừng lại 1 chút, ta lại cùng nhau mổ xẻ thuật ngữ `rest` là gì. Bạn thử copy và paste vào google translate xem ... vâng nó nghĩa "nghỉ ngơi, nằm ngủ, ..." đúng là như vậy. Đùa chút thôi, thực ra còn 1 nghĩa khác nữa, hay trong lập trình ta hiểu nó là: *phần còn lại* 1 `rest parameter` được dùng để map những `element` trong arr mà chúng không được map với gì cả.

Như là việc ta gói những `element` bị *bỏ lại* và map chúng với `rest parameter` này. **Chú ý** `rest parameter` phải đứng ở cuối nêú không thì sẽ xuất hiện 1 lỗi `syntax`.

1 `rest parameter` được dùng để map những `element` trong arr mà chúng không được map với gì cả. Như là việc ta gói những `element` bị _bỏ lại_ và map chúng với `rest parameter` này. **Chú ý** `rest parameter` phải đứng ở cuối nêú không thì sẽ xuất hiện 1 lỗi `syntax`.

bị _bỏ lại_ và map chúng với `rest parameter` này. **Chú ý** `rest parameter` phải đứng ở cuối nêú không thì sẽ xuất hiện 1 lỗi `syntax`.

```javascript
const planets = ["Mercury", "Earth", "Venus", "Mars", "Pluto", "Saturn"];
const [first, , third, ...others] = planets;

console.log(first); //Output: Mercury
console.log(third); //Output: Venus
console.log(others); //Output: ["Mars", "Pluto", "Saturn"]
```

Bây giờ nếu `(...)` operator xuất hiện phía bên phải thì sao? Ta hãy cùng xem ví dụ dưới đây:

```javascript
const planets = ["Mercury", "Earth", "Venus", "Mars", "Pluto", "Saturn"];

const [first, second, ...rest] = ["Mercury", "Earth", ...planets, "Saturn"];

console.log(first); //Output: Mercury
console.log(second); //Output: Earth
console.log(rest); //Output: ["Mercury", "Earth", "Venus", "Mars", "Pluto", "Saturn", "Saturn"]
```

Các bạn có đoán được tại sao không? Chúng ta sẽ đi từ từ từng bước 1 nhé:

- Khi ta dùng `...planets` thì bây giờ array phía phải sẽ trở thành: `[Mercury", "Earth", "Mercury", "Earth", "Venus", "Mars", "Pluto", "Saturn", "Saturn"];` Và vì 2 `element` đầu đã được map với first, second trong destructuring, nên lúc này `rest parameter` sẽ map những `element` "bị bỏ lại" - không được map, đó chính là kết quả của output.

## Interchanging Or Swapping Variables

Destructuring còn có thể dùng để tráo đổi 2 giá trị của 2 biến

```javascript
const a, b;
[a, b] = ["Male", "Female"];
[a, b] = [b, a];

console.log(a); //Output: Female
console.log(b); //Output: Male
```

## Nested Array Destructuring

Bạn cũng có thể sử dụng *nested destructuring* với arrays. Các item tương ứng cũng phải là 1 array để khiến nested destructuring array literal gán những `item` tương ứng với các `var` khác, ví dụ:

```javascript
const places = ["first", "second", "third", "fourth"];
const [a, b, , d] = ([f, ...rest] = places);

console.log(a); //Output: first
console.log(d); //Output: fourth
console.log(f); //Output: first
console.log(rest); //Output: ["second", "third", "fourth"]
```

## Ứng dụng thực tế như nào

### 2D Bomberman Game

<div class="wp-block-image">

<figure class="aligncenter is-resized">![destructuring Coders.Tokyo](https://res.cloudinary.com/djeghcumw/image/upload/v1553139652/blog/1___Qjq_ioJpGPq8h4phyyng.png)

<figcaption>2D Bomberman Game

</figcaption>

</figure>

</div>

Giả sử bạn đang viết 1 module `getPosition`: returns vị trí hiện tại của nhân vật này - đó là 1 cặp tọa độ (x, y) Chúng ta sẽ giải bài toán này với **array destructuring**:

Giả sử bạn đang viết 1 module `getPosition`: returns vị trí hiện tại của nhân vật này - đó là 1 cặp tọa độ (x, y)  
Chúng ta sẽ giải bài toán này với **array destructuring**:

- Khi bạn gọi `getPosition` function, bạn sẽ có 1 array với index 0 là tọa độ x, và index 1 là tọa độ y `(coordinate = [x, y])`

- Hãy cùng xem khi ta phối hợp function này với *destructuring assignment* ra sao nhé:

Nhìn rất là dễ hiểu đúng không,`loc` của bạn còn có thể ngắn hơn nữa nếu bạn dùng destructuring ở danh sách các arguments của function này

```javascript
function getDistance(position1, position2) {
  const [x1 = 0, y1 = 0] = position1;
  const [x2 = 0, y2 = 0] = position2;
  return [x2 - x1, y2 - y1];
}
const position1 = [2, 4];
const position2 = [5, 3];
const [xDistance, yDistance] = getDistance(position1, position2);
// console.log(xDistance);  Should log 3
// console.log(yDistance); Should log -1
```

_Giải thích_:

- `[x1 = 0, y1 = 0]`: Đoạn code này đơn giản là bạn muốn 1 array với 2 positions. Và `index 0 = x1`, `index 1 = x2`. Trong trường hợp parameters truyền vào có ít hơn 2 giá trị, hoặc empty, thì x1 và x2 sẽ được gán = 0\. Chú ý rằng bạn có thể truyền vào 1 empty array chứ không được **omit** nó, không là bug ngay!
- `const [xDistance, yDistance] = getDistance(position1, position2)`: Đoạn code này nghĩa là function `getDistance` sẽ return an array. Thay vì lưu array này trong 1 `variable`, thì bạn đã assign index 0 và 1 vào trong `xDistance` và `yDistance` 1 cách lần lượt rồi.

### Làm việc với data

Hay chỉ đơn giản là bạn muốn get dữ liệu 1 cách tường minh, nhanh chóng hơn:

```javascript
const books = [
  { name: "Trà hoa nữ", author: "Alexandre Dumas con", type: "novel" },
  { name: "Đắc nhân tâm", author: "Dale Carnegie", type: "novel" },
  {
    name: "Tôi thấy hoa vàng trên cỏ xanh",
    author: "Nguyễn Nhật Ánh",
    type: "short story"
  }
];
const [book1, , book3] = books;
console.log(book3); // expected: { name:  'Tôi thấy hoa vàng trên cỏ xanh', author:  'Nguyễn Nhật Ánh', type:  'short story'}
const [...copyBooks] = books;
console.log(copyBooks); // expected: = books array
```

## Kết

Việc sử dụng được thành thạo destructuring sẽ khiến cho đoạn code của bạn trông khoa học hơn. Và còn nhanh hơn rất nhiều so với những cách thông thường.

Qua các phân tích trên, hãy nhớ những ý chính sau, bạn có thể sử dụng destructuring khi:

- Tạo ra những `var` mới tương ứng từ 1 `arr` cho trước
- Tạo ra 1 `copy arr` khi phối hợp _destructuring_ với _spread operator_
- Tráo đổi `value` của các `var`
- Đơn giản hóa việc lấy `value` để assign vào những `var` mình muốn từ các `element` của 1 array cho trước

Bài viết có tham khảo từ các blog sau:

- [https://medium.freecodecamp.org/array-destructuring-in-es6-30e398f21d10](https://medium.freecodecamp.org/array-destructuring-in-es6-30e398f21d10)
- [https://medium.com/@codingsam/awesome-javascript-destructuring-assignment-55fd2e9d3dc4](https://medium.com/@codingsam/awesome-javascript-destructuring-assignment-55fd2e9d3dc4)

Tài liệu tham khảo thêm về _destructuring_:

- [https://codeburst.io/es6-destructuring-the-complete-guide-7f842d08b98f](https://codeburst.io/es6-destructuring-the-complete-guide-7f842d08b98f)
