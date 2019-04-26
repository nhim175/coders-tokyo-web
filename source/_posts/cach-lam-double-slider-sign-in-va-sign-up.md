---
title: Cách làm một double slider Sign-in và Sign-up Form
date: 2019-04-26 20:00:00
authorId: hoang_an
tags:
---
![Cách làm một double slider Sign-in và Sign-up Form](https://res.cloudinary.com/djeghcumw/image/upload/v1554896320/blog/0_6-JxbwsPgUN6VvBZ.gif)

Chắc hẳn bạn đã và đang sử dụng Facebook, Google, Twitter, Coders Tokyo,.. thì việc tạo tài khoản để login vào hệ thống là đều hay diễn ra. Và hầu như trong số các bạn ít khi quan tâm đến cái khung sign in/sign up trông nó ra sau, nó không ấn tượng với bạn lắm nhỉ, vì suy cho cùng bạn chỉ cần nhớ username và password thôi là đủ rồi 😄

Nhưng để một trang web gây ấn tượng với bạn khi mới lần đầu “gặp gỡ” thì việc xây dựng một giao diện sign in/sign up thân thiện hơn và trải nghiệm tốt hơn là đều khá cần thiết đấy chứ 😉

Dưới đây là thành quả mà bạn sẽ làm được khi xem xong bài viết này.
<!-- more -->
![Cách làm một double slider Sign-in và Sign-up Form](https://res.cloudinary.com/djeghcumw/image/upload/v1554896320/blog/0_6-JxbwsPgUN6VvBZ.gif)

## Mô tả cái chúng ta sắp làm

Trước khi chúng ta đi vào code luôn, tôi có chút chia sẻ nhỏ những thứ mà chúng ta sẽ có trong bài này. Điều này sẽ giúp nhiều vì có thể giúp bạn hiểu những dòng code một cách rõ ràng hơn.

Chúng ta sẽ có 4 component bên trong một container lớn:

*   Biểu mẫu đăng nhập (The **Sign In** Form)
*   Mẫu đăng ký (The Sign Up Form)
*   Lớp phủ đăng nhập (The **Sign In** Overlay)
*   Lớp phủ đăng ký (The Sign Up Overlay)

Ngoài ra, tại một thời điểm bạn có thể thấy:  

*   **Sign In** cùng với Sign Up Overlay
*   Sign Up cùng với **Sign In** Overlay

Trong overlay, chúng tôi có một số `text` và một `button`. Bằng cách nhấp vào nó, bạn sẽ chuyển qua lại giữa 2 bảng **Sign In** và Sign Up Xem lại GIF ở trên một lần nữa để xem ý tôi là gì nha.

## Giải thích về chuyển động của The Overlay

Chỗ này có thể phức tạp chút, nhưng tôi sẽ cố hết sức để giải thích để bạn có thể hiểu logic đằng sau nó.  

Tôi có các `layer` sau cho các overlay:  

**The overlay-container** - phần này xem khu vực hiển thị (nhiều hơn ở phần bên dưới) tại một thời điểm nhất định. Nó có chiều rộng bằng 50% tổng chiều rộng của container.  

**The overlay** - div này có kích thước chiều rộng gấp đôi (200%), do đó, nó chiếm toàn bộ chiều rộng của container chính. (200% * 50% = 100%. 50% là từ `container .overlay` ở trên).  

**The overlay-panels** - là các div đang giữ nội dung thực tế (text và button) mà chúng ta thấy trên màn hình. Cả hai đều có `position` là `absolute`. Chúng ta có thể định vị chúng bất cứ nơi nào chúng ta muốn trong thành phần `.overlay`. Một trong những panel được đặt ở `left` và panel còn lại được đặt ở `right`. Cả hai đều có chiều rộng bằng 50% component `.overlay`  

## Dùng 3 layer

Tại sao chúng ta cần 3 layer? Chà, hãy để xem nó trông như thế nào nếu không có layer đầu tiên:

![Cách làm một double slider Sign-in và Sign-up Form](https://res.cloudinary.com/djeghcumw/image/upload/v1554896339/blog/0_xbuYkIKyX8a5IlhY.png)

Trong hình trên, bạn có thể thấy rằng cả hai panel đều có thể nhìn thấy được, đó không phải là thứ chúng ta muốn. Đây là lý do tại sao tôi thêm 1 layer `.overlay-container` để nó hoạt động như một “khu vực tập trung” của layer khác. Điều này cho phép chúng ta ẩn panel đang tràn ra hoặc nằm ngoài ranh giới của nó. Đây là lý do tại sao tôi cần `.overlay` to gấp đôi `.overlay-container`. Bằng cách di chuyển xung quanh `.overlay-container`, cũng có `position: absolute`, chúng ta có thể ẩn hoặc hiển thị bảng nào chúng ta muốn.  

Có thể nó hơi khó hiểu thật, tôi thừa nhận điều đó 😁, nhưng tôi hy vọng sẽ làm cho nó rõ ràng hơn nhất có thể.  

## Giải thích về chuyển động của Form

Những điều này không khó hiểu chút nào. Về cơ bản, chúng ta lại có hai container `.form-container`. Mỗi cái có chiều rộng 50% và `position: absolute`. Tôi di chuyển cả hai cùng một lúc từ trái sang phải. Khi chúng ở phía sau component `.overlay` từ phía trên (trong khi chúng đang di chuyển), tôi sẽ nhanh chóng thay đổi `z-index`. The Sign Up From (ví dụ) sẽ di chuyển lên trên The **Sign In** From và ngược lại. Bạn thấy nó vi diệu chưa 😁 phía sau đó là những dòng code logic.

## Viết HTML trước nhé

Bây giờ tôi đã chia nhỏ "chức năng" cốt lõi của animation, đã đến lúc xem code HTML thực tế. Hãy bắt đầu với “bộ xương” cơ bản:

```html
<div class="container" id="container">
    <div class="form-container sign-up-container">
        <!-- Sign Up form code goes here -->
    </div>
    <div class="form-container sign-in-container">
        <!-- Sign In form code goes here -->
    </div>
    <div class="overlay-container">
        <!-- The overlay code goes here -->
    </div>
</div>
```

Div chính có `class` là`.container` và cũng là`id` của `container` vì chúng tôi muốn nhắm mục tiêu phần tử này trong JavaScript (nói nhiều hơn về điều này bên dưới). 😉

## Phần Form Đăng Ký

```html
<div class="form-container sign-up-container">
    <form action="#">
        <h1>Create Account</h1>
        <div class="social-container">
            <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
            <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
            <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
        </div>
        <span>or use your email for registration</span>
        <input type="text" placeholder="Name" />
        <input type="email" placeholder="Email" />
        <input type="password" placeholder="Password" />
        <button>Sign Up</button>
    </form>
</div>
```

## Phần Form Đăng Nhập

```html
<div class="form-container sign-in-container">
    <form action="#">
        <h1>Sign in</h1>
        <div class="social-container">
            <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
            <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
            <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
        </div>
        <span>or use your account</span>
        <input type="email" placeholder="Email" />
        <input type="password" placeholder="Password" />
        <a href="#">Forgot your password?</a>
        <button>Sign In</button>
    </form>
</div>
```

Chúng tôi cũng có một vài class trên mỗi thẻ div:  

*   Class `.form-container` sẽ chứa CSS được sử dụng cho cả hai class `.sign-in-container` và`.sign-up-container`
*   2 class khác nhau (đã đề cập ở trên) sẽ chứa CSS khác nhau.

Bằng cách này, tôi tránh phải viết cùng một mã CSS hai lần và tôi sử dụng cho nhiều class  
Bạn cũng có thể nhận thấy rằng các thẻ `i` có một số class. Điều này là do tôi đang sử dụng [FontAwesome](https://fontawesome.com/?from=io) cho các biểu tượng. Đọc thêm về họ trên trang web của họ.

## Phần Lớp phủ Container

```html
<div class="overlay-container">
    <div class="overlay">
        <div class="overlay-panel overlay-left">
            <h1>Welcome Back!</h1>
            <p>To keep connected with us please login with your personal info</p>
            <button class="ghost" id="signIn">Sign In</button>
        </div>
        <div class="overlay-panel overlay-right">
            <h1>Hello, Friend!</h1>
            <p>Enter your personal details and start journey with us</p>
            <button class="ghost" id="signUp">Sign Up</button>
        </div>
    </div>
</div>
```

Tương tự như trên, chúng ta có class chung `.overlay-panel` và hai class khác nhau: `.overlay-left` và `.overlay-right`. Ngoài ra, tôi có các `id` cho các button vì tôi sẽ sử dụng onClick `eventListener` trong `JavaScript` cho cả hai.

## Giờ viết JavaScript trước nhỉ !?

Thông thường, tôi viết CSS trước khi viết JS, nhưng lần này sẽ dễ dàng hiển thị và giải thích code JavaScript hơn. Nó sẽ giúp bạn hiểu code CSS được viết dưới đây.

```javascript
const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
    container.classList.add('right-panel-active');
});

signInButton.addEventListener('click', () => {
    container.classList.remove('right-panel-active');
});
```

Như đã giải thích ở trên, tôi thêm `addEventListener`. Khi các button được click, tôi sẽ `add` hoặc `remove` class `.right-panel-active` (không phải là tên tốt nhất cho class, nhưng đó là tên tốt nhất tôi có được tại thời điểm này)😆. Class này sẽ được sử dụng để định dạng các thành phần con khác nhau khi chúng ta có hai màn hình.

## Giờ tới viết CSS thôi !

Đầu tiên, chúng ta viết CSS chung cho các thành phần cơ bản:

```css
h1 {
    font-weight: bold;
    margin: 0;
}

p {
    font-size: 14px;
    font-weight: 100;
    line-height: 20px;
    letter-spacing: 0.5px;
    margin: 20px 0 30px;
}

span {
    font-size: 12px;
}

a {
    color: #333;
    font-size: 14px;
    text-decoration: none;
    margin: 15px 0;
}

button {
    border-radius: 20px;
    border: 1px solid #ff4b2b;
    background-color: #ff4b2b;
    color: #ffffff;
    font-size: 12px;
    font-weight: bold;
    padding: 12px 45px;
    letter-spacing: 1px;
    text-transform: uppercase;
    transition: transform 80ms ease-in;
}

button:active {
    transform: scale(0.95);
}

button:focus {
    outline: none;
}

button.ghost {
    background-color: transparent;
    border-color: #ffffff;
}

form {
    background-color: #ffffff;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    padding: 0 50px;
    height: 100%;
    text-align: center;
}

input {
    background-color: #eee;
    border: none;
    padding: 12px 15px;
    margin: 8px 0;
    width: 100%;
}

.social-container {
    margin: 20px 0;
}

.social-container a {
    border: 1px solid #dddddd;
    border-radius: 50%;
    display: inline-flex;
    justify-content: center;
    align-items: center;
    margin: 0 5px;
    height: 40px;
    width: 40px;
}
```

### Lưu ý số 1

*   Tôi đang viết CSS trực tiếp cho các phần tử (h1, p, a). Thông thường, bạn sẽ không làm điều đó vì nó có thể bị lẫn lộn đó,  vì vậy tốt hơn là thêm class cho mỗi kiểu. Nhưng với ví dụ này, nó hoạt động tốt vì tôi chỉ viết cho 1 trang này thôi.
*   Tôi có một chút thay đổi trên button.  Khi nhấp vào, button sẽ nhỏ hơn một chút. Hiệu ứng nhấp chuột đẹp và đơn giản mà tôi hay dùng nè.
*   `Form` là một `flex` container vì tôi muốn tập trung mọi thứ vào bên trong nó và thật dễ dàng để làm điều đó với flexbox. Bạn sẽ thấy bên dưới nó được sử dụng một vài lần nữa.

CSS cho `.container`:

```css
.container {
    background-color: #ffffff;
    border-radius: 10px;
    box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
    position: relative;
    overflow: hidden;
    width: 768px;
    max-width: 100%;
    min-height: 480px;
}
```

*   `position: relative` bởi vì chúng ta sẽ có các phần tử `position: absolute` (giải thích tại sao thì ở trên ấy).
*   `overflow: hidden` bởi vì tôi đã đặt một `border-radius` và tôi không muốn các phần tử con bị phá vỡ và được hiển thị bên ngoài `.container`.

Bây giờ là phần thú vị, `.form-container` và các styles liên quan:

```css
.form-container {
    position: absolute;
    top: 0;
    height: 100%;
    transition: all 0.6s ease-in-out;
}

.sign-in-container {
    left: 0;
    width: 50%;
    z-index: 2;
}

.sign-up-container {
    left: 0;
    width: 50%;
    opacity: 0;
    z-index: 1;
}

.container.right-panel-active .sign-in-container {
    transform: translateX(100%);
}

.container.right-panel-active .sign-up-container {
    transform: translateX(100%);
    opacity: 1;
    z-index: 5;
    animation: show 0.6s;
}

@keyframes show {
    0%,
    49.99% {
        opacity: 0;
        z-index: 1;
    }
    50%,
    100% {
        opacity: 1;
        z-index: 5;
    }
}
```

### Lưu ý số 2  

*   `animation` (`show`) chịu trách nhiệm thay đổi `z-index` của `.form-container` như đã nói ở trên. Đi từ `z-index: 1` là  `0-49,99%` và `z-index: 5` là  `50-100%`. Những phạm vi này được sử dụng bởi vì tôi muốn chúng thay đổi nhanh chóng.
*   Tôi sử dụng class `.right-panel-active` để di chuyển xung quanh `.form-container` khi các button được click.

Và cuối cùng, CSS cho `.overlay-container` và các styles liên quan:

```css
.overlay-container {
    position: absolute;
    top: 0;
    left: 50%;
    width: 50%;
    height: 100%;
    overflow: hidden;
    transition: transform 0.6s ease-in-out;
    z-index: 100;
}

.container.right-panel-active .overlay-container {
    transform: translateX(-100%);
}

.overlay {
    background: #ff416c;
    background: -webkit-linear-gradient(to right, #ff4b2b, #ff416c);
    background: linear-gradient(to right, #ff4b2b, #ff416c);
    background-repeat: no-repeat;
    background-size: cover;
    background-position: 0 0;
    color: #ffffff;
    position: relative;
    left: -100%;
    height: 100%;
    width: 200%;
    transform: translateX(0);
    transition: transform 0.6s ease-in-out;
}

.container.right-panel-active .overlay {
    transform: translateX(50%);
}

.overlay-panel {
    position: absolute;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    padding: 0 40px;
    text-align: center;
    top: 0;
    height: 100%;
    width: 50%;
    transform: translateX(0);
    transition: transform 0.6s ease-in-out;
}

.overlay-left {
    transform: translateX(-20%);
}

.container.right-panel-active .overlay-left {
    transform: translateX(0);
}

.overlay-right {
    right: 0;
    transform: translateX(0);
}

.container.right-panel-active .overlay-right {
    transform: translateX(20%);
}
```

*   `.overlay` có nền gradient, tôi đã sử dụng UI Gradents để lấy nó
*   `.overlay-left` và `.container .right-panel-active .overlay-right` có translation là `-20%` và `20%` trên trục X. Điều này là do tôi muốn thêm một chút hiệu ứng vào text khi nó được hiển thị như thể nó đến từ bên ngoài (sắp xếp)

Uầy, cuối cùng cũng làm xong rồi (^^)  

## Kết luận lại

Bài này hơi khó về animation, phải không? Tuy nhiên, tôi hy vọng bạn đã học được điều gì đó từ nó.

Bạn không quên rằng bạn cũng có thể làm được những thứ này từ những khoá học trên Coders Tokyo.  

Cảm ơn bạn đã dành thời gian đọc, tôi hy vọng rằng bạn đã học được điều gì đó mới!

### Tài liệu tham khảo
[https://medium.freecodecamp.org/how-to-build-a-double-slider-sign-in-and-sign-up-form-6a5d03612a34](https://medium.freecodecamp.org/how-to-build-a-double-slider-sign-in-and-sign-up-form-6a5d03612a34)
[https://codepen.io/FlorinPop17/full/vPKWjd](https://codepen.io/FlorinPop17/full/vPKWjd)
