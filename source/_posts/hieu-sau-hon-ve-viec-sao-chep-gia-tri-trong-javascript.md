---
title: Hiểu sâu hơn về việc sao chép giá trị trong Javascript
date: 2019-03-18 07:00:00
authorId: thai_son
tags:
---
![Sao chép giá trị trong Javascript](https://res.cloudinary.com/djeghcumw/image/upload/v1551847967/blog/Webp.net-resizeimage.jpg)


Sự mới mẻ luôn luôn là điều tốt!


Trước đây, chắc hẳn các bạn đã biết cách sao chép một giá trị trong [Javascript](https://coders.tokyo/2019/09/05/javascript-web-developer/), thậm chí nếu bạn không biết nó. Có thể bạn cũng đã nghe nói về mô hình lập trình chức năng mà bạn không nên sửa đổi bất kỳ dữ liệu hiện có nào. Để làm được điều đó, bạn phải biết cách sao chép các giá trị trong JavaScript một cách an toàn. Vậy hôm nay, chúng ta sẽ đi tìm hiểu làm thế nào để không mắc một trong các sai lầm đó!

<!-- more -->

Điều đầu tiên, vậy việc sao chép là gì?


Việc sao chép nghe đơn giản, nhưng không hẳn!. Khi bạn thực hiện thao tác thao chép, bạn phải làm cho bản gốc giữ nguyên giá trị.


Trong lập trình, chúng ta lưu trữ giá trị trong biến. Việc sao chép nghĩa là bạn khởi tạo một biến mới và có cùng giá trị với biến bạn muốn sao chép. Tuy nhiên có 2 vấn đề quan trọng cần xem xét, đó là: **Deep copying** và **Shallow copying**. **Deep copying** có nghĩa là tất cả giá trị của biến mới sẽ được sao chép và ngắt kết nối với biến ban đầu. **Shallow copying** có nghĩa là khi sao chép thì các giá trị đó vẫn còn được kết nối với biến ban đầu.


> _Để thực sự hiểu việc sao chép, bạn phải tìm hiểu cách [JavaScript](https://coders.tokyo/2019/09/05/javascript-web-developer/) lưu trữ các giá trị._


## Các kiểu dữ liệu căn bản <g class="gr_ gr_12 gr-alert gr_spell gr_inline_cards gr_run_anim ContextualSpelling ins-del multiReplace" id="12" data-gr-id="12">trong</g> Javascript


Các loại dữ liệu căn bản bao gồm:


*   **Number** --- Ví dụ : 1
*   **String** -- Ví dụ: 'Xin chào'
*   **Boolean** --Ví dụ: true
*   **undefined**
*   **null**


Khi bạn tạo ra các giá trị này, chúng sẽ liên hệ chặt chẽ với biến mà chúng được lưu trữ. Chúng chỉ tồn tại 1 lần. Điều đó có nghĩa rằng, bạn không phải thực sự lo lắng về việc sao chép các loại dữ liệu căn bản trong [JavaScript](https://coders.tokyo/2019/09/05/javascript-web-developer/). Khi bạn sao chép , nó sẽ là một bản copy thực sự. Hãy cũng xem ví dụ:
```javascript
    const a = 5
    let b = a // this is the copy


    b = 6


    console.log(b) // 6
    console.log(a) // 5
```
Khi thực hiện `b = a`, bạn sẽ thực hiện một phép gán giá trị từ a vào b. Bây giờ, khi bạn gán một giá trị mới cho b. Thì b sẽ thay đổi và a thì không.


## Các kiểu dữ liệu tổng hợp trong Javascript


*   **Array**
*   **Object**


Về mặt kỹ thuật, array cũng được xem như là một objet. Vì vậy chúng sẽ xử lý một cách giống nhau. Và chúng ta cùng đi vào chi tiết để hiểu rõ hơn nào!


Một điều thú vị. Các giá trị này thực sự được lưu trữ chỉ một lần khi được khởi tạo, và việc gán một biến chỉ tạo một con trỏ (tham chiếu) tới giá trị đó.


Bây giờ, nếu chúng ta thực hiện gán `b = a`, và thay đổi một số giá trị trong b. Và điều này bất ngờ nó cùng làm thay đổi giá trị ở a, vì a và b cùng trỏ đến chung một giá trị.
```javascript
    const a = {
      en: 'Hello',
      de: 'Hallo',
      es: 'Hola',
      pt: 'Olà'
    }
    let b = a
    b.pt = 'Oi'
    console.log(b.pt) // Oi
    console.log(a.pt) // Oi
```
Ở ví dụ trên, chúng ta thực sự đã thực hiện một **Shallow copy.** Điều này thực sự là một vấn đề nghiêm trọng, bởi vì chúng ta mong đợi biến ban đầu sẽ vẫn giữ nguyên giá trị của nó. Đôi khi chúng ta truy cập nó lại dẫn tới lỗi. Có thể, khi xảy ra trường hợp này rồi các bạn mới biết đó là lỗi. Thực sự, nhiều lập trình viên vẫn nghĩ đó vẫn không là lỗi cho đến khi xảy ra.


Bây giờ chúng ta cùng xem, làm thế nào để sao chép giá trị **Object và Array.**


## Object


Có rất nhiều cách để thực hiện sao chép một **Object,** đặc biệt với sự phát triển và mở rộng của kỹ thuật [Javascript](https://coders.tokyo/2019/09/05/javascript-web-developer/) mới.


### Spread operator


Được giới thiệu ở bản phiên ES2015, toán tử này là một điều hết sức thú vị, bởi vì cú pháp ngắn gọn và đơn giản. Nó truyền tải tất cả giá trị vào một đối tượng mới. Bạn có thể xem ví dụ dưới đây để xem cách sử dụng chúng.


    const a = {
      en: 'Bye',
      de: 'Tschüss'
    }
    let b = {...a}
    b.de = 'Ciao'
    console.log(b.de) // Ciao
    console.log(a.de) // Tschüss


Bạn cũng có thể dùng nó để hợp nhất hai object lại với nhau, ví dụ :


    const c = {...a, ...b}


### Object.assign


Cách này thường được dùng trước khi toán tử **Spread** phổ biến. Bạn phải thật cẩn thận, vì đối số đầu tiên trong phương thức Object.assign () phải được điều chỉnh và trả về. Thông thường bạn nên truyền vào {} trống để đảm bảo việc sao chép giá trị xảy ra một cách an toàn nhất.


    const a = {
      en: 'Bye',
      de: 'Tschüss'
    }
    let b = Object.assign({}, a)
    b.de = 'Ciao'
    console.log(b.de) // Ciao
    console.log(a.de) // Tschüss


### Cạm bẫy: Nested Objects


Như đề cập trước , có một cảnh báo lớn khi xử lý các đối tượng sao chép, xảy ra với hai phương pháp được liệt kê ở trên. Khi bạn có một **object** (hoặc **array**) lồng nhau và bạn thực hiện sao chép nó. Object được lồng phía bên trong sẽ không thực hiện sao chép, vì chúng chỉ là con trỏ / tham chiếu. Do đó, nếu bạn thay đổi đối tượng lồng nhau, bạn sẽ thay đổi nó cho cả hai trường hợp. Nghĩa là cuối cùng bạn sẽ thực hiện lại một **shallow copy**. Ví dụ: // BAD EXAMPLE


    const a = {
      foods: {
        dinner: 'Pasta'
      }
    }
    let b = {...a}
    b.foods.dinner = 'Soup' // changes for both objects
    console.log(b.foods.dinner) // Soup
    console.log(a.foods.dinner) // Soup


Để thực hiện một **deep copy** cho các **object** lồng nhau, bạn phải cân nhắc rằng. Một cách để thực hiện là sao chép thủ công tất cả các **object** lồng nhau.


    const a = {
      foods: {
        dinner: 'Pasta'
      }
    }
    let b = {foods: {...a.foods}}
    b.foods.dinner = 'Soup'
    console.log(b.foods.dinner) // Soup
    console.log(a.foods.dinner) // Pasta


### Thực hiện deep copy không cần suy nghĩ.


Điều gì xảy ra, nếu như bạn không biết các **Object** lồng nhau sâu như nào, và lồng bao nhiêu lớp? Nó thật sự rất mất thời gian và thiếu tinh tế, nếu các bạn thực hiện các thao tác bằng tay bằng cách đi qua từng lớp. Đây là cách thực hiện sao chép mà bạn không cần phải suy nghĩ. Đơn giản bạn chỉ cần c `stringify` object của bạn và `parse` nó lại sau đó.


    const a = {
      foods: {
        dinner: 'Pasta'
      }
    }
    let b = JSON.parse(JSON.stringify(a))
    b.foods.dinner = 'Soup'
    console.log(b.foods.dinner) // Soup
    console.log(a.foods.dinner) // Pasta


## Array


Sao chép **array** nó cũng phổ biến như sao chép một **object**. Nó cũng có rất nhiều cách tương tự, vì một **array** cũng được xem như là một **object**.


### Spread operator


Như một **object**, bạn có thể sao chép một **array** bằng **spread operator**.


    const a = [1,2,3]
    let b = [...a]
    b[1] = 4
    console.log(b[1]) // 4
    console.log(a[1]) // 2


### Array functions — map, filter, reduce


Những method này sẽ trả về một array mới với tất cả giá trị có trong array gốc. Trong khi bạn thực hiện sao chép, bạn cũng có thể điều chỉnh giá trị, rất tiện dụng.


    const a = [1,2,3]
    let b = a.map(el => el)
    b[1] = 4
    console.log(b[1]) // 4
    console.log(a[1]) // 2


Hoặc bạn có thể thay đổi giá trị của element mong muốn, trong lúc thực hiện sao chép.


    const a = [1,2,3]
    const b = a.map((el, index) => index === 1 ? 4 : el)
    console.log(b[1]) // 4
    console.log(a[1]) // 2


### Array.slice  


Phương pháp này thường đươc sử dụng để trả về một tập hợp con, bắt đầu từ một chỉ mục cụ thể và kết thúc tùy ý tại một chỉ mục cụ thể của mảng ban đầu. Khi bạn sử dụng `array.slice()` hoặc `array.slice(0)` bạn sẽ sao chép nó với một bản sao của array ban đầu.


    const a = [1,2,3]
    let b = a.slice(0)
    b[1] = 4
    console.log(b[1]) // 4
    console.log(a[1]) // 2


### Nested arrays


Giống như một **object,** sử dụng phương pháp trên để sao chép một array với array hoặc object khác lồng trong nó, sẽ gây ra **shallow copy.** Để khắc phục nó, bạn phải sử dụng `JSON.parse(JSON.stringify(someArray))`


### BONUS: copying instance of custom classes


Khi bạn thực sự master về [Javascript](https://coders.tokyo/2019/09/05/javascript-web-developer/) và bạn muốn thông qua việc **class hoặc constructor** để thực hiện sao chép.


Như đề cập ở trước, bạn không thể `stringify + parse` chúng, vì điều này sẽ làm mất **class method** của bạn. Vì vậy, bạn nên thêm một phương thức sao chép tùy chỉnh để tạo một **new instance** với tất cả các giá trị cũ. Hãy xem cách thức hoạt động của nó:


    class Counter {
      constructor() {
         this.count = 5
      }
      copy() {
        const copy = new Counter()
        copy.count = this.count
        return copy
      }
    }
    const originalCounter = new Counter()
    const copiedCounter = originalCounter.copy()
    console.log(originalCounter.count) // 5
    console.log(copiedCounter.count) // 5
    copiedCounter.count = 7
    console.log(originalCounter.count) // 5
    console.log(copiedCounter.count) // 7


Để đối phó với các **object** và **array** được tham chiếu bên trong **instance** của bạn, bạn sẽ phải áp dụng các kỹ năng mới học được về sao **deep copy**! Tôi sẽ chỉ thêm một giải pháp cuối cùng cho phương thức sao chép hàm tạo tùy chỉnh để làm cho nó linh động hơn:
```javascript
    class Counter {
      constructor() {
        this.count = 5


        this.add = function() {
          this.count++
        }
      }


      copy() {
        const copy = new Counter()


        Object.keys(this).forEach(key => {
          const value = this[key]


          switch(typeof value) {
            case 'function':
              break
            case 'object':
              copy[key] = JSON.stringify(JSON.parse(value))
              break
            default:
              copy[key] = value
              break
          }
        })


        return copy
      }
    }
```
Ở trên , bạn có thể sao chép mọi giá trị mà bạn muốn trong **constructor** của bạn. Mà không cần phải sao chép thủ công mọi thứ.


## Lời kết

Đó là những phương pháp mà tôi đúc kết được trong qúa trình tìm hiểu. Tôi hi vọng các bạn sẽ thích nó và áp dụng nó một cách thuần thục. Nếu bạn nào muốn tìm hiểu sâu hơn [Javascript](https://coders.tokyo/2019/09/05/javascript-web-developer/), các bạn có thể truy cập vào trang [Coders.Tokyo](https://coders.tokyo/). Với hệ thống bài giảng, bài tập tuyệt vời tôi tin rằng các bạn sẽ thích nó. Các bạn share bài ủng hộ cộng đồng và lan tỏa giá trị cho các bạn khác nhé.

