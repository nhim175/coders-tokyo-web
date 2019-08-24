---
title: Bạn chưa hiểu JavaScript đâu kỳ 1 - Scopes và Hoisting
date: 2019-07-29 20:30:00
authorId: nhat_anh
tags:
---

![Bạn chưa hiểu JavaScript đâu kỳ 1 - Scopes và Hoisting](https://res.cloudinary.com/djeghcumw/image/upload/v1564237823/blog/javascript.png)

Vốn là một người tự học, mình đã từng phải bơi trong cả một bể kiến thức, nhặt từng mảnh nhỏ rời rạc, và cố ghép chúng lại thành bức tranh lớn. **Series Bạn chưa hiểu JavaScript đâu** ra đời nhằm giúp các bạn hệ thống kiến thức và tạo ra bức tranh toàn cảnh về JavaScript. Series lần này sẽ đi từ gốc tới ngọn giải thích cho các bạn tại sao cái này hoạt động thay vì chỉ dạy các bạn cách dùng. Và mình cũng sẽ dùng những ngôn từ rất đặc biệt nhằm khơi gợi khả năng tư duy của các bạn. Nào giờ thì chúng ta cùng lên đường chu du thôi.

<!--more-->

## Thuyết biên dịch

**Thuyết biên dịch** (_Compiler Theory_) nói rằng quá trình biên dịch (compilation) bao gồm 3 bước chính:

1. **Tokenizing/Lexing**: tách source code ra thành những mẩu nhỏ (tokens).

Ví dụ, `var codersTokyo = 'awesome';` sẽ được tách nhỏ ra thành `var`, `codersTokyo`, `=`, `awesome`, `;`. Khoảng trắng (white space) có thể không được coi là một token tùy vào ngữ cảnh.

2. **Parsing**: xếp chuỗi tokens vừa được tách thành một cây AST (**A**bstract **S**yntax **T**ree).

Ví dụ, `var codersTokyo = 'awesome';`, cây AST sẽ bắt đầu với các nodes là VariableDeclaration -> Identifier (xác định biến nào là codersTokyo) -> AssignmentExpression -> StringLiteral (có giá trị là 'awesome').

3. **Code-Generation**: là quá trình biến cây AST thành executable code.

Tạo một variable tên codersTokyo, lưu vào trong bộ nhớ, gắn giá trị cho nó bằng chuỗi 'awesome'.

## Bộ ba quyền lực

1. Tên trùm **Engine**: nắm quyền tối thượng, chịu trách nhiệm từ A tới Z việc biên soạn và thực thi chương trình.
2. Thằng đệ **Compiler**: xử lý việc _parsing_ và _code-generation_.
3. Mama tổng quản **Scope**: tập hợp và chăm sóc đàn em variables và đảm bảo bọn này thực thi đúng các quy tắc của JavaScript.

Chúng ta hãy cùng nhau phân tích cách trùm Engine và lũ bạn "xử" đoạn code `var codersTokyo = 'awesome';`.

- **Compiler**: Ê mày, tao mới gặp `var codersTokyo`. Mày check giùm tao trong scope của mày có thằng nào tên vậy không.
- **Scope X**: Có mày ơi. (Trường hợp này, compiler sẽ lờ khai báo và chuyển sang dòng code tiếp theo.)
- **Scope X**: Không nhé. (Trường hợp này, compiler sẽ kêu Scope X khai báo một biến mới có tên là `codersTokyo`.

Khi thực thi chương trình,

- **Engine**: Ê, trong scope của mày có thằng nào tên`codersTokyo` không vậy?
- **Scope X**: Có. (Trường hợp này, Engine sẽ dùng luôn biến đó.)
- **Scope X**: Không (Trường hợp này, Engine sẽ nhảy sang scope khác để tìm kiếm.)

Nếu tìm thấy, Engine sẽ gán giá trị 'awesome' cho `codersTokyo`, còn nếu tìm mãi không ra, Engine sẽ gào lên báo lỗi **ReferenceError**.

## Nhìn bên trái, ngó bên phải

Trong quá trình thực thi chương trình, Engine có thực thi một bước gọi là tìm kiếm (look-up). Có hai loại look-ups là ngó trái **LHS look-up** (**Left-hand Side look-up**) và ngó phải **RHS look-up** (**Right-hand Side look-up**).

```javascript
codersTokyo = "awesome";
/**
 * Engine sẽ thực hiện ngó trái (LHS look-up)
 * để tìm xem biến codersTokyo đã được khai báo ở chỗ nào.
 */
console.log(codersTokyo);
/**
 * Engine sẽ thực hiện ngó phải (RHS look-up)
 * để tìm giá trị biến codersTokyo được gán
 * pass giá trị đó qua hàm log(...)
 */
```

## Hoisting từ A tới Z

### Quả trứng có trước hay con gà có trước?

Xét hai ví dụ sau

```javascript
// Ví dụ 1
coderX = "cool";
var coderX;
console.log(coderX); // cool
```

```javascript
// Ví dụ 2
console.log(coderX); // undefined
var coderX = "cool";
```

Ở ví dụ 1, kết quả in ra màn hình là "cool", nhưng ở ví dụ 2 là "underfined".

JavaScript Engine chia dòng code `var coderX = 'cool';` làm 2 phần: khai báo - declaration (var = coderX) và gán giá trị - assignment (coderX = 'cool'). _Hoisting là phần khai báo luôn được di chuyển lên đầu tiên của scope_. Quả trứng (phần khai báo) có trước con gà (phần gán giá trị).

Do vậy, Engine sẽ xử lý như sau.

```javascript
// Ví dụ 1:
var coderX; // phần khai báo
// =================
coderX = "cool"; // phần gán trị
console.log(coderX); // cool
```

```javascript
// Ví dụ 2:
var coderX; // phần khai báo
// ===================
console.log(coderX); // underfined
/**
 * Engine nhòm sang phải (RHS look-up) tìm gía trị của coderX
 * nhưng không thấy đâu nên kết quả là underfined.
 */
coderX = "cool"; // phần gán giá trị
```

### Function expression

```javascript
bar(); // 2

function bar() {
  var a = 2;
  console.log(a);
}
```

Hàm bar() sẽ được hoisted lên đầu scope cùng với giá trị của nó. Khai báo function sẽ được hoisted nhưng nếu gán giá trị function cho 1 biến như ví dụ dưới (_function expression_) thì không.

```javascript
foo(); // TypeError?
bar(); // ReferenceError?

var foo = function bar() {
  // đây là function expression
  var a = 2;
  console.log(a);
};
```

Khi thấy foo được gọi như một hàm trong khi nó được hoisted và coi như là một biến có giá trị là underfined thì Engine sẽ báo TypeError. Ê, nhầm kiểu dữ liệu rồi mày ơi. Còn hàm bar() vì được miêu tả bên trong một biểu thức nên tên hàm bar sẽ không tồn tại trong scope. Khi gọi hàm bar(), Engine sẽ báo là ReferenceError. Tao không thấy thằng nào tên như này trong scope.

### Functions First

```javascript
// Ví dụ 1:
foo(); // 1

function foo() {
  console.log(1);
}

var foo = function() {
  console.log(2);
};
```

Hàm foo sẽ được hoisted trước biến foo. Engine sẽ biên dịch đoạn codes này theo thứ tự sau.

```javascript
// Ví dụ 1:
function foo() {
  console.log(1);
}

foo(); // 1

var foo = function() {
  console.log(2);
};
```

Vậy nếu thêm một function foo() nữa thì sao?

```javascript
// Ví dụ 2:
foo(); // kết quả là 3 vì function foo bị ghi đè.

function foo() {
  console.log(1);
}

var foo = function() {
  console.log(2);
};

function foo() {
  console.log(3);
}
```

## Tổng kết

- Bộ ba quyền lực trong JavaScript: **Tên trùm Engine**, **Thằng đệ Compiler** và **Mama tổng quản Scope**.
- **Nhìn bên trái** (_LHS - Left-hand side_) kiểm tra biến được khai báo chưa, **ngó bên phải** (_RHS - Right-hand side_) để tìm giá trị của biến.
- Gán trị cho biến (_Assignments_) thì không bị hoisted còn khai báo biến (_Declarations_) thì bị hoisted.
- Function được hoisted trước rồi mới tới variables.

## Bài tập cho bạn

Đọc mà không thực hành thì đọc cũng như không nên _Series Bạn không biết JavaScript đâu kỳ 1_ có bài tập để kiểm tra kiến thức bạn nắm được.

Tìm tất cả những LHS look-ups và RHS look-ups trong đoạn codes bên dưới.

```javascript
function sayHi(a) {
  var b = ", CodersX";
  return a + b;
}

var c = sayHi("Hi"); // Hi, CodersX
```

Sau khi làm xong thì xem đáp án tại [đây](https://repl.it/@Nhat_AnhAnh/RHS-LHS)

## Tài liệu tham khảo

- Bộ sách You don't know JS của Kyle Simpson
- MDN documentation về Scope, Function và Hoisting

Nếu bạn có phần nào chưa rõ hay muốn trao đổi thêm với mình, đừng ngần ngại [inbox mình](https://www.facebook.com/japananh) nhé. Chúc các bạn đọc vui.

Nếu bạn muốn có nhiều cơ hội trải nghiệm hơn, hãy tham gia cộng đồng học lập trình miễn phí [CodersX](https://school.coders-x.com/) với chúng mình. Together, we change the world.
