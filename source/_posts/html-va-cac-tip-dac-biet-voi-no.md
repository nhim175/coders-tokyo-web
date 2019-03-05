---
title: HTML và các "tip" cực kì ngầu với nó!
date: 2019-02-28 20:00:01
authorId: thai_son
tags:
---

![HTML và các "tip" cực kì ngầu với nó!](https://res.cloudinary.com/djeghcumw/image/upload/v1551358425/blog/resized_time.jpg)

Thật ra, khi mình học lập trình hay làm bất thứ một chuyện gì đó mình thường tìm hiểu xem nó có mẹo hay tip gì hay ho để tối ưu hóa công việc không ? Và thật may mắn , khi mình lang thang trên các blog nước ngoài thì đã khám phá ra một bài viết cực kì bổ ích về các mẹo trong HTML. Nên hôm nay , mình quyết định làm bài viết này cho anh em cùng nhau đàm đạo nhé.

## 1\. HTML và Map Images

Image maps là một bức ảnh cực kì ngầu, bạn có thể click vào bất kì đâu trong bức ảnh đó mà bạn muốn, tiếp theo nó sẽ link bạn tới một document, hoặc một web khác. Không phải ai cũng may mắn biết rằng , thẻ <map> có thể định nghĩa từng khu vực trong một bức ảnh và cho bạn dẫn tới liên kết khác khi bạn nhấp vào. Đơn giản , bạn chỉ thiết lập tọa độ X, Y mà bạn mong muốn , tương ứng với các phần tử <area> bên trong thẻ <map>.

Một ví dụ của tính năng tuyệt vời này , mình sẽ mình họa cho các bạn thấy đó là bản đồ thế giới. Bạn có thể click vào từng châu lục mà bạn muốn và nó sẽ link tới một document hoặc một web khác .

Dưới đây là ví dụ ,mời các bạn click vào ảnh để xem chi tiết.

[![HTML ImagesMap](https://res.cloudinary.com/djeghcumw/image/upload/v1551116074/blog/Screenshot_from_2019-02-26_00-34-12.png) ](https://codepen.io/Shyn1711/pen/YgzwPV?editors=1100)  

## 2\. Ẩn các phần tử trong HTML mà không cần dùng CSS.  

Đúng là không đùa, bạn có thể ẩn các phần tử html mà không cần sự trợ giúp của CSS bằng cách sử dụng thuộc tính "hidden". Nó sẽ không hoạt động giống như một CSS hidden. Và sẽ hoạt động giống CSS “display: none”  hơn là CSS “visibility: hidden”. Khi bạn dùng hidden sẽ không tốn dung lượng , trong khi CSS “visibility: hidden” vẫn tốn dung lượng.

<figure class="wp-block-image">![](https://res.cloudinary.com/djeghcumw/image/upload/v1551205705/blog/Screenshot_from_2019-02-27_01-28-02.png)</figure>

## 3\. Thẻ meta <g class="gr_ gr_21 gr-alert gr_spell gr_inline_cards gr_run_anim ContextualSpelling ins-del multiReplace" id="21" data-gr-id="21">trong</g> HTML

Bạn có bao giờ tự hỏi ,thẻ meta là cái gì và dùng như thế nào không? Ở đây , mình xin giới thiệu cho các bạn một chút về thẻ meta và mẹo dùng để tối ưu hóa nó trong SEO.

Meta Tags là một đoạn văn bản mô tả nội dung của một page . Thẻ meta sẽ không xuất hiện trong nội dung của trang , nhưng nó sẽ xuất hiện trong đoạn mã code của bạn.

Nếu bạn muốn tìm xem một trang có sử dụng thẻ meta hay không? Thật đơn bạn chỉ cần click chuột phải và chọn "View Page Source". Một tab mới sẻ được mở . Và trong phần head của đoạn mã HTML , là nơi các thẻ meta sẽ xuất hiện.

Các thẻ meta sẽ trông như thế này :

<figure class="wp-block-image">![HTML MetaTags](https://res.cloudinary.com/djeghcumw/image/upload/v1551202857/blog/website-meta-tags.png)</figure>

4 thuộc tính mà chúng ta sẽ tập trung ở đây:

*   **Meta Keywords** - Một chuỗi các keywords đề cập tới trang web của bạn.
*   **Title Tag** - Đây là dòng chữ mà bạn sẽ thấy trên các tab của trình duyệt bạn. Các công cụ tìm kiếm sẽ xem dòng chữ này là title của trang web.
*   **Meta Description** - Một đoạn văn ngắn miêu tả trang web của bạn.
*   Meta Robots - Một chỉ dẫn để các công cụ tìm kiếm ( robots hoặc "bots") nên làm với trang.

## 4\. Input suggestions  

Thông thường , khi bạn tìm kiếm ở Google . Bạn chỉ cần nhấn một số chữ cái thì hàng loạt kết quả đề xuất sẽ hiện ra . Vậy làm sao để làm được nó ? Cùng nghiên cứu đoạn code dưới đây

[![HTML InputSuggestions](https://res.cloudinary.com/djeghcumw/image/upload/v1551204196/blog/Screenshot_from_2019-02-27_01-02-54.png) ](https://codepen.io/Shyn1711/pen/bZNrPz?editors=1010)  

Với value là các giá trị kết quả mà bạn thiết lập . Các bạn có thể click vào ảnh để xem demo code cụ thể.

## 5\. Sử dụng widths và heights với HTML images

Thông thường bạn biết đến với cách set chiều dài và chiều rộng bằng CSS. Một cách khá là hay nữa , bạn có thể set trực tiếp nó với thuộc tính của thẻ </img>.

<figure class="wp-block-image">![HTML images](https://res.cloudinary.com/djeghcumw/image/upload/v1551204856/blog/Screenshot_from_2019-02-27_01-14-01.png)</figure>

Ưu điểm của việc này là trình duyệt Web có thể định dạng trang nhanh hơn khi được tải. Vì nó biết cách bố trí hình ảnh trước khi chúng được tải xuống. Điều này có nghĩa là khách truy cập của bạn có thể bắt đầu lướt trang của bạn mà không phải chờ tất cả các hình ảnh hiển thị!

## Kết Luận!

Đó là những tip mà mình tình cờ thu thập được . Nếu bạn muốn tìm hiểu kỹ hơn về trang Web , hãy truy cập http://school.coders.tokyo/ . Với hệ thống bài giảng,bài tập phong phú và cực kì chất lượng , mình hi vọng bạn sẽ tự tay làm một trang Web thật tuyệt vời.

## Các tài liệu mà mình <g class="gr_ gr_3 gr-alert gr_spell gr_inline_cards gr_run_anim ContextualSpelling ins-del multiReplace" id="3" data-gr-id="3">tham</g> khảo :

*   https://medium.com/@AmJustSam/do-you-know-these-html-cool-tricks-66c2ff1e10cb
*   https://www.freelancer.com/community/articles/13-cool-tricks-for-html
*   https://www.wordstream.com/meta-tags