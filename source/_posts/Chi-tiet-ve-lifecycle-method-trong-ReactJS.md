---
title: Chi tiết về lifecycle method trong ReactJS
date: 2019-06-15 20:10:07
authorId: thai_son
tags:
---

![Chi tiết về lifecycle method trong ReactJS](https://res.cloudinary.com/djeghcumw/image/upload/v1559793682/blog/1_cEWErpe-oY-_S1dOaT1NtA.jpg)

Trong bài viết này, tôi sẽ giải thích về các `lifecycle method` trong ReactJS. Nhưng, trước khi nói về sự khác biệt của các `lifecyle method`. Bạn nên tìm hiểu rõ ràng nó là gì.

<!-- more -->

Như bạn biết, mọi thứ trong thế giới này đều vận hành và follow theo một `cycle`(vòng đời). Ví dụ như con người, động vật, cây... Chúng ta được sinh ra, lớn lên và chết đi. Hầu hết mọi thứ đều follow theo một quy luật của nó, và `React component` cũng vậy. Mỗi `component` được tạo ra (mounted on the DOM), phát triển bởi `updating`, và sau đó chết đi (unmount on Dom). Điều này được gọi là `component lifecycle`.

Có nhiềù `lifecycle method` khác nhau được React cung cấp trên các giai đoạn khác nhau. Các method này cho chúng ta quyền kiểm soát tốt hơn đối với component và chúng ta có thể thao tác chúng bằng các method này.

## Lifecycle Methods 

Mỗi `lifecycle component` được phân loại thành bốn giai đoạn: 
+ initialization
+ mounting
+ updating
+ unmounting

Nào, hãy cùng thảo luận về sự khác biệt của các method chứa trong 4 giai đoạn này: 

### Initialization

Đây là giai đoạn mà component sẽ bắt đầu hành trình của nó bằng cách thiết lập state và props. Điều này thường được thực hiệp bên trong constructor method (Hãy xem ví dụ dưới đây để hiểu hơn về giai đoạn Initialization nhé).

```javascript 
class Initialize extends React.Component {
    constructor(props){
        // Calling the constructor of
        // Parent Class React.Component
        super(props);
        // initialization process
        this.state = {   date : new Date(),   clickedStatus: false
    };
}
```
### Mounting 

Mounting là giai đoạn mà React component của chúng ta sẽ được `mount on the DOM` (được khởi tạo và chèn vào cây dom).

Giai đoạn này được thực hiện sau khi giai đoạn initialization được hoàn thành. Trong giai đoạn này, component sẽ được render lần đầu tiên. Và chúng ta cùng tìm những method có trong giai đoạn này nhé: 

#### 1. componentWillMount()

Method này sẽ được gọi ngay trước khi component được `mount on the DOM` hoặc `render method` được gọi.  

**Lưu ý**: Bạn không nên thực hiện một cuộc gọi API hoặc dùng `this.setState` để thay đổi bất kì dữ liệu nào trong method này. Bởi vì nó sẽ được gọi trước khi `render method` chạy. Vì vậy, bạn không thể update state với sự trả về của API 

### 2. componentDidMount()

Method này sẽ được gọi sau khi component được `mount on the DOM`. Giống như componentWillMount, nó sẽ được gọi một lần trong một lifecycle. Trước khi thực thi method này, thì `render method` sẽ được gọi. Chúng ta có thể thực hiện một cuộc gọi API hoặc update state với API response ở trong method này. 

Đọc ví dụ dưới để hiểu hơn về những mounting methods:

```javascript
class LifeCycle extends React.Component {
  componentWillMount() {
      console.log('Component will mount!')
   }
  componentDidMount() {
      console.log('Component did mount!')
      this.getList();
   }
  getList=()=>{
   /*** method to make api call***/
  }
  render() {
      return (
         <div>
            <h3>Hello mounting methods!</h3>
         </div>
      );
   }
}
```
## Updating

Đây là giai đoạn thứ ba trong mỗi lifecycle. Sau giai đoạn mounting (nơi mà các component được tạo ra), đây là giai đoạn updateting bắt đầu thực hiện. Đây là nơi state của component thay đổi, và việc re-rendering được diễn ra. 

Trong giai đoạn này, dữ liệu của mỗi component(state & props) sẽ được update khi user thực hiện các hành động như click, typing... Kết quả sẽ re-rendering lại component. Các method có trong giai đoạn này: 

### 1.shouldComponentUpdate()

Method này sẽ xác định rằng component có được update hay là không. Mặc định, sẽ trả về là true. Nhưng đến một lúc nào đó, nếu bạn muốn re-render lại component bằng một số ràng buộc điều kiện, thì viết các điều kiện đó trong method này là một điều lí tưởng.

Giả sử, bạn chỉ muốn re-render component khi prop thay đổi. Method này sẽ nhận các đối số như `nextProps` và `nextState` để giúp chúng ta quyết định một cách dễ dàng hơn khi so sánh với prop hiện tại. 

### 2.componentWillUpdate()

Như các method khác, khi đọc tên của nó chắc các bạn cũng hiểu rõ phần nào. Nó sẽ được gọi trước khi component update và sẽ được gọi mỗi lần sau method `shouldComponentUpdate`. Nếu bạn muốn thực hiện một số phép tính trước khi re-render component và sau khi update sate và prop, thì đây là một method hợp lý để thực hiện. Như method `shouldComponentUpdate` method, nó sẽ nhận các đối số như `nextProps` và `nextState`.

### 3.componentDidUpdate()

Method này sẽ chỉ được gọi sau khi re-render component. Sau mỗi lần update mới, component sẽ được update vào Dom. Method `componentDidUpdate` sẽ được thực hiện. Method này sẽ nhận vào các đối số như `prevProps` và `prevState`.

Mời các bạn cùng nhín ví dụ dưới đây để hiểu hơn về các method này: 

```javascript
class LifeCycle extends React.Component {
      constructor(props)
      {
        super(props);
         this.state = {
           date : new Date(),
           clickedStatus: false,
           list:[]
         };
      }
      componentWillMount() {
          console.log('Component will mount!')
       }
      componentDidMount() {
          console.log('Component did mount!')
          this.getList();
       }
      getList=()=>{
       fetch('https://api.mydomain.com')
          .then(response => response.json())
          .then(data => this.setState({ list:data }));
      }
       shouldComponentUpdate(nextProps, nextState){
         return this.state.list!==nextState.list
        }
       componentWillUpdate(nextProps, nextState) {
          console.log('Component will update!');
       }
       componentDidUpdate(prevProps, prevState) {
          console.log('Component did update!')
       }
      render() {
          return (
             <div>
                <h3>Hello Mounting Lifecycle Methods!</h3>
             </div>
          );
       }
}
```
## Unmounting

Đây là giai đoạn cuối cùng của một component lifecycle. Như cái tên của nó, chúng ta có thể hiểu một cách rõ ràng. Nó sẽ unmounted DOM trong giai đoạn này. Các method có trong giai đoạn này: 

### 1.componentWillUnmount()

Method này sẽ được gọi trước khi unmmount component. Trước khi loại bỏ thành phần khỏi DOM, `componentWillUnmount` sẽ được thực thi. Method này sẽ biểu thị sự kết thúc của một lifecycle

Dưới đây là biểu đồ thứ tự thực hiện của các method trong 1 vòng lifecycle: 

![Chi tiết về lifecycle method trong ReactJS](https://res.cloudinary.com/djeghcumw/image/upload/v1560491971/blog/NpWCjYyzfnJkn7rXwDmyWwK2DqInFJu6-g1O.png)

Đó là tất cả những kiến thức quan trọng về component lifecycle trong React. Hi vọng các bạn sẽ thích nó. Cám ơn các bạn rất nhiều.

Bài viết tham khảo: https://www.freecodecamp.org/news/how-to-understand-a-components-lifecycle-methods-in-reactjs-e1a609840630/