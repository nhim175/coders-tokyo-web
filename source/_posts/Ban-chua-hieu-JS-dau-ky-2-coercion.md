---
title: Bạn chưa hiểu JavaScript đâu kỳ 2 - Coercion
date: 2019-08-12 20:30:00
authorId: nhat_anh
tags: javascript
---

![Bạn chưa biết JavaScript đâu](https://res.cloudinary.com/djeghcumw/image/upload/v1564237823/blog/javascript.png)

Search Google với từ khóa **coercion trong javascript** rồi dạo một lượt tầm hơn chục **bài tiếng việt nằm trên top** mà mình tá hoảng khi chỉ có **duy nhất 2 bài** là **nội dung tạm được** và **có trích dẫn nguồn**. Còn lại đều mắc rất nhiều lỗi về cả nội dung lẫn dịch thuật. Vì vậy, để giúp các bạn có cái nhìn chính xác từ gốc tới ngọn, thay vì tung bài về `this` theo kế hoạch, mình đã quyết định viết thêm bài về **Coercion**. Và chắc bạn cũng đoán được chủ đề của Series _Bạn chưa hiểu JavaScript đâu_ kỳ này là gì rồi nhỉ? Một, hai, ba, tẩy não thôi.

<!-- more -->

Nếu bạn chưa đọc bài _Bạn chưa hiểu JavaScript đâu kỳ 1 - Scopes và Hoisting_ viết về _bộ ba quyền lực trong JavaScript_ thì mình khuyên các bạn nên đọc nó trước tại [đây](https://coders-x.com/2019/07/29/Ban-chua-hieu-JS-dau-ky-1-scope-hoisting/).

## Nhắc lại về kiểu dữ liệu trong JavaScript

### Primitive Data Types

Kiểu dữ liệu được gọi là **Primitive** là kiểu dữ liệu **không phải object và không có methods**. Có 7 primitive types bao gồm:

- **Number**
- **String**
- **Boolean**
- **Null**
- **Undefined**
- **Symbol**
- **BigInt**: một _built-in object_ được tạo để biểu diễn _whole numbers_ (số nguyên dương và số 0) có giá trị lớn hơn 2^53.

Bạn có thể đọc thêm về primitive types ở [MDN documentation](https://developer.mozilla.org/en-US/docs/Glossary/Primitive).

### Non-primitive Data Types

Đọc tên thì cũng biết là đây là tập hợp kiểu dữ liệu nằm ngoài 7 kiểu ở trên.

- **Object**

**Lưu ý**: **Array** và **Function** được coi là **subtype** của Object (nhóm con), chứ nó không được coi như type của JavaScript. (Thắc mắc thì coi lại [MDN documentation](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#Data_types).)

## Coercion là gì?

**Coercion** dịch từ anh ra việt nghĩa là sự ép buộc, bắt buộc làm gì đó.

![Coercion meaning](https://res.cloudinary.com/djeghcumw/image/upload/v1565459194/blog/coercion.png)

Trong JavaScript, **coercion** (hay còn gọi là **type conversion**) được hiểu là việc biến đổi (**convert**) từ kiểu dữ liệu này sang kiểu dữ liệu khác trong quá trình thực hiện chương trình.

Trong ví dụ dưới, ở vế trước, `string` "10" được đổi kiểu dữ liệu từ `string` thành `number`, rồi JavaScript Engine mới thực hiện so sánh giá trị hai vế với nhau.

```javascript
"10" == 10; // true => String bằng được Number. Lạ nhỉ???
```

Lưu ý, trong quá trình dịch, mình dùng từ **đổi kiểu dữ liệu** thay vì từ **ép kiểu dữ liệu** như số đông. Chỉ là thay đổi ngôn từ để các bạn dễ hiểu thay vì _dịch kiểu Google translate_ và _lạm dùng từ hán việt_ hại não các bạn.

## Coercion hoạt động như thế nào?

Đây là thứ tự chạy của Engine trong `==` (_cho phép coercion_):

1. Đổi sang Primitive Form nếu không phải Primitive Type.
2. Check xem cùng kiểu dữ liệu chưa? Nếu chưa, Engine thì sẽ ưu tiên đổi 2 vế thành Number (nếu có thể). Nếu rồi, nhảy qua bước 3.
3. So sánh giá trị.
4. Trả về kết quả bằng `true` hoặc `false`.

Xét đoạn chương trình sau:

```javascript
var codersX1 = 10;
var codersX2 = [10];

if (codersX1 == codersX2) {
  // true ???
  // do something ...
}

/**
 * if (codersX1 == codersX2)
 
 * if (10 == [10]) => thực hiện ToPrimitive([10]), biến [10] thành "10"
 
 * if (10 == "10") => Vế trái có type là Number, nên vế phải sẽ được ưu tiên đổi sang Number, 
 * "10" biến thành 10
 
 * if (10 === 10) => Aha, giờ 2 vế có cùng type rồi, mình chuyển qua so sánh `===`
 
 * if (true) => giá trị bằng nhau nên trả về true
 */
```

## Nhầm lẫn giữa `==` và `===`

Mình xin phép **giải thích thuật ngữ** trước khi phân tích tiếp.

The _ECMAScript specification_ (gọi tắt là **ECMAScript** hay ngắn gọn hơn nữa là **specification** - đây cũng là từ mình dùng trong bài này) là bộ tiêu chuẩn chung, hiểu đại khái như _pháp luật_ của nước _JavaScript,_ buộc mọi công dân trong lãnh thổ JavaScript phải tuân theo, phá luật, gặp bugs là tèo.

### Check type và không check type?

Nhiều người vì **không hiểu bản chất của JavaScript** (có thể _do lười đọc specification_) mà **nhầm** rằng sự khác nhau giữa `==` và `===` là:

> `==` không check kiểu dữ liệu, chỉ so sánh giá trị, trong khi `===` check kiểu dữ liệu rồi mới so sánh giá trị.

Mình xin khẳng định lại một lần nữa là **KHÔNG PHẢI** nhé. Mà phải là:

- `==` _cho phép_ **coercion** (_đổi kiểu dữ liệu_).
- `===` _không cho phép_ **coercion** (_đổi kiểu dữ liệu_).

**Nói có sách mách có chứng**

Mình đã đọc đi đọc lại vài lượt **specification** của JavaScript rồi nên mình mạnh mồm lắm.

OK, giờ bạn hãy nhìn vào **mục 1** của **specification** về `==`.

![Abstract Equality Comparison](https://res.cloudinary.com/djeghcumw/image/upload/v1565456273/blog/abstract-equality-comparison.png)

> 1. If [Type](https://www.ecma-international.org/ecma-262/9.0/index.html#sec-ecmascript-data-types-and-values)(x) is the same as [Type](https://www.ecma-international.org/ecma-262/9.0/index.html#sec-ecmascript-data-types-and-values)(y), then Return the result of performing [Strict Equality Comparison](https://www.ecma-international.org/ecma-262/9.0/index.html#sec-strict-equality-comparison) x === y.

> Tạm dịch là Nếu hai thằng x và y có cùng type thì chuyển sang so sánh "===". Còn lại thì xuống mục 2 check tiếp.

Ơ, nó cũng check type kìa anh em.

Nhìn tiếp vào **mục 1** của **specification** về `===`.

![Strict Equality Comparison](https://res.cloudinary.com/djeghcumw/image/upload/v1565456264/blog/strict-equality-comparison.png)

> 1.  If [Type](https://www.ecma-international.org/ecma-262/9.0/index.html#sec-ecmascript-data-types-and-values)(x) is different from [Type](https://www.ecma-international.org/ecma-262/9.0/index.html#sec-ecmascript-data-types-and-values)(y), return false.

> Tạm dịch là Nếu hai thằng x và y khác type thì trả về false. Còn lại thì xuống mục 2 check tiếp.

Oooh, vậy là cả hai thằng này **đều check type** hết chỉ có behaviors (hành vi) của chúng nó khác nhau sau khi check type thôi.

### Tránh `==` nhiều nhất có thể?

**Thứ nhất**, đầy là một nhận định **sai lầm** lại do **lười đọc specification** của JavaScript. Như hướng dẫn của specification thì nếu x và y có cùng kiểu dữ liệu thì dù là `==` hay `===` đều như nhau hết.

**Thứ hai**, tại sao lại phải dùng `===` (có thể tốn thời gian thêm bước _type conversion_) mà không dùng luôn `==` với những thứ bạn đã biết rõ kiểu dữ liệu?

**Thứ ba**, việc **dùng bừa bãi** `==` và `===` chứng tỏ bạn **không hiểu mình đang code cái gì**. Bằng chứng là bạn đâu có nắm rõ được kiểu dữ liệu của biến trong chương trình.

Sau đây là **quy tắc dùng** `==` và `===`:

- Dùng `==` khi bạn đã **biết rõ kiểu dữ liệu** trong phép so sánh.

```javascript
// Ví dụ 1
var x = {};

if (x === null && x === undefined) {
  // Do something ...
}
```

```javascript
// Ví dụ 2
var x = {};

if (x == null) {
  // Do something ...
}

/**
 * Với `==`, null == underfined và ngược lại.
 * Cho nên, nếu giá trị của x bằng null hoặc undefined
 * thì việc so sánh là như nhau,
 * chương trình trông sáng sủa hơn.
 */
```

- Các trường hợp còn lại dùng `===`

## JavaScript lạ chưa! @\_@

### Đừng bao giờ so sánh với giá trị phủ định của chính nó (the negation of itself)

```javascript
[] == ![]; // true ??? - so sánh với giá trị phụ định
[] != []; // true
```

```javascript
var codersX1 = [];
var codersX2 = [];

if (codersX1 == !codersX2) {
  // true ???
  // do something ...
}

/**
 * if (codersX1 == !codersX2)
 * if ([] == ![]) => Thực hiện biến đổi ![] thành `false`
 * if ([] == false) => Thực hiện biến đổi [] thành ""
 * if ("" == false) => Thực hiện biến đổi "" thành 0 và `false` thành 0
 * if (0 === 0) => Aha, giờ 2 vế có cùng type rồi, mình chuyển qua so sánh `===`
 * if (true) => giá trị bằng nhau nên trả về `true`
 */

if (codersX1 != codersX2) {
  // true ???
  // do something ...
}

/**
 * if (codersX1 != codersX2)
 * if (!(codersX1 == codersX2)) => `codersX1 == codersX2` trả về `false`
 * if (!(false))
 * if (true)
 */
```

## Tổng kết

- Các kiểu dữ liệu trong JavaScript bao gồm **Primitive Types** (**number**, **string**, **boolean**, **null**, **undefined**, **symbol**, **bigInt**) và **Non-Primitive Types** (**object**).
- **Array** và **Function** được coi là **subtype** của Object (**nhóm con**).
- `==` cho phép **coercion** (_đổi kiểu dữ liệu_) trong khi `===` không cho phép **coercion** (_đổi kiểu dữ liệu_).
- Dùng `==` khi bạn đã **biết rõ kiểu dữ liệu** trong phép so sánh. Các trường hợp còn lại dùng `===`
- Đừng bao giờ so sánh với giá trị phủ định của chính nó (the negation of itself).

## Bài tập cho bạn

Yêu cầu: Đọc đề bài ở file `README`. Sau đó, mở file `index.js` làm bài. Cuối cùng, xem đáp án ở file `index.fixed.js`. Có phần test ở cuối bài.

Em Linh đây: https://repl.it/@Nhat_AnhAnh/CoercionExercises

Nếu tất cả là `true` thì là **đúng hết**. Làm được bài này các bạn sẽ học được rất nhiều thứ nên nếu ngồi cả ngày mà làm chưa đúng hết thì cứ làm tiếp nhé.

## Tài liệu tham khảo

- Khóa [Deep JS Foundations V3](https://frontendmasters.com/courses/deep-javascript-v3) của Kyle Simpson
- [Tập 4 Types and Grammar](https://github.com/getify/You-Dont-Know-JS/blob/master/types%20%26%20grammar/ch4.md#chapter-4-coercion) - You don't know JS của Kyle Simpson
- Abstract Equality Comparison: [ECMA-262, 9th edition, June 2018](https://www.ecma-international.org/ecma-262/9.0/index.html#sec-abstract-equality-comparison)
- Strict Equality Comparison: [ECMA-262, 9th edition, June 2018](https://www.ecma-international.org/ecma-262/9.0/index.html#sec-strict-equality-comparison)
- Type conversion: [ECMA-262, 9th edition, June 2018](https://www.ecma-international.org/ecma-262/9.0/index.html#sec-type-conversion)
- MDN documentation về [Data Types](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#Data_types)

Nếu bạn có phần nào chưa rõ hay muốn trao đổi thêm với mình, đừng ngần ngại [inbox mình](https://www.facebook.com/japananh) nhé. Chúc các bạn đọc vui.

Nếu bạn muốn có nhiều cơ hội trải nghiệm hơn, hãy tham gia cộng đồng học lập trình miễn phí [CodersX](https://school.coders-x.com/) với chúng mình. Together, we change the world.
