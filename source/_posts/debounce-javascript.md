---
title: Tối ưu với Debounce?
date: 2019-06-15 22:00:00
authorId: chau_tran
tags: javascript, debounce, optimization
---

![Debounce](http://image.slidesharecdn.com/slides-140813225923-phpapp01/95/throttle-and-debounce-patterns-in-web-apps-55-638.jpg)

Khi các bạn "dạo quanh" các ứng dụng (web, mobile, .v.v...), các bạn có để ý bắt gặp phải một `input` mà khi bạn type vào, bạn phải chờ một chút thì mới có gì đó xảy ra không? Đại loại như ví dụ sau:

<!-- more -->

![debounce-in-action](https://cdn-images-1.medium.com/max/1600/1*aNqkqLafqoI9FIHcwubqaA.gif)

Thực sự thì đây không phải là ứng dụng bị chậm hay lỗi gì đâu nhé 😁. Đây gọi là, `Debounce`, một kỹ thuật được áp dụng rộng rãi để tối ưu hóa performance của ứng dụng bằng cách giảm thiểu số lần ứng dụng phải xử lý những sự kiện (**event**) mang tính *liên tục*. Để tiếp nối những **kỹ thuật tối ưu hóa cơ bản**, thì hôm nay mình sẽ giới thiệu với các bạn kỹ thuật `Debounce`.

# 1. Debounce là gì?

`Debounce` là một hàm bậc cao (**high-order function**) dùng để làm trì hoãn việc xử lý `event` nào đó cho đến khi không có `event` nào được emitted (**bắn**) ra trong một khoản thời gian (**delay**) đã được định trước. `Debounce` có một *người bà con* là `Throttle`. `Debounce` thường được áp dụng cho: `Autocomplete`, `Typeahead` hoặc `Filter input` kèm với những sự kiện như: `keyup` và `change`. Còn `Throttle` thường được áp dụng cho những sự kiện liên quan đến `mousemove`. Nhưng bài viết này là nói đến `Debounce` mà 😜, `Throttle` thì hẹn lần sau nhe. 

Tại sao lại phải hoãn việc xử lý `event` lại? Phần lớn, xử lý những sự kiện từ `input` thường liên quan đến gọi `API` (**network**) hoặc xử lý mảng (**array**). Nếu như những tác vụ (**operation**) này tốn nhiều tài nguyên và thời gian của ứng dụng, và mỗi một sự kiện từ `input` (`keyup` chẳng hạn) đều *bật đèn xanh* cho các tác vụ này thì các bạn nghĩ là ứng dụng mình có bị chậm đi không? Ví dụ: các bạn muốn lọc (**filter**) các `users` có chữ: `tran` trong tên của họ, thì chắc chắn các bạn chỉ muốn ứng dụng mình quan tâm đến chữ `tran` thôi. Nếu như không có `debounce`, thì ứng dụng sẽ quan tâm đến cả `t`, `tr`, `tra` rồi mới đến `tran`. Rốt cuộc là mình lãng phí mất 3 lần xử lý không cần thiết rùi 😥, chưa kể đến việc `race-condition` (**hiện tượng out of sync, kết quả về trước về sau**) rất là khó `debug` và dễ dẫn đến *xì-trét* lắm. Và `Debounce` sẽ giúp bạn xã 1 số *xì-trét* không đáng có 😎

# 2. Debounce trông như thế nào trong JavaScript?

Mình dùng `JavaScript` để mô tả cho các bạn nắm được nguyên lý cơ bản của `debounce` nhé. Những ngôn ngữ khác vẫn có thể áp dụng nhé. Về cơ bản, thì một hàm `debounce` nhìn sẽ như sau:

```javascript
// Credit từ David Walsh: https://davidwalsh.name/javascript-debounce-function

// debounce sẽ return fn và fn sẽ không chạy cho đến khi debounce không được thực thi
// trong khoản thời gian delay. Nếu immediate là true, thì fn sẽ được thực thi ngay lặp tức
// rồi mới được debounced cho những lần tiếp theo.
function debounce(fn, delay, immediate) {
    let timeout;
    
    return function executedFn() {
        let context = this; // "this" context của executedFn
        let args = arguments; // "arguments" của fn
        
        let later = function() {
            timeout = null;
            if (!immediate) fn.apply(context, args);
        };
        
        let callNow = immediate && !timeout;
        
        clearTimeout(timeout);
        
        timeout = setTimeout(later, delay);
        
        if (callNow) fn.apply(context, args);
    }
}
```

Như đã được đề cập ở đầu bài, `debounce` là một `High-order function` sẽ return 1 `function`. Việc này nhằm để tạo nên 1 `closure` cho các tham số của debounce: `fn`, `delay` và `immediate`; và biến cục bộ (**local variable**) `timeout`.

- `fn`: Đây là `function` mà các bạn muốn hoãn (**debounced**)
- `delay`: Đây là thời gian các bạn muốn trì hoãn (vì `delay` sẽ được dùng cho `setTimeout` nên có đơn vị là `ms` nha)
- `immediate`: Đây là một tham số `boolean`. Tham số này, nếu `true`, thì `fn` sẽ được thực thi ngay lặp tức ở lần đầu tiên và được `delay` cho nhừng lần kế tiếp.
- `timeout`: Đây là biến cục bộ của `debounce` để giữ tham chiếu (**reference**) đến với `setTimeout`, để có thể `clearTimeout` và tạo 1 `setTimeout` mới khi `debounce` được thực thi khi thời gian `delay` vẫn chưa chạy xong.

Sau đây là cách áp dụng:

```javascript
const input = document.getElementById('filterInput');

const keyUpHandler = event => {
    // do something with event
};

const debouncedKeyUp = debounce(keyUpHandler, 500); 

input.addEventListener('keyup', debouncedKeyUp);
```
Ở ví dụ này, mình sẽ `debounced` `keyUpHandler` `500ms`. Nghĩa là, nếu như `input` này được type liên tục và `debouncedKeyup` sẽ được thực thi khi người dùng ngừng type trong vòng `500ms`. Để hiểu rõ hơn, mình sẽ viết lại block của hàm `debounce` phía trên kèm theo comment nhé:
```javascript
// Credit từ David Walsh: https://davidwalsh.name/javascript-debounce-function

// debounce sẽ return fn và fn sẽ không chạy cho đến khi debounce không được thực thi
// trong khoản thời gian delay. Nếu immediate là true, thì fn sẽ được thực thi ngay lặp tức
// rồi mới được debounced cho những lần tiếp theo.
function debounce(fn, delay, immediate) {
    let timeout;
    
    // Đây là function sẽ được thực thi khi debouncedKeyUp được thực thi ở ví dụ trên
    return function executedFn() {
        // Mình save lại this vào biến context
        let context = this; // "this" context của executedFn
        
        // Save lại arguments vào args. Trong JS, arguments giữ giá trị của tất cả tham số được truyền vào cho một function.
        // Cho dù bạn không khai báo tham số cho một hàm, thì khi truyền tham số vào cho hàm đó, các bạn vẫn có thể truy xuất
        // đến các tham số bằng biến arguments này. Theo ví dụ trên, thì arguments ở đây sẽ chứa "event" 
        let args = arguments; // "arguments" của fn
        
        // Function later này sẽ được gọi sau khi delay được chạy xong. 
        // Nghĩa là mình return executedFn, khi executedFn được thực thi thì sau khoản delay, later sẽ được thực thi.
        let later = function() {
            // Gán null cho timeout => cho thấy delay đã chạy xong
            timeout = null;
            
            // Gọi hàm fn với apply
            if (!immediate) fn.apply(context, args);
        };
        
        // Xác định xem nên gọi fn dựa vào tham số immediate
        let callNow = immediate && !timeout;
        
        // Dòng clearTimeout sẽ reset timeout đang hiện hữu (**existed**). Đây là điều cần thiết, 
        // vì mình cần hủy timeout và tạo 1 timeout mới nếu như debounce được thực thi khi 
        // delay chưa chạy xong.
        clearTimeout(timeout);
        
        // Khởi tạo (lại) timeout mới và gán vào biến timeout để có thể clear/check.
        timeout = setTimeout(later, delay);
        
        // Nếu như immediate là true, thì mình sẽ gọi fn lần đầu tiên ở đây.
        if (callNow) fn.apply(context, args);
    }
}
```

Ngoài những sự kiện `keyboard` thì `debounce` cũng còn được áp dụng cho `resize` và `scroll` nữa. Nhưng tùy trường hợp mà devs có thể dùng `debounce` hoặc `throttle` cho `resize` và `scroll`.

# 3. Áp dụng Debounce trong Modern JS

Ở mục 2, tuy là lý thuyết, nhưng sự thật thì bạn có thể dùng hàm `debounce` ở trên để áp dụng vào ứng dụng `JavaScript` của bạn. Nhưng thiệt tình mà nói thì ít ai mà áp dụng tay như vậy lắm 😋. Nhân đây, mình sẽ giới thiệu 3 cách áp dụng khác nhau:

1. `lodash debounce`
2. `React hooks`
3. `Angular RxJS`

Note: Mình không dùng `VueJS` nên không có ví dụ nào cả 😶

### Lodash Debounce
Nói cho sang vậy thôi chứ cách này vô cùng dễ. Các bạn chỉ cần `npm install lodash` (hoặc `yarn add lodash`). Sau đó thì code thôi.


<div class="iframe-container">
<iframe src="https://codesandbox.io/embed/intelligent-goldstine-n999u" style="width:100%; height:500px; border:0; border-radius: 4px; overflow:hidden;" sandbox="allow-modals allow-forms allow-popups allow-scripts allow-same-origin"></iframe>
</div>

### React Hooks
Kế tiếp, mình sẽ áp dụng `debounce` vào `React` bằng: `useEffect` nhé.

```jsx harmony
function useDebounce(text, delay) {
  delay = delay || 500;
  const [debounced, setDebounced] = useState(text);

  useEffect(() => {
    const handler = setTimeout(() => {
      setDebounced(text);
    }, delay);

    return () => {
      clearTimeout(handler);
    };
  }, [text, delay]);

  return debounced;
}

function App() {
  const [val, setVal] = useState("Hello Codesandbox");
  const [title, setTitle] = useState("Hello Codesandbox");
  const debouncedVal = useDebounce(val);

  useEffect(() => {
    if (debouncedVal) {
      setTitle(debouncedVal);
    }
  }, [debouncedVal]);

  return (
    <div className="App">
      <h1>{title}</h1>
      <h2>Try typing then stop for 0.5s</h2>
      <input
        type="text"
        value={val}
        onChange={({ target }) => setVal(target.value)}
      />
    </div>
  );
}
```
Các bạn để ý thì mình áp dụng như là hàm `debounce` ở trên mục 2 trên kia á nhưng mình áp dụng `useEffect` để lặp đi lặp lại logic clear/reset timeout dựa vào `text` có thay đổi hay không. Điều này cho mình "hiệu ứng" tương tự như hàm `debounce()` trên kia.

<div class="iframe-container">
<iframe src="https://codesandbox.io/embed/react-use-debounce-0hw7p" style="width:100%; height:500px; border:0; border-radius: 4px; overflow:hidden;" sandbox="allow-modals allow-forms allow-popups allow-scripts allow-same-origin"></iframe>
</div>

### Angular RxJS `debounceTime`

Cuối cùng, mình sẽ áp dụng `debounce` bằng 1 operator tên là `debounceTime` trong `Angular` nhé.

```typescript
import { Component, ViewChild, ElementRef } from "@angular/core";
import { fromEvent } from "rxjs/observable/fromEvent";
import { debounceTime, map } from "rxjs/operators";

@Component({
  selector: "app-root",
  template: `
    <div style="text-align:center">
      <h1>Welcome to {{ title }}!</h1>
      <p>Try typing then stop for 0.5s</p>

      <input type="text" #someInput />

      <p>{{ value }}</p>
    </div>
  `,
  styleUrls: ["./app.component.css"]
})
export class AppComponent {
  @ViewChild("someInput", { static: true }) someInput: ElementRef<HTMLInputElement>;

  title = "CodeSandbox";
  value = "";

  ngOnInit() {
    fromEvent(this.someInput.nativeElement, "keyup")
      .pipe(
        debounceTime(500),
        map((event: any) => event.target.value)
      )
      .subscribe(val => {
        this.value = val;
      });
  }
}
```

Ở đây, mình dùng `template variable #someInput` và dùng `ViewChild` để tham chiếu đến `input` này. Sau đó, dùng `fromEvent` để chuyển sự kiện `keyup` từ `input` này thành 1 `stream` và áp dụng `debounceTime` lên dòng sự kiện `keyup` này. 

<div class="iframe-container">
<iframe src="https://codesandbox.io/embed/angular-h5dru" style="width:100%; height:500px; border:0; border-radius: 4px; overflow:hidden;" sandbox="allow-modals allow-forms allow-popups allow-scripts allow-same-origin"></iframe>
</div>

Các bạn có thể thử code ở các codesandbox được đính kèm nhé.

Hy vọng các bạn thấy `debounce` có ích và mình giải thích đủ để các bạn hiểu và áp dụng vào ứng dụng của mình. Tối ưu hóa everything 😎😎

Chúc các bạn may mắn và vui vẻ 😁
