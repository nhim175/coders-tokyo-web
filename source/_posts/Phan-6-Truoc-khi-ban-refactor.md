---
title: Phần 6. Trước khi bạn refactor
date: 2019-12-07 13:45:30
tags:
---

Đây là bài thứ sáu trong cuốn [97 Things Every Programmer Should Know](https://www.oreilly.com/library/view/97-things-every/9780596809515/) của tác giả Kevlin Henney. Cuốn sách này là tập hợp những tip nhỏ và hữu ích có thể sẽ giúp cho bạn trở thành một developer chuyên nghiệp hơn.

![https://res.cloudinary.com/djeghcumw/image/upload/v1575703444/refactoring-code.jpg](https://res.cloudinary.com/djeghcumw/image/upload/v1575703444/refactoring-code.jpg)

Một lúc nào đó, mỗi lập trình viên sẽ cần phải refactor code hiện tại. Nhưng trước khi làm việc này, hãy cân nhắc những việc dưới đây, bởi nó có thể giảm bớt thời gian và công sức cho bạn và người khác

<!--more-->

- _Phương pháp tốt nhất cho việc tái cấu trúc bắt đầu từ việc xem xét kỹ lưỡng code hiện tại và các đoạn test liên quan đến code đó_. Việc này sẽ làm cho bạn hiểu về ưu nhược điểm của code hiện tại, sau đó bạn có thể chắc rằng sẽ giữ lại những điểm mạnh trong khi tránh được các lỗi. Chúng ta đều tưởng là mình có thể làm tốt hơn hệ thống hiện tại... cho đến cuối cùng chúng ta lại làm ra một cái mới không những không tốt hơn mà có khi còn tệ hơn cái cũ vì chúng ta không học được từ những sai sót của hệ thống hiện tại.

- _Tránh viết lại từ đầu mọi thứ_. Tốt nhất là tái sử dụng được càng nhiều code càng tốt. Bất kể code có xấu đến đâu, nó đã được test và review. Vứt bỏ code cũ - đặc biệt khi nó đang ở production - đồng nghĩa với việc bạn đang vứt đi công sức hàng tháng viết ra code đã được test, sửa lỗi và có thể có những bug fix, workaround mà bạn không biết tới. Nếu bạn không cân nhắc vấn đề này, code mới sẽ có thể rơi vào tình trạng có các bug bí hiểm mà đã được fix ở code cũ. Nó sẽ làm cho bạn tốn thời gian, công sức, những kiến thức đã được tích luỹ qua nhiều năm.

- _Nhiều thay đổi dần dần tốt hơn là một sự thay đổi lớn đột ngột_. Những thay đổi dần dần cho phép bạn đánh giá được sự ảnh hưởng lên hệ thống một cách dễ dàng qua những phản hồi, chẳng hạn từ việc test. Xem hàng trăm test case bị fail là việc bạn không muốn thấy. Nó dẫn đến sự bực bội, áp lực có thể gây ra các quyết định tồi sau đó. Một vài test case bị fail thì dễ đối phó hơn, dễ đưa ra giải pháp tốt hơn.

- _Sau mỗi kì dev, đảm bảo các test case đều pass là việc cần phải làm._ Viết các test mới nếu những test cũ không cover được các phần thay đổi mới. Đừng bỏ những test cũ nếu không có những cân nhắc thoả đáng. Ở bề ngoài, những test này có vẻ không áp dụng cho thiết kế mới của bạn, nhưng bạn nên dành thời gian để tìm hiểu lý do vì sao các test case đã được thêm trước đây.

- _Đừng mang lựa chọn cá nhân và cái tôi vào._ Nếu một thứ không hỏng, tại sao fix nó? Phong cách hoặc cấu trúc code không phù hợp với cá nhân bạn không phải là lý do chính đáng để tái cấu trúc code. Việc nghĩ rằng bạn có thể làm tốt hơn dev cũ cũng không phải là lý do chính đáng.

- _Công nghệ mới không phải là lý do để refactor_. Một trong những lý do tệ nhất để refactor là bởi vì code hiện tại quá cũ so với những công nghệ ngầu hơn chúng ta có ngày nay, và chúng ta tin vào ngôn ngữ hay framework mới có thể làm mọi thứ một cách nuột hơn. Nếu việc phân tích chi phí-lợi ích không cho thấy việc ngôn ngữ, framework mới đem lại cải thiện đáng kể về tính năng, khả năng bảo trì, hiệu quả làm việc, thì chúng ta nên giữ nguyên code.

- _Nhớ là con người luôn có sai sót_. Tái cấu trúc không đảm bảo rằng code mới sẽ tốt hơn - hoặc thậm chí tốt bằng - code cũ. Tôi đã từng thấy và trải qua vài lần tái cấu trúc không thành công. Nó không đẹp, nhưng nó là do người làm.

---

Qua bài viết này chúng ta có thể thấy việc "đập đi làm lại" là khá rủi ro, cần phải được cân nhắc kĩ càng. Thông thường khi quyết định viết lại code cũ, nếu code chưa được test thì chúng ta nên viết test để hiểu code cũ hoạt động ra sao. Sau khi test đã cover được code cũ rồi, chúng ta bắt đầu refactor lại code và phải đảm bảo test vừa viết không break.

Một cái bẫy khác mà nhiều dev hay rơi vào là chạy theo công nghệ. Khi một công nghệ mới ra mắt, thường thì nó sẽ có nhiều bug mà chúng ta chưa lường tới. Hãy bình tĩnh và đưa ra quyết định sáng suốt: liệu việc chuyển sang công nghệ mới có thực sự giúp được không, và giúp được **bao nhiêu**?
