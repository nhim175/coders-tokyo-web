---
title: 97 điều mọi lập trình viên nên biết - Phần 3
date: 2019-12-07 01:41:15
tags:
---

Đây là bài thứ ba trong cuốn [97 Things Every Programmer Should Know](https://www.oreilly.com/library/view/97-things-every/9780596809515/) của tác giả Kevlin Henney. Cuốn sách này là tập hợp những tip nhỏ và hữu ích có thể sẽ giúp cho bạn trở thành một developer chuyên nghiệp hơn.

![https://res.cloudinary.com/djeghcumw/image/upload/v1575660117/blog/1_MXGVJ89UuZ4POYXtj1lkMw.png](https://res.cloudinary.com/djeghcumw/image/upload/v1575660117/blog/1_MXGVJ89UuZ4POYXtj1lkMw.png)

## Phần 3. Hãy hỏi "Người dùng họ sẽ làm gì?" (Bạn không phải là người dùng)

CHÚNG TA THƯỜNG CÓ XU HƯỚNG CHO RẰNG NGƯỜI KHÁC CŨNG NGHĨ NHƯ MÌNH. Nhưng họ không. Các nhà tâm lý học gọi đây là "false consensus bias". Khi người khác nghĩ và làm khác với chúng ta, chúng ta thường cho rằng họ không bình thường.

<!--more-->

Cái việc suy nghĩ như vậy giải thích tại sao nhiều lập trình viên gặp khó khăn trong việc đặt mình vào vị trí của người dùng. Người dùng không nghĩ như lập trình viên. Đầu tiên là họ ít dùng máy tính hơn chúng ta nhiều. Họ không biết mà cũng không quan tâm máy tính hoạt động ra sao. Điều này có nghĩa là họ không quen với những kỹ năng giải quyết vấn đề như lập trình viên. Họ không nhận ra những cái dạng mẫu mà lập trình viên hàng ngày thấy.

Cách tốt nhất để biết người dùng suy nghĩ thế nào là ngồi theo dõi họ. Yêu cầu một người dùng sử dụng một phần mềm nào đó giống cái bạn đang làm để giải quyết một công việc bất kì. Hãy đảm bảo công việc này là một công việc có thật: ví dụ "Cộng một cột gồm các số" có vẻ OK. Ví dụ "Tính chi tiêu tháng trước của bạn" thì tốt hơn. Tránh những công việc quá đặc thù, ví dụ như "Bạn có thể chọn những ô trong bảng tính và điền một công thức tính tổng vào bên dưới không?" - nó quá rõ ràng. Hãy để người dùng nói lên suy nghĩ của họ. Đừng ngắt họ. Đừng cố giúp họ. Hãy tự hỏi, "Tại sao họ lại làm vậy?" và "Tại sao họ không làm khác?".

Điều đầu tiên bạn sẽ để ý thấy là mọi người dùng đều làm giống nhau. Họ sẽ thử hoàn thành công việc theo thứ tự giống nhau, cùng gặp phải những lỗi tương tự nhau ở cùng một chỗ. Bạn cần phải thiết kế dựa vào những hành vi đó. Cái này khác với những buổi họp về thiết kế, chỗ mà mọi người thường nghe ai đó nói "Nếu người dùng muốn...thì sao?". Điều này dẫn đến những tính năng phức tạp và khó hiểu hơn là cái người dùng muốn. Theo dõi người dùng sẽ xoá bỏ những sự khó hiểu này.

Bạn sẽ thấy người dùng gặp vướng mắc. Khi bạn bị tắc, bạn sẽ ngó xung quanh. Khi người dùng bị tắc, họ sẽ thu hẹp tầm nhìn của họ. Nó làm cho họ khó thấy được giải pháp ở đâu đó trên màn hình của họ. Đấy là một lý do tại sao dùng những đoạn text dùng để giải thích là phương án không tốt trong UI design. Nếu như bạn phải dùng đến những chỉ dẫn hoặc text trợ giúp, hãy đảm bảo là nó nằm ngay tại chỗ vấn đề xảy ra. Sự thu hẹp tập trung chú ý của người dùng là lý do tại sao tool tips thường hiệu quả hơn menu trợ giúp.

Người dùng thường có xu hướng bị loạn. Họ tìm một cách làm cho nó hoạt động được và sẽ dính với nó mãi, bất kể nó lòng vòng ra sao. Tốt hơn thì nên đưa ra một cách làm thật rõ ràng hơn là vài ba phím tắt.

Bạn cũng sẽ thấy là có một khoảng cách giữa cái người dùng nói là họ muốn và cái họ làm. Điều này khá quan ngại, vì cách thông thường mà ta thu thập mong muốn từ người dùng là hỏi họ. Đấy là lí do tại sao cách tốt nhất để thu thập nhu cầu người dùng là theo dõi họ. Dành hàng giờ để theo dõi người dùng thì mang lại nhiều thông tin hơn là dành cả ngày đoán xem họ muốn gì.

---

Tham khảo:

- Từ khoá: user tracking, user behavior, user analytics, user interface, user experience, user testing, A/B test
