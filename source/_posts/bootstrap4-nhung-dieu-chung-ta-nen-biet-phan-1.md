---
title: Boostrap 4!Những thứ chúng ta nên biết (Phần 1)
date: 2019-04-02 19:00:00
authorId: thai_son
tags:
---

![Bootstrap 4 và những thứ chúng ta cần biết](https://res.cloudinary.com/djeghcumw/image/upload/v1553669500/blog/1_nuLeM9tRbsryXO7qg_XAyQ.png)

Xin chào các bạn, mình quay trở lại rồi đây (^^). Ở bài viết này, mình sẽ chia sẽ cho các bạn những thứ cơ bản về bootstrap mà bạn nên biết. Những thứ mà bạn bắt đầu xây dựng một `responsive websites` với phiên bản mới nhất của Bootstrap, version 4.

Nếu kiến thức về CSS của bạn chưa tốt, mình khuyên bạn nên tìm hiểu kỹ về nó trước khi đọc bài này. Để có được một kiến thức toàn diện và tổng quát về CSS, mình xin giới thiệu bạn khoá học CSS đến từ [Coders.Tokyo School](https://school.coders.tokyo/login).

Nếu bạn đã sẵn sàng, chúng ta hãy bắt đầu!

<!-- more -->

## Những thứ mới mẻ ở Bootstrap 4

Bootstrap là một framework HTML,CSS,JS cực kì phổ biến. Nó dùng để chúng ta có thể dễ dàng responsive, mobile-first websites. Và đặc biệt, nó giúp chúng ta viết code một cách tiết kiệm thời gian hơn.

Ở mục này, mình hướng tới những người đã từng có kinh nghiệm về Bootstrap 3\. Nếu bạn là một người mới, không sao! Bạn có thể bỏ qua mục này và đọc tới mục tiếp theo.

Phiên bản mới nhất của Bootstrap là Boostrap 4\. Ở phiên bản này chúng ta được cập nhật những thứ mạnh mẽ và tối ưu hơn.

### 1\. Thay đổi giá trị border-box mặc định

Các phiên bản trước của bootstrap đã thiết lập giá trị cho `border-box` là `content-box.` Hầu hết mọi người như mình đều cảm thấy việc nãy gây phiền nhiễu và mất thời gian.

Bây giờ đội ngũ Bootstrap đã thay đổi giá trị của `border-box.` Nó giúp chúng ta dễ dàng hơn và tối ưu hơn.

### 2\. Opinionated CSS Resets

`Opinionated CSS Resets` là gì? Ở đây có 2 ý, Opinionated có nghĩa bạn có thể sử dụng cái này hoặc không. Còn CSS Resets là tập hợp các quy tắc của CSS dùng để chuẩn hoá các kiểu `DOM Element` trên các trình duyệt.

CSS Resets đã đi một chặng đường dài. Trong phiên bản này của Boostrap, `CSS Reset Stylesheet` được gọi là Reboot.

`Reboot` đã làm một vài điều khác. Nó dựa trên việc chuẩn hoá. Nó tránh `margin-top,` bao bọc giá trị `CSS inherit`, sử dụng đơn vị REM nhiều hơn, và bao gồm việc sử dụng ngăn xếp phông chữ gốc để hiển thị văn bản tối ưu hơn.

Mình khuyên bạn nên dành 10 phút để đọc về Reboot từ trang chủ [Boostrap](https://getbootstrap.com/docs/4.0/content/reboot/). Nó là một bài viết hữu ích.

## Bootstrap làm việc như thế nào?

Phần này hướng đến những người chưa có kinh nghiệm về cách thức hoạt động của Bootstrap. Bạn có thể bỏ qua điều này nếu bạn là một đã có kinh nghiệm về chúng.

Hãy bắt đầu nào!

Quy trình thông thường đễ tạo ra một trang web cơ bản diễn ra như sau:

1.  Viết HTML
2.  Trang trí thêm cho văn bản bằng cách sử dụng CSS.

Chúng ta hãy cùng thử làm điều đó:

Hãy viết một đoạn HTML cơ bản dưới đây:

```javascript

<pre class="wp-block-preformatted"><span id="d53824ef-c7c2-4c1d-91ff-2379eced246e"><span id="d24e11b3-226c-49dd-8ab4-5ab50ef2babc"><span id="3c5165a4-f520-46a8-81f1-10aa224f5620"><h1>Hello World</h1>  
<h2>Hi, there. Hello again</h2>  
<a href="example.com">Link to my website</a></span></span></span></pre>

```

Đoạn mã phía trên có 2 thẻ header và 1 thẻ a. Dưới đây là kết quả khi chúng ta thấy nó trên browser.

![Bootstrap 4 và những điều chúng ta cần biết](https://res.cloudinary.com/djeghcumw/image/upload/v1554021642/blog/Bootstrap%204.png)

Đây là kết quả xuất hiện trên browser.

Nó hiện ra những thứ chính xác như bạn kì vọng, nhưng kết qủa tiếp tục cho một sự thật thú vị. Hãy đào sâu vào lý do tại sao điều này lại quan trọng như vậy.

Hãy nhìn vào kết quả bên trên. Thẻ h1 hiển thị với kích thước lớn hơn thẻ h2, và thẻ a hiển thị với màu xanh mặc định.

Bạn có thấy rằng chúng ta đã có được nó nhưng không cần viết bất kì dòng code CSS nào không?

Tại sao?

Đây là kết quả mặc định của Browser's styles.

Làm thể nào để chúng ta có thể ngăn chặn những sự hiển thị mặc định này?

Thật đơn giản. Bạn có thể viết đè lên file CSS của browser theo cách riêng của bạn như sau.

Ví dụ

```javascipt
h1 {  
  color: blue  
}

a {  
  color: black  
}
```

Ở đây, chúng ta đã cho thẻ H1 thành màu xanh, và thẻ a thành màu đen.

![Bootstrap 4 và những điều chúng ta nên biết](https://res.cloudinary.com/djeghcumw/image/upload/v1554142191/blog/Screen_Shot_2019-04-02_at_1.09.34_AM.png)

Và đây là kết quả, điều này thật đơn giản.

### Vậy nó thật sự hoạt động như thế nào?

Mỗi trang web, phong cách tổng thể của chúng bị ảnh hưởng tới các kiểu mặc định của browser, các framework như Boostrap và phong cách viết CSS của riêng bạn.

Đừng lo lắng nếu bạn không hiểu nó bây giờ, mình sẽ cho bạn 1 ví dụ.

Giả sử mình viết một thư viện CSS có tên là `Red.` `Red` chỉ làm một điều, nó sẽ mang lại cho trang web của mình một màu nền đỏ đậm.

Ở một nơi nào đó trong thư viện , mình sẽ viết một đoạn mã như này.
```javascript
.red {
background-color: red
}
```
Làm thế nào để bạn sử dụng thư viện `red` vào trang web của bạn?

Đơn giản, bạn chỉ việc thêm class `.red` vào bất kì phần kì phần tử nào mà bạn muốn nó có màu như vậy.

Ví dụ:

    <!--- this is my awesome HTML document -->
    <body class="red">
      This is my awesome site
    </body>

Vậy là bạn đã có một thư viện CSS!

Về mặt kỹ thuật, đây là cách mà Bootstrap làm việc. Tương tự như vậy, thư viện Bootstrap có một tệp CSS khổng lồ với rất nhiều lớp tiện ích, mô-đun đáp ứng các tính năng CSS chung.

## CÀI ĐẶT BOOTSTRAP

Có 2 cách để bạn làm việc này và bạn có thể tìm hiểu chúng ở [đây.](https://v4-alpha.getbootstrap.com/getting-started/download/#package-managers)

Để cài đặt một cách đơn giản nhất, mình sẽ sử dụng `cdn.`

### Vậy CDN là gì?

CDN được viết tắt của Content Delivery Network.

Một cách đơn giản để giải thích cho các bạn hiểu. Bạn hãy tưởng tượng bạn đang muốn order muốn cuốn sách tại Tiki. Đơn hàng của bạn đã được Tiki xác nhận và xử lý thành công. Nhưng thật không may, Tiki nhận thấy bạn đang sống ở Huế, một nơi thật sự cách xa nhà kho chính của họ.

May mắn thay, Tiki có một mạng lưới rộng lớn các kho phân phối trên toàn Việt Nam.

Bây giờ, Tiki sẽ quyết định tìm kho nào gần nhà của bạn nhất và giao cuốn sách cho bạn từ kho đó. Và đó là lý do Tiki có thể giao hàng cho bạn trong vòng 2 giờ.

Và đó cũng là cách mà `CDN` làm việc. `CDN`giống như một nhà kho lưu trữ các thư viện phổ biến như Bootstrap.

Nếu bạn truy cập trang web có liên kết đến `CDN`. Trình duyệt sẽ tải một phiên bản cache của thư viện. Đây là phiên bản "được lưu trữ" trong bộ nhớ trình duyệt của bạn. Nếu nó không tìm thấy, nó sẽ đưa ra yêu cầu lấy tài nguyên mà nó muốn.

Khi bạn tải tài nguyên từ `CDN` sẽ có lợi thế rằng, bạn sẽ nhận được tài nguyên một cách nhanh hơn.

Phía dưới là link Bootstrap CDN

```javascript
https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous"
```
Ví dụ , để thêm nó vào file HTML của bạn, ta thêm đoạn code vào phần header trong file HTML của bạn.
```javascript
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
```
## Bootstrap tạo ra sự khác biệt gì?

Trong phần này, chúng ta sẽ tiếp tục thiết lập một trang web demo cơ bản với Bootstrap. Đối với bản demo này, mình sẽ sử dụng codepen.io

Thêm Boostrap v4 vào project vô cùng đơn giản. Bạn click vào CSS Pen Setting, và thêm Boostrap vào.

![Bootstrap 4 và những điều nên biết](https://res.cloudinary.com/djeghcumw/image/upload/v1554025152/blog/Screen_Shot_2019-03-31_at_4.38.24_PM.png)

Okay, vậy thật sự Boostrap tạo ra sự khác biệt gì?

![Bootstrap 4 và những điều nên biết](https://res.cloudinary.com/djeghcumw/image/upload/v1554142124/blog/Screen_Shot_2019-04-02_at_1.08.04_AM.png)</figure>

Chúng ta tiếp tục với ví dụ `Hello World` mà chúng ta đã thảo luận ở mục trước. Hãy nhìn kết quả phía bên trên.

Một sự khác biệt hoàn toàn lớn. Từ kết quả phía bên, bạn có thấy được một số style Boostsrap mặc định mà nó đã viết đè lên trình duyệt.

Bây giờ, font chữ đã hoàn toàn khác, khoảng cách giữa mỗi khối chữ đã thay đổi và thẻ a đã có một phong cách hiển thị hoàn toàn khác.

Bootstrap đã thực sự làm việc.

Và bây giờ, mình chắc chắn bạn đã hiểu cơ chế làm việc của thư viện CSS một cách nói chung.

## Tạm kết ở phần 1

Ở phần này, chúng ta đã trả lời được câu hỏi Bootstrap là gì? Cách thức nó hoạt động như nào? Và một số vấn đề xoay quay nó.

Phần tiếp theo, mình sẽ giới thiệu cho các bạn những thuộc tính cơ bản trong Bootstrap mà bạn nên biết. Cám ơn các bạn đã theo dõi!

## Tài liệu tham khảo

[https://medium.freecodecamp.org/bootstrap-4-everything-you-need-to-know-c750991f6784](https://medium.freecodecamp.org/bootstrap-4-everything-you-need-to-know-c750991f6784)