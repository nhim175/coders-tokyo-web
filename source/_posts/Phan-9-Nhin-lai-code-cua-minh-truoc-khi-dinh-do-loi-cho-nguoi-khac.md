---
title: Phần 9. Nhìn lại code của mình trước khi định đổ lỗi cho người khác
date: 2019-12-12 19:29:44
tags:
---

Đây là bài thứ 9 trong cuốn [97 Things Every Programmer Should Know](https://www.oreilly.com/library/view/97-things-every/9780596809515/) của tác giả Kevlin Henney. Cuốn sách này là tập hợp những tip nhỏ và hữu ích có thể sẽ giúp cho bạn trở thành một developer chuyên nghiệp hơn.

![https://res.cloudinary.com/djeghcumw/image/upload/v1576158540/blog/photo-1531538606174-0f90ff5dce83.jpg](https://res.cloudinary.com/djeghcumw/image/upload/v1576158540/blog/photo-1531538606174-0f90ff5dce83.jpg)

Tất cả developer chúng ta! - thường khó tin vào việc code của mình bị lỗi. Còn chuyện compiler bị lỗi thì khó có thể xảy ra, dù chỉ một lần.

<!--more-->

Trong thực tế, rất hiếm gặp trường hợp code bị lỗi bởi bug của [compiler](https://medium.com/hackernoon/compilers-and-interpreters-3e354a2e41cf), [interpreter](https://medium.com/hackernoon/compilers-and-interpreters-3e354a2e41cf), OS, app server, database, memory manager (mấy từ này mình xin phép không dịch vì nó là từ chuyên ngành khá thông dụng), hoặc các phần khác của hệ thống phần mềm. Đúng, chúng có tồn tại, nhưng cực kì hiếm so với chúng ta tưởng.

Một lần tôi gặp một con bug thật sự của compiler khi nó tối ưu một biến của vòng lặp, nhưng từ trước đến giờ tôi hay nghĩ compiler hoặc OS có nhiều bug hơn. Tôi đã lãng phí rất nhiều thời gian và cuối cùng té ra đều là lỗi của mình, mỗi lần như vậy tôi cảm thấy hơi thốn một chút.

Với những tool mà được sử dụng rộng rãi, hoàn thiện, dùng trong nhiều hệ thống công nghệ, ít có lý do gì để nghi ngờ về chất lượng. Tất nhiên, nếu tool đó mới được ra lò, hoặc chỉ được dùng bởi vài người trên thế giới, hoặc chỉ có một vài lượt tải, phiên bản 0.1, mã nguồn mở (có vẻ tác giả muốn nói phần mềm mã nguồn mở dễ có bug hơn, make sense nếu như project đó không được maintain, fix bugs), thì có thể có lý do chính đáng để nghi ngờ phần mềm đó. (hoặc phiên bản alpha của một phần mềm trả phí cũng có thể bị nghi ngờ).

Do compiler bug là hiếm, bạn tốt hơn nên dùng thời gian và sức lực để tìm lỗi ở code của bạn hơn là cố gắng chứng tỏ compiler bị lỗi. Hãy thử các cách debug thông thường như: tách riêng các vấn đề, các hàm gọi, viết test cho chúng; kiểm tra cách gọi hàm, các thư viện dùng chung, số phiên bản; giải thích vấn đề cho người khác; kiểm tra stack corruption, các kiểu dữ liệu không khớp nhau; thử chạy code trên các máy tính khác nhau và các cấu hình build khác nhau, ví dụ như cấu hình cho debug hoặc release.

Tự vấn những giả thiết của mình và của người khác. Công cụ từ những nhà cung cấp khác nhau có thể sẽ có những giả thiết khác nhau - hoặc những công cụ khác nhau từ cùng nhà cung cấp cũng vậy.

Khi ai đó báo cáo về một vấn đề mà bạn không thể tái hiện lại nó, đi ra chỗ họ và xem họ làm cái gì. Họ có thể làm việc gì đó mà bạn chưa từng nghĩ tới hoặc làm theo trình tự khác.

Quy tắc cá nhân của tôi là nếu có bug mà không biết chính xác vì sao và lúc bắt đầu nghĩ đến lỗi của compiler thì tôi sẽ kiểm tra lại cái stack lúc lỗi. Điều này càng đúng nếu việc thêm code để dò lỗi làm cho vấn đề dịch chuyển.

Những lỗi liên quan đến đa luồng là những kiểu bug làm cho chúng ta tổn thọ và phải gào thét rất nhiều. Tất cả những khuyến khích cho việc viết code đơn giản được nhân lên gấp bội khi hệ thống đa luồng. Không dựa được vào debug và unit test để tìm lỗi cho những kiểu lỗi như thế, do vậy việc thiết kế đơn giản là cấp thiết.

Do vậy, trước khi vội đổ lỗi cho compiler, hãy nhớ lời khuyên của Sherlocklock Holme: "Khi bạn đã loại bỏ những điều không thể xảy ra thì điều cuối cùng, dù khó tin đến đâu, chắc chắn là sự thật.", và của Dirk Gently "Khi bạn đã loại bỏ những điều khó tin thì điều cuối cùng, dù có vẻ bất khả thi, cũng phải là sự thật."
