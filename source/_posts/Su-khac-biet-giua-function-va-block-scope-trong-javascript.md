---
title: Sự khác biệt giữa Function và Block Scope trong Javascript  
date: 2019-06-02 20:00:01
authorId: thai_son
tags:
---

![Sự khác biệt giữa Function và Block Scope trong Javascript](https://res.cloudinary.com/djeghcumw/image/upload/v1559454442/blog/0_6U5_t20VqbT6nwY2.jpg)

Xin chào các bạn, chẳc hẳn khi học Javascript các bạn thường nhầm lẫn giữa `Block Scope` và `Function Scope` đúng không? Hai khái niệm này thường rất gây nhầm lẫn và nó là một trong các câu hỏi hóc búa mà các nhà tuyển dụng hay hỏi với các ứng viên. Vậy hôm nay, mình sẽ cùng các bạn bóc tách xem chúng khác biệt như thế nào nhé. 


<!-- more -->

## Sự khác biệt giữa var, let, const 

Có ba cách khai báo biến trong [Javascript](http://bit.ly/2YVEv6q): 

```javascript
var width = 100;
let height = 200;
const key = 'abc123';
```

### Var và Function Scope 

`Var` có gì đặc biệt? Nó có thể được chỉ định và cập nhật lại. Ví dụ: 

```javascript 
// Define the variable:
var width = 100;

// Call the variable:
width;
// It returns:
100
// Reassign the variable and call it again:
width = 200;

width;
// Returns:
200
```

Biến `var` là `function scope`. Biến là fucntion, nói có vẻ thật ngu ngốc và sai lệch. Đó chỉ là một cách nhớ của tôi, vậy nó thực sự có ý nghĩa như thế nào? Điều có có nghĩa là, nó chỉ hoạt động phía bên trong `function` mà chúng được tạo ra, hoặc nếu nó không được tạo ra trong `function`, thì nó là `globally scoped`. 

Nếu biến`var` được định nghĩa bên trong một `function`. Sau đó, tôi cố gắng gọi nó phía bên ngoài function đó, thì nó sẽ không hoạt động: 

```javascript
function setWidth(){
    var width = 100;
    console.log(width);
}
width;
// Returns:
Uncaught ReferenceError: width is not defined
```

Một lần nữa, nếu bạn khai báo biến `var` trong một `function`, thì nó sẽ không hoạt động bên ngoài hàm đó.

## Hiểu về Block Scope 

```javascript
Example: 
var age = 100;
if (age > 12){
    var dogYears = age * 7;
    console.log(`You are ${dogYears} dog years old!`);
}
console.log(dogYears)
```

Trong ví dụ trên, màn hình `console` sẽ trả về: 

```javascript
You are 700 dog years old!
700
```

Tại sao lại như vậy, tại sao biến `dogYears` lại có thể hoạt động một cách `global` như vậy? 

Bởi vì biến `var` nó chỉ bị giới hạn bởi `function scope`- và ở trên nó không được khai báo bên trong một `function` mà thay vào đó, nó được khai báo bên trong một `block scope` do `if` tạo ra. 

Kết luận, biến `var` không bị giới hạn bên trong một `block scope`. 

## Lợi ích khi sử dụng let và const 

Vậy để giải quyết bài toán trên, ta phải làm gì để giới hạn biến đó lại trong `block scope` và không cho nó hoạt động phía bên ngoài để tránh gây nhầm lẫn. 

Vậy cái gì thực sự là `block`? Một `block` là một khối được định nghĩa trong cặp ngoặc nhọn {}, nó được tạo ra bởi các câu lệnh như `if`, `for`, `while`. 

Vậy ở ví dụ trên, nếu ta thay đổi khai báo cho biến `dogYears` bằng cách dùng từ khoá `let`, thì khi ta gọi `dogYears` phía bên ngoài `block`, nó sẽ trả về **Uncaught ReferenceError: dogYears is not defined**

```javascript 
var age = 100;
if (age > 12){
    let dogYears = age * 7;
    console.log(`You are ${dogYears} dog years old!`);
}
console.log(dogYears) // Uncaught ReferenceError: dogYears is not defined
```

## Tóm Tắt

```javavscript
var bị giới hạn bởi function scope.
let và const bị giới hạn bởi block scope.
Function scope là phạm vi hoạt động nằm trong function.
Block scope là phạm vi hoạt đông nằm trong một cặp ngoặc nhọn được tạo ra bởi if, for, while.
```

Bài viết tham khảo: 
https://medium.com/@josephcardillo/the-difference-between-function-and-block-scope-in-javascript-4296b2322abe
