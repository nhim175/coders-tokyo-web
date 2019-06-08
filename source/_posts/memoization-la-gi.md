---
title: Memoization là gì?
date: 2019-06-08 22:17:00
authorId: chau_tran
tags: javascript, memoization, optimization
---

![Memoization](https://thumbs-prod.si-cdn.com/TGNrXf-ps79MO_sMCduCjt9mHKY=/fit-in/1600x0/https://public-media.si-cdn.com/filer/55/14/5514f063-5778-431d-92c5-8d82a575b99e/darpa_brain_image1.jpg)
Với môi trường "_tràn ngập_" các frameworks (techs, tech) trong giới **Front-End** như hiện nay, việc quan trọng đối với 1 lập trình viên (Developer, Dev) không phải là "biết càng nhiều thứ càng tốt" mà là "biết càng kĩ càng tốt". Và ở bài viết hôm nay, mình sẽ giới thiệu cho các bạn một kỹ thuật để giúp các bạn cải thiện được **performance** trong những dự án của mình. Kĩ thuật đó có tên là: **Memoization**

<!-- more -->

# 1. Memoization là gì?

Trong lập trình máy tính, _memoization_ là một kĩ thuật tối ưu hoá được sử dụng để lưu trữ kết quả của những phép tính tiêu hao nhiều tài nguyên (loop ở số lượng phần tử lớn, hoặc làm việc với videos hoặc images). Khi một hàm "_memoized_" (memoized function) được thực thi từ lần thứ 2 trở đi, nếu như đầu vào (inputs) của hàm không thay đổi, thì kết quả được lưu trữ (cached results) sẽ được trả về mà không cần phải lặp lại "_phép tính đắt đỏ kia_".

    // pseudo code: normal function
    function someFunction(someInput) {
        return doExpensiveComputation(someInput);
    }

Ở đây, mình có 1 hàm `someFunction` nhận vào `someInput` và sẽ trả về giá trị của `doExpensiveComputation(someInput)`. Thông thường nếu như không **memoized**, mỗi lần `someFunction()` được gọi với bất kỳ `someInput` nào (đã thay đổi hay chưa thay đổi) thì hàm `doExpensiveComputation` vẫn sẽ luôn luôn được thực thi trở lại. Thử tưởng tượng trong hàm này, mình loop hàng trăm ngàn -> hàng triệu phần tử thì thật là lãng phí phải ko?

> "_Memoization to the rescue_"

    // pseudo code: memoized function
    let results = {};
    function someFunction(someInput) {
    	if (results[someInput] === null) {
    		return results[someInput] = doExpensiveComputation(someInput);
    	}
    	return results[someInput];
    }

Ở block này, các bạn hiểu nôm na là mình sẽ có 1 `Object` là **results** với dạng là:

    {
        [someInput: any]: ExpensiveComputationResult;
    }

Nghĩa là với mỗi `input`, mình sẽ gán giá trị của `doExpensiveComputation(input)` cho `input` đó. Khi chạy hàm `someFunction`, nếu như `input` nào chưa có trong `results` thì mình sẽ chạy `doExpensiveComputation` rồi _cache_ lại giá trị của `doExpensiveComputation` cho `input` đó trong `resulst` bằng dòng: `results[someInput] = doExpensiveComputation(someInput)` và ở lần chạy tiếp theo với 1 `input` không thay đổi (nghĩa đã có _cached_) thì `someFunction` chỉ cần trả về `results[someInput]` mà không cần phải lặp lại `doExpensiveComputation`.

Nghe qua khái niệm và xem qua `pseudo-code` thì có thể một số bạn đã bắt đầu thấy "dội" rồi phải không? Thực sự, nó không quá nhức đầu đâu, các bạn cũng không nhất thiết phải tìm hiểu cặn kẽ để có thể áp dụng **memoization**. Sau đây, mình sẽ sử dụng `React` để demo tác dụng của **memoization** nhưng **memoization** là kĩ thuật có thể áp dụng ở bất cứ đâu nhé.

# 2. Demonstration

Các bạn nếu muốn làm theo thì có thể vào CodeSandbox này: [https://codesandbox.io/s/vigorous-sea-2pszx](https://codesandbox.io/s/vigorous-sea-2pszx)

Ở đây, mình đang có một component `App` đang có: - `useState` hook cho biến `count` và hàm `setCount` - `render` biến `count` này và có 1 `button` để tăng giá trị của `count` 1 đơn vị mỗi lần được `click`.

    function App() {
        const [count, setCount] = useState(0);

    	// log xem component này được rerender với giá trị count
    	console.log('Render with count: ', count);

    	return (
    		<div className="App">
    			<button  onClick={() =>  setCount(count + 1)}>
    				Increment count
    			</button>
    			<p>{count}</p>
    		</div>
    	);
    }

Theo các bạn thấy thì ở đây khi state `count` được thay đổi giá trị, component `App` sẽ được render lại với giá trị mới của `count`.

Kế tiếp, mình sẽ thêm vào code như sau: - Các bạn vào link này: [https://codesandbox.io/s/reverent-bush-jfjb1](https://codesandbox.io/s/reverent-bush-jfjb1) và copy array `comments` - Quay lại CodeSandbox, các bạn tạo 1 file `mock.js` và `export default [...]` (`[...]` chính là array `comments` các bạn vừa copy từ **JSONPlaceholder**) - Quay lại `index.js`, các bạn `import mock from './mock'`. Bây giờ trong `index.js` mình đã có truy xuất được đến array `comments` ở `mock` - Tạo 1 function mới tên là `getItems(start)`

    function getItems(start) {
        // trả về 1 array gồm 100 phần từ tính từ start
    	return mock.slice(start, start + 100);
    }

    function App() {...}

Quay lại `App` component, mình sẽ thêm code như sau: - Thêm 1 state nữa với `useState`: `const [input, setInput] = useState(0);`. Đây chính là `input` mà mình sẽ truyền vào cho `getItems()` - Thêm 1 ref với `useRef`: `const testItemsRef = useRef()`. Đây là 1 biến tạm để mình so sánh với giá trị được trả về từ `getItems()`. Tại sao dùng `useRef` thì xin hẹn các bạn ở 1 bài viết khác nhé 😛 - Ngay bên dưới mình sẽ thêm code như sau:

    const listItems = getItems(input);
    // thực thi hàm getItems với giá trị hiện tại của input

    console.log('Render with...'); // console log count

    // Ở đây, mình dùng useEffect để chạy đoạn code này trên mỗi lần
    // rerender. Mình kiểm tra xem testItemsRef.current có null không
    // Nếu không null, mình sẽ so sánh Equality Comparison
    // giữa testItemsRef.currrent và items bằng ===
    // Nếu như reference khác nhau, nghĩa là 2 biến này trỏ vào
    // 2 vùng nhớ khác nhau trên Memory, thì sẽ trả false, và ngược lại.
    useEffect(() => {
    	if (testItemsRef.current) {
    		console.log('useEffect - is testItemsRef reference the same as items reference?', testItemsRef.current === items);
    	}
    })

    // Ở useEffect này, mình sẽ chạy effect này sau mỗi lần
    // biến count thay đổi. Và mình sẽ gán giá trị của items
    // cho testItemsRef.current bằng =. Có nghĩa là gán theo reference.
    // Sau khi gán, thì nếu items không thay đổi reference thì
    // khi so sánh === giữa 2 biến này, mình sẽ nhận được true.
    useEffect(() => {
    	console.log('useEffect - count changed --> assigning items to testItemsRef');
    	testItemsRef.current = items;
    }, [count]);

Vậy là xong phần setup. Giờ đến `render`:

    return (
    	...
    	<p>{count}</p>
    	<button onClick={() => setInput(input + 5)}>Change Input</button>
    	<p>{input}<p>
    	<ul>
    		{items.map(item => (
    			<li key={item.id}>
    				<pre>{JSON.stringify(item, 0, 2)}</pre>
    			</li>
    		))}
    	</ul>
    )

Ở đoạn code này, mình thêm vào 1 `button` nữa để tăng `input` lên 5 đơn vị sau mỗi `click`. Bên cạnh đó, mình cũng render 1 Unordered List (`ul`) với `items` được tính toán ở trên với hàm `getItems()`. Và mình chỉ render `object item` trong array `items` thôi chứ không làm gì thêm.

Khâu chuẩn bị đã xong rồi, để tiện cho các bạn theo dõi, mình có những ghi chú sau: 1. `App` sẽ rerender khi `count` thay đổi hoặc `input` thay đổi. Thay đổi `count` hoặc `input` bằng cách `click` vào `button` tương ứng. 2. Cả 2 `useEffect` sẽ được thực thi lần đầu sau lần render đầu tiên. Nghĩa là sau khi `refresh` CodeSandbox, các bạn sẽ thấy trong console 2 logs: một log là `Render with count...`, và một log là `Assigning items...`. Log so sánh vì mình check null của `testItemsRef` nên ở lần render đầu tiên, `testItemsRef` vẫn là null nên hàm trong `useEffect` đầu tiên không chạy tới `console.log` được. 3. `useEffect` thứ 2 phụ thuộc vào biến `count`. Nghĩa là `useEffect` này chỉ chạy khi `count` thay đổi. Khi `useEffect` này chạy, mình gán giá trị của `items` cho `testItemsRef.current`.

Bây giờ, các bạn hãy chạy thử. Đây là log của lần render đầu tiên:
![log 1](https://i.imgur.com/Msppsx5.png)

Các bạn lưu ý là tại thời điểm này thì: `items` đã có giá trị và `testItemsRef` cũng đã có giá trị. Nếu như mình so sánh `testItemsRef.current === items` trước khi chạy lại dòng: `const items = getItems(input)` thì chắc chắn mình sẽ nhận được giá trị `true` vì tại thời điểm này cả 2 biến này đang trỏ đến 1 Array giống nhau trong Memory. Và các bạn cũng lưu ý là `input` mình chưa thay đổi nhé. Tiếp theo, các bạn hãy `increment count` 1 lần và check log:
![log 2](https://i.imgur.com/JWH03B1.png)
Các bạn có thấy gì đặc biệt không? `testItems` và `items` reference không giống nhau. Tuy nhiên, cả 2 đang giữ giá trị như nhau vì `input` chưa thay đổi. Điều này chứng tỏ là `getItems()` đã được thực thi 1 lần nữa, và `mock.slice()` đã trả về 1 Array hoàn toàn mới, dẫn đến trong Memory bây giờ đã có 2 Array rồi. Và giả sử thay vì chỉ trả về 100 phần tử, các bạn trả về tới cả trăm ngàn, hoặc làm việc với canvas / image manipulation thì đây có phải là tốn tài nguyên một cách không cần thiết không? Và với những frontend framework như Angular và React, thay đổi reference đồng nghĩa với rerender lại UI. Nếu UI phức tạp, các bạn lại tiêu tốn thêm tài nguyên để rerender lại cái UI đáng ra không có gì thay đổi.

May mắn là các frontend framework này đều có cách để chúng ta làm việc hiệu quả, điển hình là `React` cung cấp cho developers 1 công cụ khá hay ho, đó là: `useMemo`. (Memo viết tắt của Memoization, chứ không phải memory đâu nhé 😄). Câu hỏi bây giờ là "dùng `useMemo` ở đâu?" và "cú pháp của useMemo như thế nào?".

### useMemo

1. Syntax: `useMemo<Result>(create: () => Result, dependencies: any[])`. Ở đây, mình viết cú pháp sơ sơ của `useMemo` có types để các bạn dễ hình dung. `useMemo` là 1 function -> nhận vào 1 function và 1 array các dependencies. Function truyền vào cho `useMemo` phải return 1 gía trị, và khi 1 trong các dependencies thay đổi, thì `useMemo` sẽ thực thi lại Function được truyền vào.
2. Dùng ở đâu: Các bạn nghĩ xem mình chỗ nào **thực sự** mình return giá trị của `items` nhỉ? `getItems()`? Không phải đâu, chỗ cần dùng là `mock.slice()` đấy.

Quay lại demo, các bạn thêm code này vào để áp dụng `useMemo` nhé:

    function getItems(start) {
    	return useMemo(() => mock.slice(start, start + 100), [start]);
    }

Đoạn code trên hiểu như thế nào đây nhỉ? Nếu xem lại cú pháp của `useMemo` thì mình truyền vào `() => mock.slice(start, start + 100)` cho Function và truyền vào `[start]` cho Dependencies của `useMemo`. Bây giờ, `useMemo` sẽ trả về giá trị của `mock.slice()` khi được thực thi. Nếu `start` thay đổi so với lần gọi trước, thì `useMemo` sẽ trả về giá trị được cached. Hiểu nôm na vậy nhé. Bây giờ chúng ta có thể chạy lại demo và xem sự khác biệt.
![enter image description here](https://i.imgur.com/kMjQheB.png)
Ồ, bây giờ sau khi tăng biến `count` thì `testItemsRef` và `items` đã có chung reference rồi. Điều này chứng tỏ là `useMemo` đã return giá trị được cached về cho `items` => khi so sánh `testItemsRef.current === items` thì 2 biến này vẫn đang trỏ về cùng 1 Array trong memory. Đồng nghĩa với việc `input` chưa thay đổi, thì không có 1 Array mới nào được tạo ra trong Memory 🎆. Các bạn có thể thử thay đổi `input` bằng `change input` rồi chạy `increment count` lần nữa để thấy `useMemo` hoạt động đúng như những gì mong đợi.

Demo hoàn chỉnh: [https://codesandbox.io/s/vigorous-sea-2pszx](https://codesandbox.io/s/vigorous-sea-2pszx)

Các bạn thấy **memoization** có lợi không? Các bạn nghĩ tới mình sẽ áp dụng **memoization** ở đâu trong những dự án hiện tại không? Mình hy vọng sau bài viết này, các bạn sẽ thấy **memoization** có ích và sẽ có những đoạn code được tối ưu hơn nhé. Xin chào thân ái và hẹn gặp lại các bạn trong những bài viết sau.

> **Note for React developers**: Các bạn có biết Functional Component cũng là 1 Function không? Vậy thì mình có thể dùng `useMemo` để giảm bớt `rerender` không nhỉ? Các bạn tìm hiểu nhé 😉
