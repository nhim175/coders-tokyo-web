---
title: 97 điều mọi lập trình viên nên biết - Phần 1
date: 2019-12-04 22:20:30
tags:
---

Đây là bài mở đầu cho những bài dịch từ cuốn [97 Things Every Programmer Should Know](https://www.oreilly.com/library/view/97-things-every/9780596809515/) của tác giả Kevlin Henney. Cuốn sách này là tập hợp những tip nhỏ và hữu ích có thể sẽ giúp cho bạn trở thành một developer chuyên nghiệp hơn.

## Hành động một cách thận trọng (Act with Prudence)

> Nếu bạn đảm nhận bất cứ việc gì, hãy làm một cách thận trọng và cân nhắc những ảnh hưởng sau này. - Anon

Bất kể công việc của bạn có vẻ dễ dàng thế nào trong giai đoạn đầu dự án, bạn không thể tránh khỏi những lúc bị áp lực. Nếu bạn phải chọn giữa "làm đúng" và "làm nhanh", thường thì bạn sẽ chọn "làm nhanh" và có suy nghĩ trong đầu là sẽ quay lại fix nó sau. Khi bạn hứa điều này với chính bạn, với team, với khách hàng, nghĩa là bạn có chủ ý như vậy. Nhưng hầu như thì, sẽ nảy sinh ra những vấn đề mới ở những công việc tiếp theo và bạn sẽ tập trung vào những vấn đề này. Cái kiểu trì hoãn lại công việc để làm sau như vậy thường được coi là "technical debt" (nợ kĩ thuật) và nó không được tốt cho lắm. Đặc biệt Martin Fowler gọi cái kiểu tech debt này là tech debt có chủ ý (deliberate technical debt) để tránh nhầm lẫn với tech debt vô ý (inadvertent technical debt).

<!--more-->

Tech debt giống như một món vay lãi: bạn nhận được lợi ích ngắn hạn từ nó, nhưng bạn sẽ phải trả cả lãi cho đến khi nó được thanh toán hoàn toàn. Những lối tắt trong code làm cho việc thêm feature và refactor code khó khăn hơn. Chúng là nơi sản sinh ra những sai sót và những test case dễ đổ bể. Để chúng đó càng lâu thì càng nguy hiểm. Cho đến lúc bạn phải fix cái chỗ ban đầu mà bạn tạo ra, có thể có tới một đống bùi nhùi được xây dựng trên phần code sai ban đầu, làm cho nó khó sửa và refactor. Thực tế, thường chỉ khi mọi thứ trở nên quá tệ đến nỗi bạn _phải_ fix cái lỗi ban đầu thì bạn mới fix. Còn trước đó thì thường là khó để bạn có thể dành thời gian hoặc cân nhắc rủi ro để sửa nó.

Có những lúc bạn sẽ phải gánh chịu các tech debt để kịp deadline hoặc làm một feature nhỏ. Cố đừng để vào tình huống đó, nhưng nếu tình huống thực sự đòi hỏi phải làm vậy thì vẫn phải làm thôi. NHƯNG bạn phải track các tech debt và trả nợ nhanh chóng, hoặc mọi thứ sẽ lao dốc không phanh. Ngay sau khi quyết định gánh tech debt, viết ngay một task hoặc lưu lại trong hệ thống track issue của bạn để đảm bảo là bạn không quên nó.

Nếu bạn lên kế hoạch trả nợ trong tuần làm việc tới, giá phải trả sẽ là thấp nhất. Để nợ đó mà không trả sẽ sinh lãi, lãi này nên được theo dõi một cách minh bạch. Việc làm này sẽ giúp nhấn mạnh được mức độ ảnh hưởng của tech debt tới business value và sẽ giúp đánh giá cao việc trả nợ. Làm thế nào để tính và theo dõi phần nợ lãi dự vào project của bạn, nhưng bạn phải track nó.

Trả nợ tech càng sớm càng tốt. Còn không thì đồng nghĩa với việc bạn thiếu thận trọng.
