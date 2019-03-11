Nếu bạn đã, đang và muốn trở thành 1 JavaScript Developer? Chắc chắn bạn phải học về Script Program được _executed_ bên trong như thế nào. Việc hiểu những nội dung như **execution context** _(exec context)_ và **execution stack** _(exec stack)_ là rất quan trọng. Bởi vì nó giúp ta hiểu được các khái niệm khác nữa trong JavaScript như _Hoisting_, _Scope_ và _Closures_.

Việc hiểu rõ các khái niệm này sẽ khiến bạn trở thành 1 JavaScript developer giỏi hơn rất nhiều. Vậy thì ta bắt đầu tìm hiểu thôi nào!

## Execution Context là gì?

Ta hiểu đơn giản rằng, 1 _**execution context**_ là 1 khái niệm trừu tượng của môi trường. Nơi mà các đoạn mã JavaScript được _**evaluated**_và _**executed**_. Bất kì đoạn mã nào run trong JavaScript, nó sẽ chạy bên trong _**exec context**_.

### Các loại Execution Context trong JavaScript

_**Execution contex**_**t** trong JavaScript được chia thành 3 loại:

#### **Global Execution Context:**

*   Đây là **execution context** mặc định hay còn là base **execution context**. Những đoạn code không trong bất cứ function nào sẽ được _**executed**_trong global **execution context**.

*   Nó làm 2 nhiêm vụ: 1, Tạo global object - gọi là window object ( Trong trường hợp là browsers ) và thứ 2 là gắn _value_ của `this` với global object này. Điều cuối cùng là chỉ có **duy nhất** 1 global **execution context** trong 1 chương trình.

#### Function Execution Context

Mỗi lần 1 function được _invoked_, sẽ có 1 **excution context** mới được tạo ra cho function đó. Mỗi function sẽ có **execution contex**t riêng của nó. Nhưng chỉ được tạo ra khi function được _invoked_ hoặc được _called_.

Và có thể có rất nhiều _function **execution context**_. Bất kể khi nào 1 **execution context** mới được gọi. Nó sẽ trải qua 1 chuỗi các _steps_ theo thứ tự xác định - ta sẽ thảo luận nó sau.

#### **Eval Function Execution Context**

*   Code mà được _executed_ bên trong 1 `eval` function cũng có những execution context riêng của nó, nhưng vì `eval` không được sử dụng nhiều bởi các developers JavaScript, nên ta sẽ không thảo luận nó trong bài này.

## Execution Stack

**Execution stack** còn được biết đến là "calling stack" trong các ngôn ngữ lập trình khác. Đây là 1 stack với cấu trúc **LIFO** ( Last in, First Out ). Được sử dụng để lưu giữ tất cả exec context đã được tạo ra trong suốt chương trình.

Khi JavaScript Engine _encounter_ những đoạn _script_ của bạn lần đầu tiên. Nó sẽ tạo ra global exec context và đẩy nó vào trong execution stack hiện tại. Mỗi khi mà engine tìm được 1 _function invocation_, nó sẽ tạo ra 1 exec context mới cho function đó. Sau đó đẩy nó lên trên đỉnh của stack.

Engine sẽ thực thi function mà exec context ở trên đỉnh của stack trước. Sau khi function này _complete_ nó sẽ bị đẩy ra khỏi stack. Và control sẽ đi tới context phía dưới trong stack.

Để hiểu rõ hơn ta sẽ cùng xem đoạn code phía dưới:

    let a = 'Hello World!';

    function first() {  
      console.log('Inside first function');  
      second();  
      console.log('Again inside first function');  
    }

    function second() {  
      console.log('Inside second function');  
    }

    first();  
    console.log('Inside Global Execution Context');

<figure class="wp-block-image">![Execution Context Execution Stack Coders-Tokyo](https://res.cloudinary.com/djeghcumw/image/upload/c_scale,q_100,w_1000/v1551898475/blog/excutionStack-CodersTokyo.png)</figure>

_Credit: [Sukhjinder Arora](https://blog.bitsrc.io/@Sukhjinder?source=post_header_lockup)_

Khi đoạn code phía trên _load_ trong browser. JavaScript Engine tạo ra 1 global execution context rồi đẩy nó vào execution stack hiện tại. Khi lần gọi `first()` diễn ra, JavaScript engines tạo ra 1 execution context cho function đó và đẩy nó lên trên đỉnh của execution stack.

Đến khi `second()` function được gọi trong `first()` function, JavaScript engine lại tạo ra 1 execution context mới cho function này rồi tiếp tục đẩy nó lên trên đỉnh của excuution stack. Sau khi `second()` function kết thúc, nó bị _pop_ra khỏi stack, và control lại đi tiếp tới execution context bên dưới - đó là `first()` execution context.

Cho tới khi `first()` function kết thúc, execution stack của nó bị xóa khỏi stack và control đi tiếp tới global execution context. Khi tất cả code được _executed_JavaScipt engine xóa gloabl execution context khỏi stack.

## How is the Execution Context create?

Đến đây, ta đã thấy JavaScript engine đã quản lí những execution context như thế nào. Bây giờ, chúng ta sẽ tìm hiểu xem 1 execution context được tạo ra kiểu gì bởi JavaScript engine.

Execution context được tạo ra qua 2 giai đoạn: **1) Create Phase** và **2) Execution Phase**

