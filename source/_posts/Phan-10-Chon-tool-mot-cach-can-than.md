---
title: Phần 10. Chọn tool một cách cẩn thận
date: 2019-12-12 20:57:29
tags:
---

Đây là bài thứ 10 trong cuốn [97 Things Every Programmer Should Know](https://www.oreilly.com/library/view/97-things-every/9780596809515/) của tác giả Kevlin Henney. Cuốn sách này là tập hợp những tip nhỏ và hữu ích có thể sẽ giúp cho bạn trở thành một developer chuyên nghiệp hơn.

![https://res.cloudinary.com/djeghcumw/image/upload/v1576160996/blog/photo-1534398079543-7ae6d016b86a.jpg](https://res.cloudinary.com/djeghcumw/image/upload/v1576160996/blog/photo-1534398079543-7ae6d016b86a.jpg)

CÁC ỨNG DỤNG HIỆN NAY THƯỜNG HIẾM KHI ĐƯỢC BUILD TỪ CON SỐ 0. Chúng được ráp lại từ những công cụ sẵn có - các component, các thư viện, framework - vì một số các lý do:

<!--more-->

- Ứng dụng lớn lên theo kích thước, độ phức tạp, tinh xảo, trong khi thời gian phát triển chúng không tăng nhiều. Nếu người ta có thể tập trung vào viết nhiều hơn code phục vụ business, ít code hệ thống hơn thì sẽ tận dụng được trí não và thời gian của dev.
- Những component và framework được sử dụng rộng rãi thường ít bug hơn "của nhà trồng".
- Sản xuất và bảo trì phần mềm là công việc đòi hỏi sức lực con người rất nhiều, do vậy mua thì có thể sẽ rẻ hơn tự làm.

Tuy nhiên, chọn các công cụ phù hợp cho ứng dụng của bạn có thể là một việc khó đòi hỏi chút tư duy. Thực tế thì khi đưa ra một lựa chọn, bạn nên lưu ý một số thứ:

- Các công cụ khác nhau có thể dựa vào những giả thiết khác nhau về context của chúng - ví dụ như hạ tầng, control mdoel, data model, cách thức giao tiếp, v.v... - có thể dẫn đến _sự không khớp nhau về kiến trúc_ giữa ứng dụng và công cụ. Những cái không khớp đó dẫn đến các đoạn code hack hoặc workaround mà sẽ làm cho code phức tạp hơn mức cần thiết.
- Các công cụ khác nhau có vòng đời khác nhau, và việc nâng cấp một trong số chúng có thể trở thành một công việc khó và tốn rất nhiều thời gian vì các chức năng mới, các thay đổi trong thiết kế, hoặc thậm chí các bug fix có thể dẫn đến sự không tương thích với các công cụ khác. Càng nhiều công cụ thì vấn đề càng trở nên khó khăn.
- Một số công cụ thì đòi hỏi phải có cấu hình riêng, thường thì là một vài file XML, cái mà có thể sẽ vượt khỏi tầm kiểm soát nhanh chóng. Cuối cùng ứng dụng trông sẽ như là được viết bằng XML kèm theo một vài dòng code ở một ngôn ngữ nào đó. Tính phức tạp của cấu hình sẽ làm cho ứng dụng khó bảo trì và mở rộng.
- Vendor lock-in (bị phụ thuộc vào code của bên thứ 3) xuất hiện khi code phụ thuộc vào các sản phẩm của các bên thứ 3, dẫn đến việc bị ràng buộc bởi chúng ở vài điểm: tính dễ bảo trì, hiệu năng, khả năng phát triển, giá, v.v...
- Nếu bạn có kế hoạch dùng phần mềm miễn phí, bạn sẽ có thể phát hiện ra là chúng không hoàn toàn miễn phí. Bạn có thể sẽ phải mua để được hỗ trợ, chưa chắc nó đã rẻ.
- Các điều khoản về license quan trọng, kể cả với phần mềm miễn phí. Ví dụ, trong vài công ty phần mềm, họ không được sử dụng các phần mềm có license GNU bởi vì tính tự nhiên vốn có của nó - phần mềm phát triển dùng nó phải được phân phối cùng với mã nguồn của nó.

Cách mà tôi tránh các vấn đề trên là bắt đầu từ nhỏ bằng việc sử dụng các công cụ thực sự cần thiết. Thường thì mục tiêu ban đầu sẽ là loại bỏ việc phải động đến các đoạn code hạ tầng low-level. Sau đó thêm vào sau nếu cần. Tôi cũng có xu hướng tách riêng những công cụ bên ngoài với các object của business domain bằng việc sử dụng interface, chia lớp, để mà sau này tôi có thể ít tốn công thay thế các tool này nhất. Một tác dụng phụ tích cực của việc này là tôi thường có ứng dụng gọn hơn và ít dùng các tool bên ngoài hơn dự đoán ban đầu.
