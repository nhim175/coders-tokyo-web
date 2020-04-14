Đây là bài thứ 10 trong cuốn [97 Things Every Programmer Should Know](https://www.oreilly.com/library/view/97-things-every/9780596809515/) của tác giả Kevlin Henney. Cuốn sách này là tập hợp những tip nhỏ và hữu ích có thể sẽ giúp cho bạn trở thành một developer chuyên nghiệp hơn.

![image](https://www.thegioimaychu.vn/blog/wp-content/uploads/2019/04/cloudjobs.jpg)

Hãy xem qua đoạn code này:

```
  if (portfolioIdsByTraderId.get(trader.getId()).containsKey(portfolio.getId())) {…}
```

Bạn gãi đầu tự hỏi rằng công dụng của đoạn code gì? Có vẻ nó lấy ID từ trader, và dùng dữ liệu đó để danh mục mới, đồng thời kiểm tra ID trong dữ liệu ban đầu xem chúng có xuất hiện trong danh mục mới không. Bạn tìm sự định nghĩa của porfolioIdsByTraderId và thấy thứ này:

```
  Map<int, Map<int, int>> portfolioIdsByTraderId;
```

Dần bạn cảm thấy hẳn phải việc gì liên quan đến việc liệu trader có truy cập vào một danh mục cụ thể nào đó. Và dĩ nhiên là bạn sẽ tìm thấy các đoạn tương tự, hoặc một đoạn code tương tự nào đó nhưng có đôi chút khác biệt, bất cứ khi nào một thứ gì đó quan tâm liệu trader có truy cập vào một danh mục cụ thể.

Và trong đoạn codebase khác bạn lướt qua thứ này:

```
  If (trader.canView(portfolio)) {…}
```

Không băn khoăn, bạn không cần phải biết trader hoạt động như thế nào. Có lẽ có một trong những map của maps được giấu đâu đó bên trong. Tuy nhiên, đấy không phải là việc của bạn.

Và bây giờ bạn sẽ lựa chọn codebase nào để làm việc cùng?

Ngày xửa ngày xưa, chúng ta chỉ có một vài cấu trúc dữ liệu vô cùng đơn giản: *bits*, *bytes* và ký tự(thật sự chỉ là bytes nhưng chúng ta giả định chúng là những ký tự chữ cái và kí tự đặc biệt). Hệ thập phân có hơi khó khăn bởi vì chữ số hệ thập phân của chúng ta không thể làm việc tốt với hệ nhị phân của máy tính được, chính vì lý do đó mà chúng ta có nhiều kiểu dữ liệu số khác nhau với kích thước khác nhau. Thế rồi tiếp tục đến với mảng và chuỗi ký tự(chỉ là một dạng khác của mảng). Thế rồi chúng ta có kiểu stack, quene, bảng băm(hashes), và danh sách liên kết và skip lists và còn nhiều nhiều các cấu trúc dữ liệu khác nữa mà chúng không xuất hiện trong thế giới thực. “Khoa học máy tính” chính là nỗ lực hết mình chuyển hoá thế giới thực thành những cấu trúc dữ liệu trừu tượng. Những guru thực thụ còn có thể nhớ cách thức mà họ đã hoàn thành nó.

Tiếp theo chúng ta có các kiểu dữ liệu do người dùng tự định nghĩa. OK, đây không hẳn là điều mới, nhưng nó đã thay đổi cuộc chơi theo một cách nào đó. Nếu lĩnh vực của bạn chứa nhiều khái niệm như trader, hồ sơ(portfolio), bạn có thể mô hình hóa nó thành một kiểu khác gọi là, có thể nói, *Trader* và *Portfolio*. Tuy nhiên, điều quan trọng ở đây chính là bạn có thể mô hình mối quan hệ giữa chúng bằng những kỹ thuật kĩ thuật chuyên môn.

Nếu bạn lập trình mà không tuân theo nguyên tắc chuyên môn thì bạn đang tạo ra một tacit(đọc: bí mật). Hãy hiểu rằng kiểu int này mang ý là một cách để định dạng trader, đồng thời kiểu int đó mang đến ba ý nghĩa định dạng danh mục.(tốt nhất là đừng nên nhầm lẫn chúng!). Và nếu bạn giới thiệu một khái niệm kinh doanh mới(“ một vài thương nhân (trader) không được phép xem một số danh mục – đó là phạm pháp) cùng với một đoạn mã thuật toán, nói rằng mối quan hệ giữa sự tồn tại của những chiếc chìa khóa trong bản đồ, bạn không làm một sự kiểm tra nào và tuân thủ những ý tưởng của người khác.

Người lập trình viên tiếp theo có thể không hiểu được điều này vậy thì tại sao chúng ta không khiến nó trở nên dễ hiểu hơn. Sử dụng một cú pháp để tìm kiếm một cú pháp khác thực hiện việc kiểm tra sự có mặt có chính xác hay không. Và làm sao để áp dụng để một người nào đó hướng dẫn rằng những luật lệ trong kinh doanh chính là ngăn ngừa sự rối loạn trong nhận thức?

Khiến cho những khái niệm trong ngành trở nên dễ hiểu trong code của bạn nghĩa là những lập trình viên khác có thể dễ dàng làm việc với code thay vì phải cố gắng chỉnh sửa thuật toán để thích với code của bạn theo cách mà họ hiểu về nó. Đồng thời nó cũng mang ý nghĩa khi mà dự án của bạn trở nên tiên tiến thì sự hiểu biết của bạn về lĩnh vực trong ngành cũng gia tăng có nghĩa là bạn đang trong tư thế sẵn sàng nhất phát triển code.

Cùng với những gì tốt đẹp nhất, thay đổi là cần thiết nhưng những luật lệ chỉ xuất hiện ở một nơi duy nhất, và bạn có thể thay đổi nó không cần sự phụ thuộc chính là khôn ngoan.

Một lập trình viên mà chỉ đến làm việc cùng bạn trong vài tháng sẽ cảm ơn bạn. Và người đó có thể là chính bạn.
