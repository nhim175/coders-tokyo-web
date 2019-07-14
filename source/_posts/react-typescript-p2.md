---
title: React và TypeScript (phần 2)
date: 2019-07-13 23:00:00
authorId: chau_tran
tags: typescript, react
---

![react-typescript](https://cdn-images-1.medium.com/max/1200/1*Ukhx76VQ8E6JXEW7xfIzSA.png)

`React` và `TypeScript` là 2 công nghệ mà không hề xa lạ đối với mọi người. Chắc chắn rằng chưa dùng qua thì các bạn cũng đã nghe qua 2 cái tên này. Nhưng các bạn có biết là tổ hợp `React + TypeScript` vẫn còn khá mới mẻ và xa lạ với nhiều người, chí ít là những người xung quanh bản thân của mình. Và hôm nay, mình xin mạn phép giới thiệu với các bạn về tổ hợp cực kỳ "hữu dụng" và "mạnh mẽ" này. 😎

<!-- more -->

Chào mừng các bạn quay lại với topic `React + TypeScript` phần 2. Ở phần này, chúng ta sẽ tìm hiểu về:
1. Utility Types
2. Type Composition
3. Sử dụng với `Redux`
4. Generic Component pattern

Bạn nào chưa xem phần 1 có thể xem tại: [React TypeScript phần 1](https://coders.tokyo/2019/06/29/react-typescript-p1/)

### Utility Types
----
`Utility Types` là những type hỗ trợ mà chính `TypeScript` sẽ cung cấp cho các bạn sử dụng. `Utility Types` bao gồm khá nhiều thứ, và mình sẽ đề cập đến 3 utility được dùng phổ biến sau:

#### Union/Intersection Types
Union Types là những type mang tính chất: **EITHER OR** (tạm dịch là Hoặc cái này Hoặc cái kia). Để viết Union Types, chúng ta dùng **Pipe Symbol** (`|`).

Ví dụ như bạn có một `function listen()` như sau:

```typescript
/**
* Hàm listen() nhận vào tham số port, tham số này có thể là string hoặc number. 
* Nếu là string, thì sẽ parseInt() để chuyển về number và truyền vào hàm server.listen()
* @param port: any
*/
function listen(port: any) {
  let _port = port;
  if (typeof port === 'string') {
    _port = parseInt(port, 10);
  }
  
  server.listen(port);
}
```

Ở ví dụ trên, mình sử dụng `typeof`. `typeof` là cú pháp dùng để lấy về type của một biến bất kỳ. Giá trị mà `typeof` trả về có type là `string` 
```typescript
typeof('string'); // string
typeof(123); // number
typeof(true); // boolean
typeof({}); // object
typeof([]); // object
typeof(() => {}); // object
typeof(null); // null
typeof(undefined); // undefined
typeof(new Date()); // object

// Còn một số khác như NaN, String(), Boolean(), Number() các bạn nghiên cứu nhé.
// Lưu ý là các dạng như Array, Object, Function, Date đều trả về là object.
// và giá trị của typeof là string 
 typeof(typeof(123)) // string
```

Các bạn thấy hàm `listen()` ở trên có một vấn đề đó là tham số `port` có dạng là `any`. Nghĩa là mình có thể truyền vào bất cứ dạng giá trị nào cho tham số này: `string`, `number`, `boolean`, `object`, `array`  ..v.v... Và điều này thì không hay tí nào, vì trong hàm `listen()` này mình chỉ xử lý là `string` hoặc `number` mà thôi. Lúc này, sử dụng `Union Types` là giải pháp tốt nhất. Hàm `listen()` đc viết lại như sau:
```typescript
function listen(port: string | number) {
  // do something
}

listen('3000'); // works
listen(3000); // works
listen(true); // TypeError: Argument of type true is not assignable to parameter type string | number
listen(); // TypeError: Invalid number of arguments, expected 1
```
Các bạn thấy là `TypeScript` báo lỗi ngay khi mình truyền `boolean` vào cho `listen()`, hoặc là không truyền gì cả.
Mình lưu ý là `TypeScript` báo lỗi vậy, mình thường gọi là `Compilation Time error` vì thực sự khi `transpiled` bằng `tsc` thì các bạn sẽ nhận được lỗi tương tự khi trình soạn thảo hiển thị. Mặc dù có `Compilation Time error`, code `JS` mà `tsc` tạo ra vẫn chạy được bình thường nhé, và khi chạy các bạn gặp lỗi thì đó gọi là `Runtime Error`.

Tương tự như tạo `Union Type` cho tham số, bạn có thể tạo `Union Type` cho cả giá trị trả về của hàm nhé. Ví dụ:
```typescript
function getSomething(): string | number {
  return 'string'; // works
  return 30; // works
  return true; // TypeError: Returned expression type boolean is not assignable to type string | number
}
```

Ngoài `Union Types`, thì `TypeScript` cũng cung cấp `Intersection Types`. Và đây chính là `Type Composition`, mình sẽ đi sâu hơn ở mục kế nhé. 

#### Conditional Types
Từ `TypeScript` version 2.8 thì `TypeScript` cung cấp cho developers `Conditional Types`. Đây là 1 type khá đặc biệt, giúp chúng ta tạo được những type dựa theo điều kiện. Ví dụ:
```typescript
T extends U ? X : Y
```
Dòng code trên có thể hiểu là: khi `T` có thể gán được cho `U` thì sẽ trả về type `X`, còn không thì trả về type `Y`.

```typescript
function fn<T extends boolean>(x: T): T extends true ? string : number {
  // do something
}

const x = fn(true); // type của giá trị trả về của fn() sẽ có type là string | number
```
`Conditional Types` đơn giản chỉ có vậy, nhưng nếu biết cách sử dụng, mình có thể tạo được những types rất "robust" và phục vụ được việc develop rất nhiều. Chúng ta sẽ khám phá thêm `Union Type` và `Conditional Type` ở mục kế tiếp. 

#### Type Alias

`Type Alias` có thể hiểu nôm na như là bạn gộp các types lại thành 1 type nào đó (gọi là alias, tên thay thế). Ví dụ như `Union Type` ở trên: `string | number`, các bạn có thể tạo 1 `Type Alias` nếu như các bạn sử dụng `string | number` ở nhiều chỗ khác nhau:
```typescript
type StringOrNumber = string | number;

function listen(port: StringOrNumber) {
  // do something
}
listen(3000); // works
listen('3000'); // works
```
Kế tiếp, mình sẽ lấy ví dụ như sau: Các bạn muốn tạo 1 `Component` có những yêu cầu sau:
1. Là 1 `FlexComponent` với `style = {display: 'flex'}`
2. Nhận vào 1 prop: `FlexDirection` để truyền vào `style = {flexDirection: ...}`

Theo như các bạn đã biết qua, thì `flexDirection` có thể nhận vào những giá trị sau: `column`, `row`, `column-reverse` và `row-reverse`. Nhưng trên thực tế, các bạn có thể truyền bất cứ `string` nào cho `flexDirection` (trừ khi các bạn dùng `TypeScript`). Để ngăn ngừa việc truyền "tràn lan", chúng ta có thể tạo 1 `Union Type` và dùng `Type Alias` như sau:
```typescript jsx
type FlexDirection = 'column' | 'row' | 'column-reverse' | 'row-reverse';

type Props = {
  flexDirection: FlexDirection;
}

export const Flex: FC<Props> = props => {
  return (
    <div style={{display: 'flex', flexDirection: props.flexDirection}}>
      {props.children()}
    </div>
  )
}

const App = ()=> {
  return (
    <Flex flexDirection={'row'}>
      <span>I am a flex child</span>
    </Flex>
  )
}
```
Ở đây, khi các bạn dùng `Flex` component và muốn truyền vào giá trị cho `flexDirection` thì `TypeScript` sẽ cung cấp `Intellisense` 4 giá trị mà mình đã khai báo ở `FlexDirection` alias. Rất hữu dụng đúng không?

Kế tiếp, chúng ta sẽ tìm hiểu thêm một ví dụ nữa về `Type Alias` và `Conditional Types` nhé. 
```typescript
type ObjectDictionary<T> = {[key: string]: T};
type ArrayDictionary<T> = {[key: string]: T[]};
type Dictionary<T> = T extends any[] ? ArrayDictionary<T[number]> : ObjectDictionary<T>;

type StringDictionary = Dictionary<string>; // {[key: string]: string}
type NumberArrayDictionary = Dictionary<number[]>; // {[key: string]: number[]}
type UserEntity = Dictionary<User>; // {[key: string]: User}
```
Ở ví dụ trên, mình có 3 aliases: `ObjectDictionary`, `ArrayDictionary` và `Dictionary`. `Dictionary` được coi là `True Type` và sẽ là alias được sử dụng trong code của các bạn, còn `ObjectDictionary` và `ArrayDictionary` là `Support Type` dùng để hỗ trợ cho `Dictionary`. Khá là dễ hiểu, nếu mình truyền vào 1 dạng type array (`number[]`) thì `T extends any[]` sẽ được định giá là `truthy` và `Dictionary<number[]` sẽ có trả về `ArrayDictionary<number>`.

`TypeScript` ngoài cung cấp cho bạn khả năng tạo những dạng type thú vị như trên và kết hợp chúng thì còn cung cấp cho các bạn một số "built-in" types như sau (có khá nhiều nên mình chỉ liệt kê những cái nào sẽ dùng nhiều thôi):
```typescript
// Exclude/Extract
type Exclude<T, U> = T extends U ? never : T; 
type Extract<T, U> = T extends U ? T : never; 

// Exclude: Loại bỏ những types ở T nếu như những types này gán được cho U 
type SomeDiff = Exclude<'a' | 'b' | 'c', 'c' | 'd'>; // 'a' | 'b'. 'c' đã bị removed.

// Extract: Loại bỏ những types ở T nếu như những types này KHÔNG gán được cho U
type SomeFilter = Extract<'a' | 'b' | 'c', 'c' | 'd'>; // 'c'. 'a' và 'b' đã bị removed.

// hoặc có thể dùng Exclude để tạo type alias NonNullable 
type NonNullable<T> = Exclude<T, null | undefined>; // loại bỏ null và undefined từ T

type Readonly<T> = {readonly [P in keyof T]: T[P]}; // làm tất cả các props trong type thành readonly. Eg: Rất có lợi khi dùng cho Redux State.
type Partial<T> = {[P in keyof T]?: T[P]}; // làm tất cả các props trong type thành optional. Eg: Rất có lợi cho việc type 1 tham số khi cần truyền vào 1 type nào đó mà ko bắt buộc.
type Nullable<T> = {[P in keyof T]: T[P] | null}; // cái này tương tự như Partial, Partial sẽ trả về T[P] | undefined. Còn Nullable sẽ trả về T[P] | null 

type Pick<T, K extends keyof T> = {[P in K]: T[P]};
type Record<K extends keyof any, T> = {[P in K]: T};

// Pick: Pick từ trong T những type có key là K
type Person = {
  firstName: string;
  lastName: string;
  password: string;
}

type PersonWithNames = Pick<Person, 'firstName' | 'lastName'>; // {firstName: string, lastName: string}

// Record: Gán type T cho lần lượt từng key P trong K 
type ThreeStringProps = Record<'prop1' | 'prop2' | 'prop3', string>;
// { prop1: string, prop2: string, prop3: string }

type ReturnType<T> = T extends (...args: any[]) => infer R ? R : any;

// ReturnType: trả về type của giá trị mà function T trả về.
type Result = ReturnType<() => string>; // string

type Omit<T, K extends keyof T> = Pick<T, Exclude<keyof T, K>>;

// Omit: loại bỏ type có key là K trong T 
type PersonWithoutPassword = Omit<Person, 'password'>; // {firstName: string, lastName: string}
```
Trên đây là một số type alias hay dùng, nếu rành, các bạn sẽ có được những bộ types cực kỳ hữu dụng trong qúa trình phát triển phần mềm của mình. Xem thêm tại: [Advanced Types](https://www.typescriptlang.org/docs/handbook/advanced-types.html)

Kế tiếp, chúng ta sẽ nói về một chủ đề cũng khá quan trọng trong hệ thống Types của `TypeSccript`, đó là `Type Composition`.

### Type Composition
----
`Type Composition` là thuật ngữ dùng để nói đến kết hợp các loại `types` lại với nhau. Mình sẽ dùng ví dụ từ `React` nhé.
```typescript
type FC<P = {}> = FunctionComponent<P>; // FC là alias của FunctionComponent

interface FunctionComponent<P = {}> {
    (props: PropsWithChildren<P>, context?: any): ReactElement | null;
    propTypes?: WeakValidationMap<P>;
    contextTypes?: ValidationMap<any>;
    defaultProps?: Partial<P>;
    displayName?: string;
}
```
Đoạn snippet trên là type `FunctionComponent` chính thức từ `@types/react`. Cách dùng như sau:
```typescript jsx
const Flex: FunctionComponent<Props> = props => {...}
const Flex: FC<Props> = props => {...}
```
Ở đây mình muốn các bạn để ý đến: `PropsWithChildren<P>`, đây là 1 composite type. Khi các bạn pass type `Props` vào cho `FunctionComponent`, thì `props` của Component không chỉ đơn thuần là type `Props` nữa, mà nó là `PropsWihChildren<Props>`, React truyền tiếp `Props` vào cho `PropsWithChildren`. `PropsWithChildren` có dạng như sau:
```typescript
type PropsWithChildren<P> = {
  children?: ReactNode
} & P;
```
Các bạn thấy là `PropsWithChildren` lấy type `P` và kết hợp với type: `{ children?: ReactNode }`, đây gọi là Type Composition. Ví dụ rõ ràng hơn như sau:
```typescript
type Props = {
  onClick: () => void;
  buttonText: string;
  buttonStyle: CSSProperties;
}
const CustomButton: FC<Props> = props => {...}
// props có type là: 
/**
 * {
 *   onClick: () => void;
 *   buttonText: string;
 *   buttonStyle: CSSProperties
 *   children?: ReactNode;
 * }
 */
```
Tóm lại, `PropsWithChildren` sẽ giúp cho các bạn có truy xuất đến: `props.children` trên `props` mà sẽ không bị `TypeScript` "làm phiền". Lưu ý là ở class Component `Component<Props, State>` thì `Props` này cũng sẽ đc composite tương tự với `PropsWithChildren`

`Type Composition` có công dụng nổi bật nhất là khả năng Reuse Types. Ví dụ trong 1 thư viện UI, họ có rất nhiều Component khác nhau: Button, Image, Text, Card .v.v... Những Component này có những types `Style` khác nhau, nhưng cũng có những types cơ bản giống nhau. Ví dụ như `Text` sẽ có thêm `fontSize`, `fontWeight` còn `Button` sẽ có `onClick`. Tác giả của những thư viện UI này sẽ sử dụng `Type Composition` để viết types system cho thư viện UI của họ mà không phải lặp đi lặp lại nhiều 1 số types giống nhau.

Như các bạn đã thấy, đi sâu vào hệ thống Types của `TypeScript` không dễ dàng quá đúng không? Nhưng hiểu được và nắm được một số kĩ thuật cơ bản thì sẽ gíup được rất nhiều trong việc sử dụng `TypeScript`, điển hình là dùng `Redux` trong `React` với `TypeScript` như thế nào. Và chúng ta sẽ tìm hiểu thêm về vấn đề này nhé.

### Ứng dụng trong Redux
----
Trong `Redux`, các bạn sẽ phải làm việc với 3 cấu trúc chính:
1. Actions
2. Reducers
3. Stores

Ở phần này, mình sẽ hướng dẫn về: `Actions` và `Reducers` mà thôi vì **types** của `Stores` sẽ được kết cấu lên từ **types** của `Actions` và `Reducers`. Và mình sẽ mặc định rằng các bạn có kiến thức nền của `Redux` rồi nhé.

Để "dễ thở" hơn trong việc áp dụng `TypeScript` vào `Redux`, mình khuyên các bạn là nên dùng thư viện: [typesafe-actions](https://github.com/piotrwitek/typesafe-actions). Đây là một thư viện cực kỳ hữu dụng nếu các bạn dùng `TypeScript` với `Redux`. Các bạn có thể KHÔNG dùng `typesafe-actions` nhưng mình dám chắc rằng bạn sẽ gặp khó khăn và sẽ nản ngay khi types những `Actions` và `Reducers` của mình. Bài viết này sẽ dùng `typesafe-actions` nhé.
```
npm i -s typesafe-actions
```

#### Actions 
`typesafe-actions` cung cấp 4 công cụ chính để làm việc với `Actions`: `action`, `createAction`, `createAsyncAction` và type alias `ActionType`. Ngoài ra còn có `createStandardAction` và `createCustomAction`, 2 công cụ này chỉ là cách tạo `Actions` khác thôi. Các bạn có thể xem thêm tại [typesafe-actions](https://github.com/piotrwitek/typesafe-actions). `createAsyncAction` sẽ có lợi nếu như bạn dùng `redux-thunk` middleware để tạo các `Async Actions` để gọi API.

 Để viết một `TodoActions`, mình sẽ làm như sau:
 ```typescript
// Có rất nhiều cách để viết Action trong Redux, 
// mình sẽ viết bằng typesafe-actions luôn mà không viết những cách khác, các bạn tự so sánh nhé.
import { action, createAction } from 'typesafe-actions';

// Cách 1, dùng action 
export const todoActions = {
  addTodo: (content: string) => action('ADD_TODO', { content }),
  updateTodo: (id: number, content: string) => action('UPDATE_TODO', { id, content }),
  deleteTodo: (id: number) => action('DELETE_TODO', { id }),
  toggleTodo: (id: number) => action('TOGGLE_TODO', { id }),
  toggleAll: (completing: boolean) => action('TOGGLE_ALL', { completing }),
  clearCompleted: () => action('CLEAR_COMPLETED'),
  setFilter: (type: FilterType) => action('SET_FILTER', { type })
};

// Cách 2, dùng createAction
export const todoActions = {
  addTodo: createAction('ADD_TODO', actionCb => (content: string) => actionCb({content})),
  updateTodo: createAction('UPDATE_TODO', actionCb => (id: number, content: string) => actionCb({id, content})),
  deleteTodo: createAction('DELETE_TODO', actionCb => (id: number) => actionCb({id})),
  toggleTodo: createAction('TOGGLE_TODO', actionCb => (id: number) => actionCb({id})),
  toggleAll: createAction('TOGGLE_ALL', actionCb => (completing: boolean) => actionCb({completing})),
  clearCompleted: createAction('CLEAR_COMPLETED', actionCb => actionCb),
  setFilter: createAction('SET_FILTER', actionCb => (type: FilterType) => actionCb({type}))
}
```
Cả 2 cách là như nhau, nhưng sẽ khác biệt khi sử dụng thêm 1 số công cụ hỗ trợ của `typesafe-actions` như: `getType()`, `isOfType()` hoặc `isActionOf()`. Đây là những công cụ hỗ trợ mà `typesafe-actions` cung cấp để bạn có thể dùng với những middlewares như `redux-observable` và `redux-saga`.

Sau khi các bạn đã định nghĩa xong `actions` của mình, thì kế tiếp là `Reducers`.

#### Reducers
Trước hết, các bạn phải biết được type của `Reducer`, `Reducer` có type như sau:
```typescript
type Reducer<State, Actions> = (state: State, action: Actions) => State;
```
Nếu như nhìn kĩ thì các bạn sẽ thấy Type Alias `Reducer<State, Actions>` ở trên khá hợp lý, và chính xác với đinh nghĩa của `Reducer`: nhận vào state hiện tại, và action được dispatch, sẽ return state mới. Vậy bây giờ mình cần: `State` và `Actions`.

1. `State`: State thì rất dễ, các bạn chỉ cần định nghĩa `State` bằng 1 interface. Thông thường, mình viết interface của `State` ngay trong `Reducer` quản lý `State` đó, các bạn hoàn toàn có thể tách interface ra thành 1 file riêng nhé:
```typescript
export type Todo = {
  id: number;
  content: string;
  isCompleted: boolean;
};

export type FilterType = 'all' | 'active' | 'completed';
// Todo và FilterType là arbitrary (không quan trọng). Có thể hoàn toàn khác trong 1 ứng dụng Todo khác

interface TodoState {
  todos: Todo[];
  filter: FilterType;
}

const initialState = {
  todos: [],
  filter: 'all'
} as TodoState;
```
Như vậy là bạn đã có `State`, bây giờ đến `Actions` cho `Reducer`
2. `Actions`: Bình thường để type được `Actions` hoàn chỉnh thì rất khó. Lí do là vì `Actions` thường không đồng nhất, có `Action` có payload, có `Action` không có payload, những `Action` có payload thì các payload này lại khác nhau. Các bạn có thể tưởng tượng ra độ phức tạp nếu như muốn type `Actions` rồi đó. Và đây là lý do mình khuyên các bạn dùng `typesafe-actions`. `typesafe-actions` cung cấp cho các bạn `ActionType` để có thể lấy ra được type của `Actions` từ `actions` mà các bạn đã khai báo ở mục trước `todoActions`.
```typescript
import { ActionType } from 'typesafe-actions';
import {todoActions} from './actions';

type TodoActions = ActionType<typeof todoActions>;
```
Vậy là xong. Các bạn hoàn toàn có thể tìm hiểu thêm về `ActionType` tại Github của `typesafe-actions` nhé. Đừng hoa mắt :P

Kế tiếp là viết `Reducers` thôi:
```typescript
import { Reducer } from 'redux';

// Cách viết thông thường
export const todoReducer: Reducer<Readonly<TodoState>, TodoActions> = (state = initialState, action) => {
  switch (action.type) {
    // your reducers
  }
}
```
Đây là cách viết thông thường dùng `switch` và cách type dùng `Reducer` từ `@types/redux`. `switch` sẽ kiểm tra từng `action.type` mà chúng ta có:
1. ADD_TODO
2. UPDATE_TODO
3. DELETE_TODO
4. TOGGLE_TODO
5. TOGGLE_ALL
6. CLEAR_COMPLETED
7. SET_FILTER

và sẽ return về state mới dựa trên 1 trong 7 actions này. Các bạn đang thắc mắc là giờ mình phải tự viết 7 cái `case` này rồi phải ghi từ `action` ra theo dạng `string` (`'ADD_TODO'`) vì mình không dùng `constant` như: `const ADD_TODO = 'ADD_TODO';`. Không hề, bây giờ trình soạn thảo của các bạn đã có đầy đủ thông tin mà `TodoActions` cung cấp, các bạn chỉ cần đặt cursor lên `switch` và dùng gợi ý của trình soạn thảo, trình soạn thảo sẽ viết ra đầy đủ 7 `case` này cho bạn. Quá đã đúng không?
<blockquote style="text-align: center" class="imgur-embed-pub" lang="en" data-id="a/Uy1rniK"><a href="//imgur.com/a/Uy1rniK"></a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script> 
 
Bên cạnh đó, `TodoActions` còn cung cấp đúng type cho tất cả payload cho từng `action.type`. 
<blockquote class="imgur-embed-pub" lang="en" data-id="a/rAOezFr"><a href="//imgur.com/a/rAOezFr"></a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>
 
Ở những ứng dụng `React` mà áp dụng `Redux`, chúng ta thường thấy có nhiều reducers, mỗi reducer tượng trưng cho một phần state trong State tổng thể của toàn bộ ứng dụng, state tổng thể này thường gọi là `AppState` và các reducers thường được truyền vào store dưới dạng `rootReducers`.
```typescript
export const rootReducers = combineReducers({
  todoState: todoReducer,
  authState: authReducer
})
```
và sau đây là `AppState`:
```typescript
interface AppState {
  todoState: TodoState;
  authState: AuthState;
}
// TodoState chính là interface TodoState mà chúng ta khai báo ở todoReducer.
```

Hmm, có vẻ lặp lại qúa đúng không? Chúng ta có thể áp dụng `ReturnType` ở đây để không phải định nghĩa lại `AppState` bằng các interface mà chúng ta đã viết rồi:
```typescript
// vì dùng ReturnType, nên chúng ta sẽ chuyển AppState sang Type Alias 
type AppState = ReturnType<typeof rootReducers>; 
```
Vì sao nó lại hoạt động? Nếu để ý, các bạn sẽ thấy đc `combineReducers` là 1 Function và sẽ return về theo dạng như sau:
```typescript
{
  todoState: ReturnType<typeof todoReducer>;
  authState: ReturnType<typeof authReducer>;
}
``` 
Với kiến thức trên, mình có thể dùng `ReturnType` để lấy được type của giá trị trả về của `combineReducers` và đó chính là `AppState` của mình.

Tại sao mình cần `AppState`? Câu trả lời là các bạn sẽ cần tới `AppState` khi sử dụng: `mapStateToProps` và `mapDispatchToProps` với `connect()`. Đọc đến đây, có lẽ các bạn cũng đang thắc mắc là: Bây giờ 1 component kết nối với Redux thì làm sao mà type được props cho Component này? Vì props của Component thường sẽ được cung cấp từ `state` và `actions` mà. Chúng ta sẽ quan sát snippet sau nhé:
```typescript jsx
const mapStateToProps = (state: AppState) => ({
  todos: state.todoState.todos
  // ...
})

const mapDispatchToProps = {
  addTodo: todoActions.addTodo
  // ...
}

export default connect(mapStateToProps, mapDispatchToProps)(TodoList);

// TodoList.tsx
type TodoListProps = {
  // type cái gì bây giờ?
}
const TodoList: FC<TodoListProps> = props => {...}
```
"Type cái gì bây giờ?" Các bạn hoàn toàn có thể lặp lại các props:
```typescript
todos: Todo[];
addTodo: (content: string) => Action;
```
nhưng như thế này thì không DRY chút nào (DRY - Do not Repeat Yourself). Chúng ta lại tiếp tục áp dụng `Type Composition` và `Utility Types` thôi:
```typescript
const mapStateToProps = (state: AppState) => ({
  todos: state.todoState.todos
  // ...
})

const mapDispatchToProps = {
  addTodo: todoActions.addTodo
  // ...
}

type TodoListProps = ReturnType<typeof mapStateToProps> & typeof mapDispatchToProps;

const TodoList: FC<TodoListProps> = props => {...}

export default connect(mapStateToProps, mapDispatchToProps)(TodoList);
```
Và bây giờ, mọi thứ đã gọn gàng hơn và `TypeScript` cũng sẽ vui vẻ với bạn hơn vì tất cả đã được type 1 cách chính xác và DRY. `props` của `TodoList` sẽ có: `props.children`, `props.todos` và `props.addTodo`.

Đây là cách sử dụng `Redux` với `TypeScript`. Các bạn thấy sao? Kích thích không :P? Nếu chưa kích thích, thì mình hy vọng mục cuối của bài viết "dài đăng đẳng" này sẽ giúp các bạn kích thích hơn, đó là `Generic Component`

### Generic Component
Generic Component là 1 Component có thể dùng với nhiều dạng type khác nhau. Thông thường, Generic Component sẽ là `Render Props` hoặc `Children Render`. Mình xin lấy ví dụ từ ứng dụng `React Native` mình viết: [rn-movies](https://github.com/nartc/rn-movies). Ở trong ứng dụng này, mình có viết 1 Generic Component, các bạn có thể tìm thấy tại: [MediaDetailHorizontalList](https://github.com/nartc/rn-movies/blob/master/src/shared/ui/MediaDetail/MediaDetailHorizontalList.tsx).
![image](https://camo.githubusercontent.com/144b1825ad199473f555ecae0e313bf63a1c8b4d/68747470733a2f2f692e6962622e636f2f4834473272305a2f696d6167652e706e67)
Như hình trên, các bạn có thấy phần `Casts` và `Crews` không? Đây chính là generic component `MediaDetailHorizontalList`. Điểm chung của component này là: 
1. Render 1 list có thể scroll theo chiều ngang.
2. Mỗi item trong list là: Image và 1 số thông tin về item theo dạng text.
3. Style cho Image và Text là như nhau.

`Cast` và `Crew` là 2 type khác nhau (và còn 1 số khu vực khác áp dụng `MediaDetailHorizontalList` nữa => type khác nhau) nhưng mình cần 1 Component có thể nhận vào 1 Generic Type và có thể render được ít nhất là phần List, Image và 1 số style chung của các items. `Generic Component` và `Children Render` sẽ giúp được mình trong trường hợp này, các bạn cùng xem qua code nhé:
```typescript jsx
type MediaDetailHorizontalListProps<T> = {
  items: T[];
  imageProp: keyof T;
  children: (item: T) => ReactNode;
  wrapperStyle?: StyleProp<ViewStyle>;
  onPress?: (item: T) => void;
  height?: number;
  width?: number;
};

function MediaDetailHorizontalList<T>(props: MediaDetailHorizontalListProps<T>) {
  const { items, imageProp, children, onPress, height = 150, width = 100, wrapperStyle = {} } = props;

  const renderContent = (item: T, index: number) => (
    <Card
      key={ index.toString() }
      image={ { uri: item[imageProp] as unknown as string } }
      imageStyle={ { height, width } }
      containerStyle={ { ...styles.container, width } }
      wrapperStyle={ wrapperStyle }>
      { children(item) }
    </Card>
  );

  return useMemo(() => (
    (
      <ScrollView horizontal showsHorizontalScrollIndicator={ false }>
        { items.map((item, i) => (
          !!onPress ? <TouchableOpacity key={ i.toString() } onPress={ () => onPress(item) }>
            { renderContent(item, i) }
          </TouchableOpacity> : renderContent(item, i)
        )) }
      </ScrollView>
    )
  ), [items, imageProp]);
}

export default MediaDetailHorizontalList;
``` 
Đây là code của toàn bộ `MediaDetailHorizontalList`, các bạn chỉ cần để ý dùm mình:
1. `type MediaDetailHorizontalListProps<T>`. Ở đây, mình sẽ truyền vào 1 generic type `T` cho `MediaDetailHorizontalListProps` để type `T` cho những properties khác có trong props này.
2. `children: (item: T) => ReactNode`. Vì mình dùng `Children Render` nên mình phải type lại `children` là 1 Function thay vì chỉ là `ReactNode` mà `PropsWithChildren` cung cấp.
3. `children(item)`. Ở đây, mình dùng `children()` và truyền vào `item` có type `T` để đảm bảo rằng `Children Render` trả về type chính xác.

Sau đây là cách sử dụng `MediaDetailHorizontalList`:
```typescript jsx
<MediaDetailSection sectionTitle={ 'Casts' }>
 <MediaDetailHorizontalList items={ movie.credits.cast } imageProp={ 'profile_path' }>
   { item => (
     <>
       <Text style={ { fontSize: 10, textAlign: 'center' } }>{ item.name }</Text>
       <Text style={ { fontSize: 8, textAlign: 'center' } }>as</Text>
       <Text style={ { fontSize: 10, textAlign: 'center' } }>{ item.character }</Text>
     </>
   ) }
 </MediaDetailHorizontalList>
</MediaDetailSection>

{ !!movie.credits.crew.length && (
 <MediaDetailSection sectionTitle={ 'Crews' }>
   <MediaDetailHorizontalList items={ movie.credits.crew } imageProp={ 'profile_path' }>
     { item => (
       <>
         <Text style={ { fontSize: 10, textAlign: 'center' } }>{ item.name }</Text>
         <Text style={ { fontSize: 8, textAlign: 'center' } }>as</Text>
         <Text style={ { fontSize: 10, textAlign: 'center' } }>{ item.job }</Text>
       </>
     ) }
   </MediaDetailHorizontalList>
 </MediaDetailSection>
) }
```

Theo mặc định, `movie.credits.crew` là `Crew[]` còn `movie.credits.cast` là `Cast[]`. Để ý ở trên type của `MediaDetailHorizontalListProps<T>` nhận vào 1 `T`, mình truyền `T` ở đâu? Bên trong `MediaDetailHorizontalListProps` mình có: `items: T[]`. Khi mình truyền, `Cast[]` (hoặc `Crew[]`) vào cho `items` thì `TypeScript` tự động lấy `Cast` (hoặc `Crew`) và gán cho `T`. Nói cách khác, nếu mình truyền `movie.credits.cast` vào cho `items`, thì lúc đó `MediaDetailHorizontalList` của mình sẽ hoạt động dựa trên type là `Cast` (tương tự cho `Crew`).

Điều này giúp ích gì? Để ý hơn, các bạn sẽ thấy rằng phần `Children Render` của cả 2 `Cast` và `Crew` khá giống nhau, nhưng mình muốn dùng những giá trị khác nhau trên `Cast` và `Crew`: như ở `Cast` mình muốn hiển thị `cast.character` để biết được diễn viên này đóng vai gì trong phim, còn ở `Crew` thì mình muốn hiển thị `crew.job` để biết được người này làm vai trò gì trong đoàn phim. Khi dùng `Children Render` với Generic Type `T`, thì `item` của mình trong đoạn `Children Render` sẽ có type đúng với gì mà mình truyền vào cho `items`. Các bạn xem đoạn GIF này nhé:
<blockquote class="imgur-embed-pub" lang="en" data-id="a/390qRH0"><a href="//imgur.com/a/390qRH0"></a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>

Và với `Generic Component`, mình đã có 1 Component có thể tái sử dụng ở nhiều nơi với nhiều dạng giá trị khác nhau mà vẫn có thể `render` thêm những phần khác biệt dựa vào type của `items` truyền vào. 

`Generic Component` nói riêng, `Generics` nói chung là 1 kỹ năng khó. Để hiểu được, các bạn cần phải xác định được khi nào cần áp dụng và phải áp dụng nhiều thì mới có thể tiến bộ với `Generics` được. Và lợi ích mà `Generics` mang lại thực sự là rất lớn, các bạn cố gắng nhé.

### Summary 
Bài viết dài quá nhỉ? Các bạn có mệt không? Nhưng có thấy kích thích không? `React` và `TypeScript` không quá xa lạ nhưng thực sự cũng không gần gũi với cộng đồng lập trình viên. Trong bài này, chúng ta đã tìm hiểu sâu hơn về:
1. Utility Types
2. Type Composition
3. Ứng dụng trong Redux
4. Generic Component

Hy vọng qua bài viết này, các bạn sẽ thấy gần gũi và quen thuộc hơn với `TypeScript`. Nhưng "học đi đôi với hành", mình trông chờ các dự án `React` + `TypeScript` của các bạn đây. Chúc các bạn may mắn, thành công và vui vẻ 😘

### Resources 
1. [React-TypeScript-CheatSheet](https://github.com/typescript-cheatsheets/react-typescript-cheatsheet)
2. [Typescript](https://typescriptlang.org)
