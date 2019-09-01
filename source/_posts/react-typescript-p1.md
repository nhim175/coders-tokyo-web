---
title: React và TypeScript (phần 1)
date: 2019-06-29 23:00:00
authorId: chau_tran
tags: typescript, react
---

![react-typescript](https://cdn-images-1.medium.com/max/1200/1*Ukhx76VQ8E6JXEW7xfIzSA.png)

`React` và `TypeScript` là 2 công nghệ mà không hề xa lạ đối với mọi người. Chắc chắn rằng chưa dùng qua thì các bạn cũng đã nghe qua 2 cái tên này. Nhưng các bạn có biết là tổ hợp `React + TypeScript` vẫn còn khá mới mẻ và xa lạ với nhiều người, chí ít là những người xung quanh bản thân của mình. Và hôm nay, mình xin mạn phép giới thiệu với các bạn về tổ hợp cực kỳ "hữu dụng" và "mạnh mẽ" này. 😎

<!-- more -->

> Mình xin lưu ý đây là ý kiến cá nhân. Mục đích viết bài một là chia sẻ kiến thức, hai là khuyến khích các bạn hãy thử qua. Ngoài `TypeScript`, thì có một công nghệ cũng hay đi đôi với `React`, đó là `Flow`. Bài viết này không mang tính chất so sánh giữa `TypeScript` và `Flow` 😇. Và bài viết này sẽ mặc định là các bạn có kiến thức `React`.

Trước khi bắt đầu, mình sẽ giới thiệu (lại) về `TypeScript`. (`React` thì quá quá phổ biến rồi 😛).

### TypeScript - What? Why? How?
- `TypeScript` (từ đây trở xuống, mình sẽ viết tắt là `TS`). `TS` là một **superset** của `JavaScript` (`JS`). Khi cài đặt `TS`, các bạn sẽ có truy cập tới 1 `Command-Line Interface` (`CLI`) lên là `TypeScript Compiler` (`tsc`). `tsc` sẽ làm nhiệm vụ *compile* code `TS` về `JS` để **trình duyệt** có thể hiểu và xử lý được.  Để có cái nhìn bao quát hơn **superset** là gì, các bạn xem hình sau: 
![ts-superset-js](https://raw.githubusercontent.com/basarat/typescript-book/master/images/venn.png)
Theo như hình minh hoạ, thì `TS` bao gồm `JS` + `something else`. Mình sẽ nói ngắn gọn về cái `something else` này.
    - Đầu tiên và quan trọng nhất là `TS` cung cấp `Static Types`. `JS` là một ngôn ngữ có tính chất `Dynamic` và vì thế nên `JS` rất "thoải mái". Theo bản thân của mình thì `JS` "quá thoải mái" nên lại làm mờ nhạt đi tính "chặt chẽ" mà mình muốn có. Các bạn hãy xem qua ví dụ sau:
    ```javascript
      let john = 'John';
      john = 123;
      // Như trên là hợp lệ và hoàn toàn hoạt động tốt trong JS. 
      // Nhìn thì có vẻ "thoải mái" nhưng rất dễ dẫn đến lỗi ngớ ngẩn khi các bạn phát triển phần mềm của mình, nếu như không để ý và cẩn thận. 
    ```
    
    ```typescript
      let john = 'John'; // biến "john" sẽ tự động được TS gán cho 1 primitive type là string vì giá trị 'John' có type là string
      john = 123; // Error: cannot assign "number" to "string"
      
    // TS sẽ lỗi ngay, và lỗi ở đây gọi là "Compilation Error", lỗi được bắt khi các bạn ĐANG phát triển phần mềm, giúp cho các bạn bắt lỗi sớm nhất có thể.   
    // Lưu ý là khi chạy đoạn code này, TS báo lỗi chứ trình duyện vẫn chạy bình thường vì sau khi được chuyển về JS, thì đoạn code trên hoàn toàn hợp lệ. 
    ```
    ```typescript
    // Một số default types trong TypeScript
      let someString: string;
      let someNumber: number;
      let someBoolean: boolean;
      let something: any;
      let someStringArray: string[]; // tương tự cho number[], boolean[], any[]
      let someObject: object;
      let someNull: null;
      let someUndefined: undefined;
      let someUnknown: unknown;
      let someNever: never;
      let someTyple: [string, number];
    
      // ngoài ra còn có: void và Function.
    ```
    Từ đây trở về sau, mình sẽ đề cập đến **việc gán type cho một cái gì đó** bằng thuật ngữ: `types` hoặc `typings`.

    - Thứ hai, đó là `TS` cung cấp `Interface` và `Type`. Đây là 2 cú pháp giúp các bạn `typings` cho `object`. Ví dụ:
    ```typescript
      interface User {
        firstName: string;
        lastName: string;
        age: number;
        job?: string;
      }
    
      // hoặc dùng type. Chỉ nên dùng 1 trong 2 cho cùng 1 tên (ở đây là User)
      type User = {
        firstName: string;
        lastName: string;
        age: number;
        job?: string;
      };
    
      const john: User = {
        firstName: 'John',
        lastName: 'Doe',
        age: 20,
        job: 'Student'
      };
      const susan: User = {
        firstName: 'Sue',
        lastName: 'Smith',
        age: 40
      };
    ```
    Mình muốn các bạn lưu ý 2 điểm ở đoạn code trên. Thứ nhất, mình khai báo một `interface User`. Các bạn hiểu `interface` giống như cái khuôn bánh vậy, các bạn muốn bánh của mình có hình dạng như thế nào thì sử dụng cái khuôn bánh có dạng mà các bạn muốn. Ở đây, "khuôn" `User` của mình có: `firstName`, `lastName`, `age` và `job`. Điều thứ hai, chính là property `job` này. Các bạn có thể cú pháp: `job?: string` không? Đây là cú pháp gọi là `Optional Property`. Ở trong `User`, thì `job` là property **không-bắt-buộc** nghĩa là có cũng được, không có cũng không sao trong khi 3 properties còn lại đều là **bắt buộc phải có**.
    
    Việc sử dụng `interface` sẽ giúp cho trình soạn thảo (`editor`) gợi ý cho các bạn object của các bạn (ở ví dụ này là `john` và `susan`) có những properties gì trên object đó. Nếu type `john.`, thì `editor` sẽ gợi ý: `firstName`, `lastName`, `age` và `job` cho các bạn lựa chọn. Điều này giảm thiểu việc sai lỗi chính tả rất nhiều khi các bạn viết code.
     
     > Đọc thêm về điểm khác biệt giữa `type` và `interface` ở đây: [type-vs-interface](https://medium.com/@martin_hotell/interface-vs-type-alias-in-typescript-2-7-2a8f1777af4c)
     
     - Thứ ba và cũng là điểm mấu chốt cuối cùng đó là `TS` cung cấp `Generics` và điều này giúp việc viết code theo hướng `Abstraction` cao trở nên dễ dàng hơn, theo sát được `SOLID priciples` hơn. ([SOLID](https://en.wikipedia.org/wiki/SOLID)). Ví dụ:
    ```typescript
          abstract class BaseService<T> {
            protected model: Model<T>;
          
            find(): T[] {
              return this.model.findAll();
            }
          
            findOne(id: number): T {
              return this.model.findById(id);
            }
          }
    
          class DogService extends BaseService<Dog> {
            constructor(dogModel: Model<Dog>) {
              super();
              this.model = dogModel;
            }
          }
            
          class CatService extends BaseService<Cat> {
            constructor(catModel: Model<Cat>) {
              super();
              this.model = catModel;
            }
          }
    ```
    Ví dụ trên là một trong những cách áp dụng `Abstraction` vào code của các bạn. Ở đây, mình viết 2 hàm `find()` và `findOne` trong `abstract class BaseService`. Cú pháp `<T>` chính là `Generics`, hay còn gọi là `Type Parameter`. `BaseService` nhận vào 1 `Type Parameter` gọi là `T`. Cũng như `parameter` thông thường, các bạn có thể đặt bất cứ tên gì: `<T>`, `<K>`, `<Type>`, `<Props>` ..v.v.. Khi mình cho `DogService` và `CatService` extends `BaseService`, thì trên `DogService` sẽ có 2 hàm: `find()` và `findOne()` với đúng type `Dog` mà mình ko cần phải viết lại 2 hàm trên trong `DogService`. (tương tự, `CatService` cũng vậy, và với đúng type là `Cat`).
    
    Trên đây chỉ là một ví dụ nhỏ. Để hiểu và áp dụng nhiều, các bạn phải luyện tập và hiểu **Object-Oriented Programming** một tí. Ở dưới phần `React`, mình sẽ áp dụng `Generics` để tạo một `Generic Component` nhé.
    
- Tại sao dùng `TS`? Như đã nói ở trên, `TS` giúp **developers** phát triển phần mềm một cách tường minh hơn với những `type definition` mà `TS` cũng như các thư viện dùng cho `TS` cung cấp. Với khả năng áp dụng tính **thừa kế** với những syntax quen thuộc trong `OOP` như: `abstract`, `class`, và `type parameter <T>`, `TS` giúp **developers** có thể phát triển ứng dụng một cách nhanh, chính xác, dễ bảo trì và mở rộng hơn.

    Nhưng cũng như bất cứ thứ gì trên đời (bất cứ không nhỉ? 🤨) thì đều có mặt tốt mặt xấu. `TS` mang lại nhiều lợi ích, nhưng cũng mang lại không ít phiền toái. Điển hình như: code nhiều hơn vì những định nghĩa types (`type definition`), conditional check nghiêm khắc hơn gây khó khăn và các thư viện bên ngoài phải có `type defs` (`d.ts file`) để hỗ trợ `TS`, nếu không thì cũng như không... Nhưng lợi ích của `TS` mang lại thực sự là lớn hơn so với phiền phức. 
    
- Một số nguồn dữ liệu về `TS` để giúp bạn bắt đầu tốt hơn:
    1. [TypeScript Documentations](https://www.typescriptlang.org/docs/home.html)
    2. [TypeScript Deep Dive](https://basarat.gitbooks.io/typescript/docs/getting-started.html)
    
### TypeScript in React

Vào cuối năm 2018, `Create React App` (`create-react-app` hoặc viết tắt là `CRA` là 1 CLI dùng để khởi tạo một dự án `React` mới) đã chính thức support `TS` khi khởi tạo 1 dự án `React`.

```
create-react-app my-awesome-app --typescript
```

Dòng lệnh trên sẽ khởi tạo 1 dự án `React` có tên là `my-awesome-app` và hỗ trợ `TS`. Khi sử dụng `TS` trong `React` thì đuôi của các file `JSX` được chuyển thành `TSX`.

```App.jsx -> App.tsx```

Khi nhìn vào `package.json` để xem flag `--typescript` cài đặt gì thêm so với khởi tạo ứng dụng `React` thông thường, các bạn sẽ thấy 2 thư viện: `@types/react` và `@types/react-dom`. `@types` là namespace của dự án `DefinitelyTyped`. `DefinitelyTyped` là 1 dự án Open-Source, là nơi mà cộng đồng sẽ cung cấp `.d.ts` (typings file) cho các thư viện `JS`. Nhờ những thư viện `@types` này mà `TS` có thể giúp **developers** sử dụng những thư viện `JS` này nhanh và hiệu quả hơn. Và những thư viện `@types` này đều nên được cài đặt vào `devDependencies` vì đây là những thư viện giúp ích cho các bạn khi các bạn **VIẾT CODE** mà thôi, không đóng góp gì khi **CODE CHẠY** cả. Lưu ý các bạn nhé. 

> Khi các bạn muốn sử dụng 1 thư viện `JS` nào đó, kiểm tra 2 việc: xem xem trong mã nguồn (source) của thư viện bạn muốn sử dụng có file nào là `.d.ts` hay không, nếu không, kiểm tra xem có package `@types/tên_thư_viện` trên `npm` hay không.

#### Basic
Cơ bản nhất khi sử dụng `TS` trong `React` đó chính là bắt đầu `typings` những `Components` của bạn.
```typescript jsx
// Class Component
import React, { Component } from 'react';

// Có thể dùng interface thay vì type 
type Props = { // Có thể đặt tên gì mà bạn muốn, SomeComponentProps chẳng hạn
  someProp: string;
  someOtherProp: number;
};

// Có thể dùng interface thay vì type 
type State = { // Có thể đặt tên gì mà bạn muốn, SomeComponentState chẳng hạn
  someState: string;
  someOtherState: number;
};

class SomeComponent extends Component<Props, State> { // Component được cung cấp bởi @types/react và nhận vào 2 generics TProps và TState
  // ... do stuff

  static defaultProps = {}; // defaultProps sẽ có dạng là Props.

  state = {
    someState: '',
    someOtherState: 0
  }; // this.state sẽ có dạng là State, và sẽ có someState và someOtherState

  render() { // Khi extends Component, TS sẽ bắt buộc các bạn phải có hàm render(), và hàm render() này phải return JSX 
    const { someProp, someOtherProp } = this.props; // this.props sẽ dạng là Props, và sẽ có someProp và someOtherProp
    return (<></>);
  }
}
```
> Lưu ý khi dùng `defaultProps`: những props nào mà các bạn muốn cung cấp default value (giá trị ban đầu) thì các bạn sẽ phải dùng cú pháp `Optional Properties` khi khai báo prop này trên type Props.

```typescript jsx
import React, { Component } from 'react';

type Props = {
  someProp: string;
  someDefaultProp?: number; // lưu ý cú pháp ?:
};

// nếu như Component này không có State, thì không cần truyền vào. 
// Nhưng nếu component này có State mà không có Props, thì phải viết: Component<{}, State>
class SomeComponent extends Component<Props> {
  static defaultProps = {
    someDefaultProp: 11
  };
  
  render() {
    return (...);
  }
}
``` 
Khi sử dụng `SomeComponent`, các bạn sẽ thấy điều khác biệt:

```typescript jsx
import React, { Component } from 'react';
import SomeComponent from './SomeComponent';

class App extends Component {
  
  // SomeComponent sẽ nhận vào 2 props là someProp và someDefaultProp (lấy ví dụ default ở trên nhé)
  // someProp là string và required. Các bạn sẽ gặp lỗi nếu như không truyền someProp cho SomeComponent, và truyền someProp nhưng với giá trị không phải string.
  // someDefaultProp là number và optional. Các bạn thấy là không cần phải truyền someDefaultProp cho SomeComponent.
  // Để biết được một Component đang cần props gì, các bạn có thể dùng phím tắt: ctrl + space ở bên trong <SomeComponent ở_đây />
  render() {
    return (
      <SomeComponent someProp={'someString'}/>
    );
  }
}
```

Tiếp theo, mình sẽ xem xem `Functional Component` được viết như thế nào nhé:

```typescript jsx
import React, { FC } from 'react';

type Props = {
  someProp: string;
  someDefaultProp?: number;
};

// props sẽ có dạng là Props. FC là viết tắt của FunctionComponent.
// Với React v16.8+ và sự xuất hiện của Hooks, FunctionComponent có thể dùng được state bằng hooks. Lúc trước, FunctionComponent là StatelessFunctionComponent (hoặc SFC).
const SomeComponent: FC<Props> = props => {
  // tương tự như Class Component, khi typings FC cho SomeComponent, TS sẽ ép các bạn return JSX và sẽ error nếu như các bạn không return JSX
  return (<></>);
}

SomeComponent.defaultProps = {
  someDefaultProp: 11
};
```

```typescript jsx
// tương tự như Class Component

import React, { FC } from 'react';
import SomeComponent from './SomeComponent';

const App: FC = props => {
  return (
    <SomeComponent someProp={'someString'}/>
  );
}
```

#### How to type a Function/Callback?

Với `React` thì hầu như 100% các dự án đều cần truyền `function` vào `props` cho các `Component` con.

```javascript
import React, { FC } from 'reat';

type Props = {
  someProp: string;
  onSomeEvent: () => void; // function 
};

const SomeComponent: FC<Props> = ({ someProp, onSomeEvent }) => { // destructure props nếu thích
  return (
    <>
      <p>{someProp}</p>
      <button onClick={onSomeEvent}>Click me for Some Event</button>
    </>
  );
}

const App: FC = () => {
  
  const onClickHandler = () => {
    // do something with click
  }
  
  return <SomeComponent someProp={'Some String'} onSomeEvent={onClickHandler}/>
}
```

Rất đơn giản đúng không? Vậy bây giờ nếu như `function/callback` cần nhận vào `argument` thì sao? Tại sao lại phải cần typings `FC`? Dùng `hooks`, `redux` như thế nào với `TS`? Và `Generic Component` ra sao? Các câu hỏi này thì đành xin các bạn dời vào bài viết kế tiếp vì bài này cũng đã dài rồi, và lượng kiến thức cũng "kha khá" rồi. Xin hẹn gặp các bạn ở phần 2 và hi vọng các bạn đã có 1 số kiến thức nền cần thiết để "nạp" thêm dễ dàng hơn nhé. 😅
