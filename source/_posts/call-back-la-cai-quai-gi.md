---
title: Callback là cái quái gì?
date: 2019-05-08 19:00:00
authorId: thai_son
tags:
---

![Callback là cái quái gì?](https://res.cloudinary.com/coders-tokyo-shyn/image/upload/v1556192874/BLOG/1_pWGJIKats-zuumA3RQNEWQ_ysgut4.jpg)

Trước đây các bạn có lẽ các bạn cùng đã nghe qua thuật ngữ `Callback`. Nhưng để hiểu rõ nó là gì, hôm nay chúng ta hãy cùng tìm hiểu những thứ cơ bản về `Callback` trong 6 phút cực đơn giản nhé các huynh đệ!

<!--more -->

## Callback là gì?

**Khái niệm:** `Callback` là một function rằng nó được chạy sau khi một function khác chạy xong. Vì vậy nó được gọi là `Callback.`

**Phức tạp hơn:** Trong Javascript, một function cũng được coi là một object. Bởi vì, function có thể chứa một function khác như một `argument` và nó có thể trả về bởi một function khác. Function làm việc này được gọi là `higher-order functions.` Bất kì function nào được truyền dưới dạng một `argument` được gọi là một `callback function.`

Có vẻ là hơi rối rắm. Nào! Chúng ta cùng xem qua một số ví dụ để hiểu hơn về nó.

## Tại sao chúng ta lại cần CallBack?

Vì một lý do cực kì quan trọng -- Javascript là một ngôn ngữ lập trình hướng sự kiện. Điều này có nghĩa là thay vì chờ phản hồi trước khi tiếp tục, JavaScript sẽ tiếp tục thực thi trong khi lắng nghe các sự kiện khác. Hãy xem xét một ví dụ cơ bản:
```javascript
function first(){
    console.log(1);
}
function second(){
    console.log(2);
}
first();
second();
```
Đúng như những gì mong đợi, ở đây. Function `first` sẽ thực thi trước, và function `second` sẽ thực thi vào sau đó - và màn hình `console` sẽ xuất hiện như sau:
```javascript
// 1
// 2
```
Tuyệt vời! Nhưng bây giờ, điều gì sẽ sảy ra khi function `first` chưa một số dòng code không thể thực thi xong ngay lập tức? Ví dụ: API request .... Để mô phỏng hành động này, chúng ta sẽ sử dụng `setTimeout` (một function của Javascript, nó sẽ được gọi sau một khoảng thời gian). Chúng ta sẽ cho function `first` đợi khoảng 500 miliseconds để mô phỏng một `API Request.` Và dưới đây là đoạn code mới của chúng ta.
```javascript
function first(){
    // Simulate a code delay
    setTimeout( function(){
    console.log(1);
    }, 500 );
}
function second(){
    console.log(2);
}
first();
second();
```
Ở đây, cũng không nhất thiết là bạn phải hiểu `setTimeOut()` ngay bây giờ. Vấn đề ở đây là hàm `console.log(1)` sẽ thực hiện sau 500 miliseconds. Vậy, điều gì sẽ xảy ra khi chúng ta gọi hàm `first()` và `second()`.
```javascript
first();
second();
// 2
// 1
```
Mặc dù chúng ta đã gọi hàm `first()` đầu tiên, nhưng chúng ta thấy đấy. Ở màn hình `CONSOLE` thì rõ ràng hàm `second()` đã được chạy trước.

Không phải là JavaScript đã không thực hiện các chức năng của chúng ta theo thứ tự mà chúng ta muốn. Mà thay vào đó, JavaScript đã không chờ đợi phản hồi từ hàm `first()` trước, mà nó đã chuyển sang thực hiện hàm `second()`.

## Cách tạo một CallBack

Đầu tiên, chúng ta hãy mở `Chrome Developer Console` (Windows: Crt + Shift + J) (Mac: Cmd + Option + J) và viết đoạn code dưới đây vào màn hình `console` của bạn.
```javascript
function doHomework(subject) {
    alert(`Starting my ${subject} homework.`);
}
```
Ở trên, chúng ta đã tạo ra hàm `doHomework`. Hàm này chúng ta có một biến, `Subject` mà chúng ta đang làm việc. Bây giờ, chúng ta hãy gọi hàm này bằng cách đánh đoạn code dưới đây.
```javascript
doHomework('math');
// Alerts: Starting my math homework.
```
Bây giờ, chúng ta hãy thêm `callback` như một `parameter` trong hàm `doHomework()`. Sau đó, hàm `callback` sẽ được định nghĩa như một `argument` thứ hai trong khi gọi `doHomework()`.
```javascript
function doHomework(subject, callback) {
    alert(`Starting my ${subject} homework.`);
    callback();
}

doHomework('math', function() {
    alert('Finished my homework');
});
```
Như bạn thấy, nếu bạn gõ đoạn code ở trên trong màn hình `console` của bạn, thì hàm `alert` sẽ được gọi 2 lần. Bắt đầu là `Starting homework` và sau đó là `finished my homework`.

Nhưng `callback functions` không phải luôn luôn được định nghĩa trong function của chúng ta khi gọi. Chúng ta có thể định nghĩa nó ở một số nơi và gọi chúng như dưới đây:
```javascript
function doHomework(subject, callback) {
    alert(`Starting my ${subject} homework.`);
    callback();
}
function alertFinished(){
    alert('Finished my homework');
}
doHomework('math', alertFinished);
```
Kết quả của ví dụ này hoàn toàn giống với ví dụ trước, nhưng cách viết hơi khác một chút. Như bạn có thể thấy, mình đã chuyển định nghĩa hàm `alertFinished()` riêng, và gọi nó như một đối số!

### Ví dụ thực tế

Trước đây, mình đã public một bài viết có tên [Create a Twitter Bot in 38 lines of code](https://hackernoon.com/build-a-simple-twitter-bot-with-node-js-in-just-38-lines-of-code-ed92db9eb078). Lý do vì sao chỉ có 38 dòng là tại vì mình dùng [Twitters API](https://dev.twitter.com/rest/public). Whi bạn thực hiện một `request` tới `API`, bạn phải đợi một khoảng thời gian trước khi ban tiếp tục thực hiện thao tác với nó. Đây là một ví dụ cực kì tuyệt vời với `callback function`. Và đây là đoạn code của mình:
```javascript
T.get('search/tweets', params, function(err, data, response) {
    if(!err){
    // This is where the magic will happen
    } else {
    console.log(err);
    }
})
```
*   `T.get` nó đơn giản là một hàm chúng ta gửi request tới API
*   Nó có các tham số trong `request` này: `‘search/tweets’`, đây là địa chỉ của `request`, `params` là tham số tim kiếm của chúng ta, và tham số cuối cùng chính là `callback function`.  

Một `callback function` cực kì quan trọng, bời vì chúng ta cần đợi phản hồi từ server trước khi chúng ta tiếp tục công việc. Chúng ta không biết, liệu `API Request` của chung ta liệu có thành công hay không, vì vậy sau khi gửi request tới server chúng ta phải chờ. Một khi server phản hồi, `callback functions` của chúng ta sẽ được gọi. Server sẽ thông báo lỗi nếu trong quá trình có lỗi xảy ra. Để làm được điều đó chúng ta sử dụng câu lệnh `if, else` để thực hiện chúng.

## Tài liệu tham khảo:

[https://codeburst.io/javascript-what-the-heck-is-a-callback-aba4da2deced](https://codeburst.io/javascript-what-the-heck-is-a-callback-aba4da2deced)