---
title: 11 thứ phải học trên con đường trở thành `Master` Javascript
date: 2019-04-24 19:00:00
authorId: thai_son
tags:
---

Tôi đoán, bạn là một `web developer`.Hi vọng rằng, bạn đang làm tốt nó và có một công việc tuyệt vời. Thậm chí, có thể bạn tự làm chủ hoặc làm một công việc `freelancer`. Có lẻ bạn đang bắt đầu trên chặn đường làm web, hoặc bạn đã làm việc với nó trong một thời gian dài. Tuỳ nhiên để thành công với nó, bạn phải thật sự thành thạo Javascript. Bạn phải liên tục cập nhật những thứ về javascript và hiểu những `concept`cơ bản về nó. Dưới đây là 11 điều bạn chắc chắn phải học trước khi bạn có thể tự gọi mình là `master` về JavaScript.

![10 thu phai de tro thanh master javascript](https://res.cloudinary.com/djeghcumw/image/upload/v1556072121/blog/10%20th%E1%BB%A9%20ph%E1%BA%A3i%20h%E1%BB%8Dc%20tr%C3%AAn%20con%20%C4%91%C6%B0%E1%BB%9Dng%20master%20javascript.jpg)

<!-- more -->

## 1\. Control Flow

Có lẻ đây là chủ để cơ bản nhất trong danh sách. Một trong những thứ quan trọng, có lẻ là quan trọng nhất. Nếu như bạn không biết cách xử lý `code` của bạn, có lẻ bạn sẽ rất khó khăn. Biết được tiến trình và sự thực thi của các dòng `code` cơ bản chắc chắn là điều bắt buộc.

*   `if else` - Nếu bạn không biết chúng, vậy trước đây bạn viết `code` như thế nào ?
*   `switch` - về cơ bản dùng nó thay cho `if else` có thể chuyên nghiệp hơn, hãy dùng nó khi bạn gặp nhiều trường hợp.
*   `for` - Đừng lặp lại các dòng code, đây là công dụng của `Vòng lặp`. Bên cạnh các cách lặp tiện dụng như `for of` hoặc `for in.` Lợi thế lớn của `for loops` là chúng đang `blocking`, vì vậy bạn có thể sử dụng `async await` bên trong chúng.
*   Điều kiện nâng cao - Sử dụng các toán tử `ternary` và `logical` giúp bạn dễ dàng hơn khi code. Đặc biệt khi bạn cố viết `code` trên 1 dòng, có nghĩa là bạn không muốn lưu giá trị và sử dụng chúng sau. Ví dụ:

```javascript 
    // ternary
    console.log(new Date().getHours() < 12 ? 'Good Morning!' : 'Time for a siesta')

    // logical operators
    const isJsMaster = prompt('Are you a JavaScript master?') === 'true'
    console.log(isJsMaster && 'proficient coder')
```

## 2\. Error handling

Điều này thường làm mất một khoảng thời gian cho tôi. Nó không vấn đề nếu bạn đang làm việc về front-end hoặc backend trong một vài năm đầu. Lúc đó, bạn có thể dễ dàng sử dụng `console.log` hoặc có thể `console.error` để bắt lỗi. Để viết một ứng dụng tốt, bạn chắc chắn phải thay đổi điều đó bằng cách xử lý các lỗi độc đáo hơn. Bạn có thể muốn kiểm tra cách xây dựng hàm bắt lỗi của riêng mình và cách bắt chúng chính xác, cũng như cho người dùng biết vấn đề thực sự là gì.

UPDATE: Hãy đọc [bài này](https://levelup.gitconnected.com/the-definite-guide-to-handling-errors-gracefully-in-javascript-58424d9c60e6) để biết cách xử lý lỗi một cách tinh tế!

## 3\. Data Models

Giống như việc di chuyển qua ứng dụng của bạn liên tục, bạn phải quyết định nơi nhóm các khối thông tin cụ thể và nơi giữ chúng tách biệt. Điều này không chỉ áp dụng để xây dựng các mô hình cơ sở dữ liệu, mà còn các tham số chức năng và các đối tượng hoặc biến. Ví dụ:

```javasciprt
    const calcShape = (width, height, depth, color, angle) => {...}
```

## 4\. Asynchronity

Đây là một khía cạnh rất quan trọng của JavaScript, khi bạn đang `fetch` dữ liệu từ `backend` hoặc bạn đang xử lý các yêu cầu không đồng bộ trong `backend`. Trong hầu hết tất cả các giai đoạn, bạn sẽ gặp phải sự không đồng bộ và cảnh báo của nó. Nếu bạn không biết đó là gì, có thể bạn sẽ gặp một lỗi lạ, bạn sẽ mất thời gian để khắc phục nó. Nếu bạn không biết cách giải quyết nó, bạn sẽ bị kẹt trong một trường hợp được gọi là `callback-hell`. Cách tiếp cận tốt hơn là sử dụng `promises` hoặc `async await` trong ứng dụng của bạn.

## 5\. DOM Manipulation

Đây là một chủ đề thú vị. Có thể bạn đã học `jQuery` và chưa bao giờ cảm thấy cần phải học một số kỹ năng thao tác DOM thuần tuý, có lẻ bạn đang sử dụng `front-end framework,` nơi hiếm khi cần một thao tác DOM thuần tuý. Tuy nhiên, tôi nghĩ rằng đây là một phần quan trọng để hiểu `JavaScript,` ít nhất trong `frontend.`Biết cách DOM hoạt động và cách truy cập các phần tử giúp bạn hiểu sâu sắc về cách các trang web hoạt động. Thêm vào đó, nó sẽ có một vài điểm bạn cần sử dụng thao tác DOM thuần tuý. Thậm chí khi bạn sử dụng `frontend framework,` và bạn không muốn thêm `jquery` vào trong file `package.json`, chỉ để truy cập một số phần tử.

![javascript](https://res.cloudinary.com/djeghcumw/image/upload/v1556078883/blog/1_ihkJp6UoTT9cJ8pW1ErAfQ.jpg)

## 6\. Node.js / Express

Thậm chí nếu bạn là một fronend developer, bạn nên có kiến thức cơ bản về `node.js`. Lý tưởng nhất, bạn cũng nên biết cách tạo một `express server` đơn giản và thêm một số `routes` hoặc thay đổi các tuyến hiện có. `Javascript`rất tốt để viết các tập lệnh để giúp bạn tự động hóa rất nhiều tác vụ. Do đó, biết cách đọc tệp, làm việc với `filepath` hoặc `buffers`cho bạn một bộ công cụ tốt để xây dựng mọi thứ.

## 7\. Javascript Functional Approach

Có một cuộc tranh luận muôn thuở về lập trình hướng đối tượng và lập trình hướng chức năng. Bạn cũng có thể đạt điều tương tự với hai hướng tiếp cận. Trong `Javascript,` nó thậm chí còn dễ dàng hơn, bạn có cả hai cách tiếp cận có sẵn. Các thư viện như `lodash` cung cấp cho bạn một bộ công cụ thực sự tốt để xây dựng các ứng dụng với cách tiếp cận chức năng. Ngày nay, thậm chí không cần sử dụng các thư viện bên ngoài nữa. Rất nhiều chức năng quan trọng nhất đã được triển khai trong Javascript. Bạn nên biết cách sử dụng `map`, `reduce,` `filter`, `forEach` và`find`.

## 8\. Object Oriented Approach

Tương tự như `Functional approach,`bạn cũng phải làm quen với `Object Oriented Approach` nếu bạn muốn master nó. Tôi đã bỏ qua nó trong một thời gian dài trong sự nghiệp của mình, và chỉ làm việc theo hướng cố giải quyết cho xong. Nhưng đôi khi bạn sử dụng lập trình hướng đối tượng sẽ tốt hơn để thể hiện các chức năng cụ thể. `Classes` được sử dụng rộng rãi trong `React,MobX` hoặc cấu trúc tuỳ chỉnh.

## 9\. Javascript Frontend Framework

Bộ ba anh lớn đó là `Reactjs,Angular` và `VueJS`. Ngày nay, nếu bạn đang tìm kiếm công việc về `front-end.` Bạn hầu như phải chọn 1 trong 3 `framework` này là điều tiên quyết. Ngay cả khi chúng thay đổi khá nhanh, điều quan trọng là bạn phải nắm được khái niệm chung về chúng để hiểu cách các ứng dụng hoạt động. Ngoài ra, việc viết ứng dụng theo cách đó dễ dàng hơn rất nhiều. Nếu bạn chưa quyết định chọn cái nào, tôi đề xuất bạn nên chọn `ReactJS`. Tôi đã làm việc với nó trong vài năm qua và không hối hận về quyết định của mình.

## 10\. Bundling / Transpilation

Thật không may, đây là một phần lớn của phát triển web. Một mặt tôi không nên nói điều không may, vì thật tuyệt khi có thể viết mã với tất cả các tính năng mới nhất. Mặt khác, lý do tại sao tôi nói rằng đó là: chúng ta luôn phải nhớ rằng còn rất nhiều trình duyệt cũ. Và chúng có thể không hỗ trợ các tính năng này. Do đó chúng ta phải dịch mã của chúng ta sang một thứ khác để các trình duyệt cũ có thể hiểu được.

Nếu bạn làm việc với `node.js`, có lẽ bạn sẽ ít tiếp xúc với việc dịch mã của bạn. Tiêu chuẩn thực tế cho việc dịch mã là `babel.js`, vì vậy hãy làm quen với nó. Đối với việc gói mã của bạn và buộc mọi thứ lại với nhau, bạn có thể có một vài lựa chọn. `Webpack` là một lựa chọn tối ưu vì nó đã thống trị một thời gian dài.

## 11\. Regular Expressions

Điều này không cụ thể đối với JavaScript, nhưng cực kỳ hữu ích trong nhiều trường hợp sử dụng. Cũng khó hiểu là tốt. Làm quen với cú pháp của `Regular Expression` chắc chắn cần một chút thời gian và việc nhớ tất cả các tùy chọn khác nhau là không thể.

## Kết

Tôi tin rằng những điều trên sẽ giúp bạn nhiều trên con đường `master` Javascript. Và để học những thứ trên, tôi xin giới thiệu bạn vào trang web [Coders.Tokyo.](https://coders.tokyo/) Ở đó bạn sẽ được hướng dẫn một cách đơn giản nhất với những thứ phức tạp nhất. Cám ơn các bạn đã dành một chút thời gian để đọc bài, nếu thấy hay các bạn hãy share bài để ủng hộ tụi mình nhé.

## Tham Khảo

[https://levelup.gitconnected.com/10-things-to-learn-on-the-way-to-become-a-javascript-master-f4fc632b2bb7](https://levelup.gitconnected.com/10-things-to-learn-on-the-way-to-become-a-javascript-master-f4fc632b2bb7)