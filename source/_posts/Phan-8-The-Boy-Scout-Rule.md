---
title: Phần 8. The Boy Scout Rule
date: 2019-12-08 12:59:08
tags:
---

Đây là bài thứ tám trong cuốn [97 Things Every Programmer Should Know](https://www.oreilly.com/library/view/97-things-every/9780596809515/) của tác giả Kevlin Henney. Cuốn sách này là tập hợp những tip nhỏ và hữu ích có thể sẽ giúp cho bạn trở thành một developer chuyên nghiệp hơn.

**Giải thích:** [BSA](https://en.wikipedia.org/wiki/Boy_Scouts_of_America) (The Boy Scouts of America) là [hội hướng đạo sinh](https://vi.wikipedia.org/wiki/H%E1%BB%99i_Nam_H%C6%B0%E1%BB%9Bng_%C4%91%E1%BA%A1o_M%E1%BB%B9) tại Mỹ, thành lập với mục tiêu phát triển đức tính, đào tạo công dân, và thể chất cá nhân.

![https://res.cloudinary.com/djeghcumw/image/upload/v1575786377/blog/Boy%20scouts.jpg](https://res.cloudinary.com/djeghcumw/image/upload/v1575786377/blog/Boy%20scouts.jpg)

Hội BSA có một quy tắc: "Luôn làm cho nơi cắm trại sạch hơn lúc bạn đến". Nếu bạn thấy rác trên đó, bạn dọn nó bất kể ai đã xả ra đó. Bạn có chủ đích cải thiện môi trường cho nhóm cắm trại tiếp theo. (Đúng ra câu ban đầu viết bởi Robert Stephenson Smyth Baden-Powell, cha đẻ của hướng đạo, viết là "Hãy làm cho thế giới này tốt hơn một chút so với lúc bạn thấy nó.")

<!--more-->

Nếu áp dụng quy tắc này cho code thì sẽ là: "Luôn làm cho một module sạch sẽ hơn khi bạn mở chúng ra"? Sẽ ra sao nếu như chúng ta luôn cố gắng nỗ lực ít nhiều cải thiện một module bất kể tác giả là ai? Kết quả sẽ như thế nào?

Tôi nghĩ nếu tất cả chúng ta đều tuân theo quy tắc này, chúng ta sẽ thấy hệ thống của chúng ta ngày một tốt lên. Chúng ta cũng sẽ thấy _cả team_ quan tâm đến hệ thống thay vì chỉ vài cá nhân quan tâm đến phần code của họ.

Tôi không nghĩ quy tắc này là yêu cầu quá cao. Bạn không cần phải làm mọi module tốt lên trước khi bạn hoàn thành. Bạn chỉ cần làm cho chúng tốt hơn lên một chút so với lúc đầu. Tất nhiên nó có nghĩa là bất cứ đoạn code nào bạn thêm vào cũng phải sạch sẽ. Nó cũng có nghĩa bạn sẽ dọn dẹp một phần nhỏ khác trong module đó trước khi hoàn thành công việc. Ví dụ bạn chỉ cần cải thiện tên của một biến nào đó, hoặc tách function lớn ra thành 2 function nhỏ. Hoặc bạn gỡ bỏ một cái [circular dependency](https://en.wikipedia.org/wiki/Circular_dependency) nào đó, etc.

Thật ra mà nói, nghe có vẻ như là một phép tắc - giống như việc rửa tay sau khi đi vệ sinh, hoặc bỏ rác vào thùng chứ đừng ném ra nhà. Đúng là việc tạo ra một đoạn code ẩu giống với một việc không được xã hội chấp nhận như xả rác. Không nên làm vậy.

Nhưng còn hơn thế nữa. Quan tâm đến code của bạn là một việc. Quan tâm tới code của cả team là việc khác nữa. Team giúp lẫn nhau và cùng nhau dọn dẹp. Chúng ta tuân theo The Boy Scout Rule bởi nó tốt cho tất cả mọi người, không chỉ riêng ai.