### The Create Phase

Trước khi code JavaScript được _executed_, execution context đi qua giai đoạn _creation phase_. 3 điều xảy ra trong suốt giai đoạn _creation phase_ là:

1.  Value of **this** được xác định, còn được gọi là **This Binding**.
2.  **LexicalEnvironment** component được khởi tạo
3.  **VariableEnvironment** component được khởi tạo

    ExecutionContext = {  
      ThisBinding = <this value>,  
      LexicalEnvironment = { ... },  
      VariableEnvironment = { ... },  
    }

#### This Binding

Trong global execution context, value of `this` tham chiếu tới global object. (`this` tham chiếu tới Window Object).

Trong function execution context, value of `this` phụ thuộc vào cách function được gọi như thế nào. Nếu nó được gọi bởi 1 object reference, thì value of `this` được gán vào object đó, nếu không thì value of `this` được gán vào global object hoặc `undefined`` ( in strict mode ). Ví dụ:

    let person = {  
      name: 'peter',  
      birthYear: 1994,  
      calcAge: function() {  
        console.log(2018 - this.birthYear);  
      }  
    }

    person.calcAge();   
    // 'this' refers to 'person', because 'calcAge' was called with //'person' object reference

    let calculateAge = person.calcAge;  
    calculateAge();  
    // 'this' refers to the global window object, because no object reference was given

#### Lexical Environment

Docs của bản ES6 chính thức đã định nghĩa Lexical Environmnet như sau:

> Lexical Environment là 1 "loại kỹ thuật" được dùng để _define_ sự kết hợp của _Identifiers_ tới các variables riêng biệt và những functions dựa trên **lexical nesting structure of ECMAScript code**. 1 Lexical Environment bao gồm 1 Environment Record và 1 biến null có thể tham chiếu tới Lexical Environment bên ngoài.

Ta hiểu đơn giản hơn như sau: `Lexical Environment là 1 cấu trúc giữ **identifier-variable mapping** (ở đây **identifier** tham chiếu tới tên của variables/function, và **variable** là 1 tham chiếu tới những actual object. [bao gồm function type object] hoặc [primitive value])`

Trong Lexical Environment, được chia ra thành 2 components: (1) **environment record** và (2) là 1 **reference to outer environment**

1.  **Environment record** là 1 nơi mà variable và function declaration được lưu trữ.
2.  **Refernce to the outer environment** có nghĩa là nó truy cập tới lexical environment bên ngoài của nó.

Lexical environment lại được chia tiếp ra thành 2 loại:

*   **Global environment** (trong global exec context) là 1 Lexical Environment - không có outer environment. Outer environment reference của _global environment_ là `null`. Nó có global object (window object) và những methods hay properties.
*   (vd. array methods) bên trong **environment record** như các variables được người dùng định nghĩa. Và value of `this` sẽ tham chiếu tới global object.
*   **Function environment:** Tại đây, các variables được định nghĩa bên trong function sẽ được lưu giữ tại **environment record**. Sự tham chiếu tới outer environment có thể là global environment hoặc 1 **outer function environment** đang chứa **inner function**

#### **Chú ý**

Với **function environment**, _environment record_ còn chứa 1 `arguments` object mà nó _contain_ mapping giữa các _index_ và các _argument_được truyền vào function và _length number_ của những arguments đó nữa. Ví dụ 1 argument object của function phía dưới được thể hiện như sau:

    function foo(a, b) {  
      var c = a + b;  
    }  
    foo(2, 3);

    // argument object  
    Arguments: {0: 2, 1: 3, length: 2},

Trong **environment record** lại được chia tiếp ra thành 2 loại:

*   **Declarative environment record**: lưu trữ những variables, functions, và các parameters. 1 _function environment_ chứa _declarative environment record_.
*   **Object environment record**: dùng để xác định mối liên kết giữa những variable và function xuất hiện trong _global execution context_. 1 _global environment_ chứa _object environment record_.

1 cách trừu tương, lexical environment sẽ được biểu diễn như sau:

    GlobalExectionContext = {  
      LexicalEnvironment: {  
        EnvironmentRecord: {  
          Type: "Object",  
          _// Identifier bindings go here_ }  
        outer: <null>  
      }  
    }

    FunctionExectionContext = {  
      LexicalEnvironment: {  
        EnvironmentRecord: {  
          Type: "Declarative",  
          _// Identifier bindings go here_ }  
        outer: <Global or outer function environment reference>  
      }  
    }

#### Variable Environment:

Nó cũng được coi là Lexical Environment. Bên cạnh đó, Environment record của nó sẽ giữ những bindings được tạo ra bởi các VariableStatements trong **exec context**.

Như đã nói bên trên, variable environment cũng là 1 lexical environment. Vì thế nó cũng có những properties của 1 lexical environment.

Trong ES6, 1 điều khác biệt giữa **LexicalEnvironmet** component và **VariableEnvironment** là "the former" được sử dụng để lưu giữ function declaration và các variables ( `let` và `const` ), sau này thì nó chỉ được dùng để lư giữ variable ( `var` ) bindings thôi.

Đoạn code bên dưới sẽ làm rõ những gì chúng ta vừa thảo luận bên trên:

    let a = 20;  
    const b = 30;  
    var c;

    function multiply(e, f) {  
     var g = 20;  
     return e * f * g;  
    }

    c = multiply(20, 30);

The **exec context** sẽ được biểu diễn như sau:

    GlobalExectionContext = {

      ThisBinding: <Global Object>,

      LexicalEnvironment: {  
        EnvironmentRecord: {  
          Type: "Object",  
          // Identifier bindings go here  
          a: < uninitialized >,  
          b: < uninitialized >,  
          multiply: < func >  
        }  
        outer: <null>  
      },

      VariableEnvironment: {  
        EnvironmentRecord: {  
          Type: "Object",  
          // Identifier bindings go here  
          c: undefined,  
        }  
        outer: <null>  
      }  
    }

    FunctionExectionContext = {  

      ThisBinding: <Global Object>,

      LexicalEnvironment: {  
        EnvironmentRecord: {  
          Type: "Declarative",  
          // Identifier bindings go here  
          Arguments: {0: 20, 1: 30, length: 2},  
        },  
        outer: <GlobalLexicalEnvironment>  
      },

    VariableEnvironment: {  
        EnvironmentRecord: {  
          Type: "Declarative",  
          // Identifier bindings go here  
          g: undefined  
        },  
        outer: <GlobalLexicalEnvironment>  
      }  
    }

#### **Chú ý**

Function **exec context** chỉ được tạo ra khi lời gọi `multiply`functon được _encountered_.

Như bạn thấy, `let` và `const` variables được định nghĩa những lại không có bất kì value assoiated nào, nhưng khi `var` variables được định nghĩa thì lại được gán là `undifined`.

Lý do là vì trong suốt quá trình _creation phase_, các mã code của ta sẽ được **scanned** cho các variable và function declarations, trong khi function declaration được lưu giữ trong environment của riêng nó, thì các variables được khởi tạo lại được gán là `undefined` (trong trường hợp `var`) hoặc là `uninitialized` (trong trường hợp `let` và `const`).

Đó là lý do vì sao bạn có thể truy cập những `var` variables được _defined_ trước khi mà chúng được _declared_ (mặc dù vẫn là `undefined`) nhưng bạn sẽ gặp phải lỗi tham chiếu khi truy cập các `let` và `const` variables trước khi chúng được _declaraed_.

**This is, what we call hoisting**.

### Execution Phase

Đây là phần đơn giản nhất trong bài. Trong giai đoạn này, khi các assignments tới tất cả các variables đã xong. Lúc đó, mã code của chúng ta sẽ được executed.

_*Chú ý_ - Trong suốt giai đoạn execution*, nếu Javascript engine không thể tìm thế value of `let` variable mà đã được daclared trong source code, nó sẽ gán value đó là `undefined`

## Conclusion

Vậy là chúng ta đã cùng thảo luận chương trình JavaScript được executed bên trong ra sao. Bạn không cần phải học hết tất cả các khái niệm trên để trở thành 1 JavaScript developer giỏi. Nhưng việc hiểu được những khái niệm này sẽ giúp bạn rất nhiều. Bạn sẽ dễ dàng học sâu hơn về các khái niệm khác như **Hoisting**, **Scope**, **Closures.**
