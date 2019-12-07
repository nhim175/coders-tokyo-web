---
title: Phần 4. Tự động hoá tiêu chuẩn code
date: 2019-12-07 11:53:44
tags:
---

Đây là bài thứ tư trong cuốn [97 Things Every Programmer Should Know](https://www.oreilly.com/library/view/97-things-every/9780596809515/) của tác giả Kevlin Henney. Cuốn sách này là tập hợp những tip nhỏ và hữu ích có thể sẽ giúp cho bạn trở thành một developer chuyên nghiệp hơn.

![https://res.cloudinary.com/djeghcumw/image/upload/v1575698277/blog/WFTPM.png](https://res.cloudinary.com/djeghcumw/image/upload/v1575698277/blog/WFTPM.png)

Có thể bạn cũng đã từng rơi vào trường hợp này rồi. Đó là ở giai đoạn đầu dự án, mọi người có chủ ý tốt - gọi là "những quy tắc trong dự án". Hầu hết những quy tắc này được ghi lại trong tài liệu. Những quy tắc về code thì sẽ rơi vào phần coding standard (tiêu chuẩn code) của dự án. Trong buổi họp kick-off dự án, lead dev đọc qua một lần tài liệu này và trong trường hợp tốt nhất, mọi người cùng đồng ý là sẽ tuân theo. Khi dự án bắt đầu thì những ý định tốt ban đầu bị bỏ rơi, từng tí một. Khi dự án được bàn giao, code trông như một đống rác, và không ai biết tại sao nó lại trở nên như vậy.

<!--more-->

Mọi thứ tuột dốc khi nào? Khả năng là tại lúc kick-off meeting của dự án. Một vài thành viên không chú ý. Những người khác thì không hiểu mục đích. Tệ hơn, có người không đồng ý và còn lên kế hoạch đi ngược lại với những coding standard này. Cuối cùng, một vài người hiểu và đồng ý, nhưng khi áp lực của dự án tăng lên, họ phải đi lệch ra khỏi quỹ đạo. Code đẹp không ghi điểm trong mắt khách hàng, người muốn nhiều chức năng hơn là code. Hơn nữa, tuân theo chuẩn code có thể sẽ gây chán nếu như nó không được làm tự động. Không tin thì bạn cứ thử căn hàng thủ công cho một đoạn code class rối rắm.

Nhưng nếu nó đã là vấn đề như vậy, tại sao chúng ta vẫn muốn có một chuẩn code ngay từ đầu? Lý do cho việc format code một cách đồng bộ là để cho không ai có thể "nắm giữ" một phần code cho chính họ bằng việc format code theo ý mình. Hoặc chúng ta có thể muốn tránh việc dev sử dụng các antipattern để tránh những lỗi thường gặp. Suy cho cùng, một chuẩn code nên làm cho việc làm việc trong cùng dự án dễ dàng hơn, và giữ được tốc độ dev từ đầu tới cuối. Nếu xác định tuân theo thì mọi người cũng nên đồng ý với chuẩn code - nó sẽ giúp tránh trường hợp dev thì dùng 3 space để căn hàng, dev khác thì dùng 4 space.

Có một loạt các tool giúp báo cáo chất lượng code, bảo trì và lưu giữ chuẩn code nhưng chúng không phải giải pháp. Nó cần phải được tự động hoá và thực thi khi cần. Dưới đây là một số ví dụ:

- Đảm bảo việc format code là một phần của quá trình build để mọi người có thể chạy nó một cách tự động mỗi lần họ compile code.
- Dùng các tool phân tích code để rà soát các antipattern không mong muốn, nếu thấy thì huỷ bỏ bản build đó.
- Học cách cấu hình các tool đó để có thể scan các antipattern trong project của bạn.
- Đừng chỉ đo đạc test coverage, mà tự động check kết quả nữa. Huỷ bản build nếu test coverage thấp.

Cố gắng làm việc này với tất cả các dự án bạn cho là quan trọng. Bạn không thể tự động hoá mọi thứ mà bạn muốn. Với những thứ bạn không thể tự động đánh dấu hoặc fix, xem chúng như một tập các chỉ dẫn bổ sung cho chuẩn code đã được tự động hoá, nhưng hãy chấp nhận việc đồng nghiệp sẽ có lúc không tuân theo.

Cuối cùng, chuẩn code nên linh hoạt thay vì cứng nhắc. Khi project phát triển, sẽ có những thay đổi, và những thứ có vẻ là đúng đắn lúc đầu thì chưa chắc vài tháng sau vẫn còn là như vậy.

---

Bài viết này có tính bao quát, áp dụng cho mọi dự án. Đối với JavaScript, bạn có thể dùng các công cụ sau để đảm bảo chuẩn code trong team:

- [Eslint](https://eslint.org/) giúp tránh các lỗi trong code bằng việc đưa ra các [quy tắc](https://eslint.org/docs/rules/). Ví dụ như [no-dupe-keys](https://eslint.org/docs/rules/no-dupe-keys) rule sẽ báo lỗi khi bạn khai báo 2 property trùng tên trong cùng một literal object
- [Prettier](https://prettier.io/) giúp mọi người code chung một format, bạn có thể đưa ra các [config](https://prettier.io/docs/en/configuration.html) riêng cho team mình. Ví dụ rule `"singleQuote": true` nghĩa là dùng `'` thay vì `"` cho `string`.
- Các trình duyệt như VSCode có plugin cho Eslint và Prettier để detect lỗi và format code trong quá trình code. Nhưng nếu bạn dùng các trình code khác không có các plugin này thì sao? Bạn không thể ép mọi người trong team cùng dùng một trình duyệt code. Thay vào đó bạn có thể dùng `husky` để tạo `pre-commit` hook (đọc thêm về githook), giúp kiểm tra và format code lúc commit code tại local. Tham khảo: [https://medium.com/@joshuacrass/javascript-linting-and-formatting-with-eslint-prettier-and-airbnb-30eb746db862](https://medium.com/@joshuacrass/javascript-linting-and-formatting-with-eslint-prettier-and-airbnb-30eb746db862) (đọc kỹ và làm theo nhé)
