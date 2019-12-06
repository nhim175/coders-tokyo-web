---
title: 97 điều mọi lập trình viên nên biết - Phần 2
date: 2019-12-06 00:40:42
tags:
---

Đây là bài thứ hai trong cuốn [97 Things Every Programmer Should Know](https://www.oreilly.com/library/view/97-things-every/9780596809515/) của tác giả Kevlin Henney. Cuốn sách này là tập hợp những tip nhỏ và hữu ích có thể sẽ giúp cho bạn trở thành một developer chuyên nghiệp hơn.

## Phần 2. Ứng dụng các nguyên tắc của Functional Programming

Functional Programming gần đây lấy lại được sự yêu thích từ cộng đồng lập trình. Một phần là bởi vì những tính chất mới của functional programming được đưa ra để giải quyết các khó khăn gặp phải trong ngành của chúng ta. Tuy nhiên, dù đấy là một ứng dụng quan trọng, nhưng nó cũng không phải là lý do buộc bạn phải biết functional programming.

Việc làm chủ được functional programming có thể cải thiện được chất lượng code của bạn. Nếu bạn hiểu sâu và áp dụng được mô hình này, thiết kế của bạn sẽ rất minh bạch.

Referential transparency là một yếu tố rất được mong muốn: nó cho thấy rằng một hàm luôn có kết quả giống nhau khi được thực thi với đầu vào giống nhau, mọi lúc mọi nơi. Nghĩa là, việc tính toán hàm ít (hoặc không) dựa vào [side effect](https://softwareengineering.stackexchange.com/questions/40297/what-is-a-side-effect) của mutable state.

Một trong những nguyên nhân gây lỗi trong code kiểu mệnh lệnh là do các biến có thể bị mutate. Những ai đang đọc bài này thì chắc cũng đã từng kiểm tra tại sao thi thoảng trong một số trường hợp thì giá trị ra không mong muốn. Sự rõ ràng trong ngữ nghĩa có thể giúp làm giảm bớt những lỗi âm thầm như vậy, hoặc ít nhất thì cũng thu hẹp được phạm vi của nó, nhưng nguyên nhân sâu xa của những lỗi này là do các thiết kế mà cho phép mutate quá nhiều.

Và chúng ta khó có thể nhận được sự giúp đỡ từ xung quanh cho các lỗi kiểu này. Lập trình hướng đối tượng âm thầm gây ra vấn đề này, bởi vì nó thường cho thấy những kết nối giữa những object gọi qua lại những method mutate lẫn nhau, việc này khá nguy hiểm.

Tuy nhiên, với kiểu thiết kế test-driven, đặc biệt khi tuân theo phương pháp “Mock Roles, not Objects”, các mutability không cần thiết sẽ bị loại bỏ.

Kết quả cuối cùng sẽ là thiết kế mà có phân chia trách nhiệm rõ ràng, cùng với nhiều function nhỏ hơn, chỉ thực hiện tính toán trên các đầu vào của chúng thay vì tham chiếu đến các biến có thể bị mutate. Làm như vậy sẽ có ít lỗi hơn, và hơn nữa là sẽ dễ debug, vì nó có thể dễ dàng chỉ ra vị trí của giá trị bị sai trong những kiểu thiết kế như vậy hơn là phải lần ra những ngữ cảnh cụ thể dẫn đến cái lỗi đó. Việc này làm tăng đáng kể tính minh bạch trong code, và việc học một ngôn ngữ functional sẽ giúp cho bạn hiểu thấu tận xương.

Tất nhiên là functional programming không phải tối ưu trong mọi bài toán. Ví dụ như trong các hệ thống hướng đối tượng, kiểu lập trình này thường cho kết quả tốt hơn với việc phát triển domain model hơn là giao diện người dùng.

Hãy làm chủ functional programming để có thể khéo léo ứng dụng các bài học này cho các lĩnh vực khác. Những hệ thống object sẽ cộng hưởng với những cái tốt của sự minh bạch và sẽ gần với những hệ thống functional hơn là bạn nghĩ. Trong thực tế, có những người khẳng định rằng, functional programming và hướng đối tượng chỉ đơn giản là sự phản chiếu lẫn nhau, một dạng âm dương trong xử lý máy tính.

---

Bài viết này hơi trừu tượng với người mới học nên mình sẽ thêm các tài liệu tham khảo dưới đây.

- Các thuật ngữ cần nắm: functional programming, mutability/immutability, pure function/impure function, referential transparency, imperative programming, object-oriented programming, side effect, function composition, first-class function, high order function
- Functional programming: https://medium.com/javascript-scene/master-the-javascript-interview-what-is-functional-programming-7f218c68b3a0
