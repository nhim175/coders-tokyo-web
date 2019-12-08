---
title: Phần 7. Cẩn thận với việc dùng chung code
date: 2019-12-07 22:43:05
tags:
---

Đây là bài thứ bảy trong cuốn [97 Things Every Programmer Should Know](https://www.oreilly.com/library/view/97-things-every/9780596809515/) của tác giả Kevlin Henney. Cuốn sách này là tập hợp những tip nhỏ và hữu ích có thể sẽ giúp cho bạn trở thành một developer chuyên nghiệp hơn.

![https://res.cloudinary.com/djeghcumw/image/upload/v1575784379/blog/87-code-reuse-941x1024.gif](https://res.cloudinary.com/djeghcumw/image/upload/v1575784379/blog/87-code-reuse-941x1024.gif)

Đó là dự án đầu tiên của tôi trong công ty. Tôi vừa mới tốt nghiệp và khao khát được chứng minh bản thân, ở lại công ty muộn để xem những dòng code đang có. Khi làm tính năng đầu tiên, tôi đã hết sức cẩn thận vận dụng những gì đã học - ghi chú, log, lôi những đoạn code xài chung ra thành các thư viện bất cứ chỗ nào có thể. Tôi đã rất sẵn sàng cho code review đã làm tôi ngạc nhiên - việc tái sử dụng code đã không được chấp nhận.

<!--more-->

Làm sao có thể như thế được? Suốt khi học đại học, tái sử dụng được coi như là hình mẫu trong lập trình. Tất cả những bài viết mà tôi đã từng đọc, các cuốn sách, những chuyên gia phần mềm những người đã dạy tôi, không lẽ tất cả đều sai?

Hoá ra là tôi đã bỏ qua một thứ quan trọng.

Ngữ cảnh (Context).

Thực tế cho việc 2 phần khác nhau của hệ thống thực hiện 1 logic theo cùng một cách mang ít ý nghĩa hơn tôi tưởng. Trước lúc tôi lôi đoạn code chung ra thành thư viện, các phần này không phụ thuộc vào nhau. Mỗi phần sẽ có thể biến đổi khác nhau trong tương lai. Mỗi phần có thể thay đổi logic riêng của nó để phù hợp với sự thay đổi về business của hệ thống. 4 dòng code giống nhau chỉ là tình cờ.

Cái thư viện code dùng chung mà tôi tạo ra giống như việc buộc dây của chiếc giày này vào chiếc giày bên kia. Hai chân phải bước cùng nhau. Chi phí bảo trì cho các hàm độc lập thường không đáng kể, nhưng những thư viện chung thì sẽ đòi hỏi phải test khá nhiều.

Khi số dòng code tôi viết được giảm đi, ngược lại tôi đã làm cho nhiều thứ phụ thuộc vào nhau hơn.

Những cái lỗi này nó nguy hiểm ở chỗ, trông thì có vẻ là ý tưởng hay. Khi ứng dụng vào đúng chỗ, thì nó phát huy giá trị. Ngược lại sai chỗ thì nó tăng chi phí hơn là giá trị. Khi gặp phải một codebase mà không biết chắc là các phần được dùng ở những chỗ nào, tôi giờ cẩn thận hơn nhiều về việc dùng chung.

Cẩn thận với việc xài chung. Hãy kiểm tra ngữ cảnh. Sau đó mới tiếp tục.

---

Khi bạn thấy 2 đoạn code giống nhau, ngay lập tức bạn sẽ nghĩ tới việc tách chúng ra thành một function để có thể dùng chung. Hãy cân nhắc xem ngữ cảnh của chúng có giống nhau không. Liệu trong tương lai khi business của 1 trong 2 bên thay đổi thì phần dùng chung đó có còn được dùng chung nữa không, nếu không thì bạn nên xem lại.
