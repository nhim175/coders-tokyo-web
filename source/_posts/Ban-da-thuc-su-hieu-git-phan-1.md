---
title: Bạn đã thực sự hiểu git (Phần 1)
date: 2019-07-01 19:00:00
authorId: thai_son
tags:
---

![Bạn đã thực sự hiểu git phần 1 ](https://res.cloudinary.com/djeghcumw/image/upload/v1561527909/blog/general-drawing.png)

Xin chào các bạn, mình quay trở lại rồi đây (^^). Ở bài viết này, mình sẽ chia sẽ cho các bạn những kiến thức về git và cũng như cách thức mà git hoạt động. Một bài hướng dẫn Git tốt là một bài chỉ cho bạn hiểu cách git hoạt động chi tiết, chứ không phải dừng lại ở mức cách mà sử dụng chúng.

Nếu bạn là người mới tìm hiểu về Git, mình khuyên bạn nên tìm hiểu kỹ về nó trước khi đọc bài này. Để có được một kiến thức toàn diện và tổng quát về Git, mình xin giới thiệu bạn khoá học Git đến từ [Coders.Tokyo School](https://school.coders.tokyo/login).

Nếu bạn đã sẵn sàng, chúng ta hãy bắt đầu! Mình hi vọng những concept trong bài này sẽ giúp bạn hiểu hơn về git.

<!-- more -->

## Tổng quát

Trong bức hình ở đầu bài. Phần `remote` sẽ đứng tách biệt, trong khi 3 nhóm khác sẽ là môi trường, nơi mà bạn thực hiện code.

Đầu tiên, chúng ta cùng tìm hiểu về phần `Remote Repository`. `Remote Repository` là nơi mà bạn gửi sự thay đổi của bạn khi bạn muốn chia sẽ và cập nhật sự thay đổi code từ người khác. Nếu bạn đã từng sử dụng các hệ thống quản lý code khác, chắc sẽ không mấy gì xa lạ.

Tiếp theo, `Development Environment` là nơi bạn thực hiện code trên môi trường máy tính cục bộ của bạn. Ở nhóm này được chia ra ba phần,đó là `Working Directory`, `Staging Area` và `Local Repository`. Chúng ta sẽ cùng nhau tìm hiểu về chúng và bắt đầu học cách sử dụng git.

Bắt đầu, bạn hãy tạo một forder nơi mà bạn muốn đặt `Development Environment` của bạn.

## Nhận một Remote Repository

Oki bước tiếp theo, chúng ta hãy tải một `Remote Repository`và đặt nó vào forder trong máy của bạn.

Trước tiên, mình khuyên bạn hãy đọc bài này https://github.com/UnseenWizzard/git_training.git nếu bạn chưa đọc nó trên github.

Để thực hiện nó, chúng ta sử dụng câu lệnh
`git clone https://github.com/{YOUR USERNAME}/git_training.git` trên terminal và tại khu vực forder mà bạn muốn tải nó về máy.

Như bạn thấy trong sơ đồ dưới đây, bản copy của bạn sẽ được tải về ở 2 khu vực đó là `Working Directory` và `Local Repository`. `Local Repository` cũng là một bản Remote khác, hành động giống như `Remote Repository`. Điều khác biệt là bạn sẽ không share nó cho bất kì ai.

![Bạn đã thực sự hiểu git phần 1 ](https://res.cloudinary.com/djeghcumw/image/upload/v1561994927/blog/clone.png)

## Thêm một vài thứ mới

Giả sử, một ai đó đã tạo một file `Alice.txt` tại `Remote Repository`. Hãy tạo một file mới và gọi nó là `Bob.txt`.

Những gì bạn vừa làm là thêm nó vào `Working Directory`. Có hai loại kiểu file trong `Working Directory` của bạn. Đó là file đã được tracked ( tracked files ) và file chưa tracked ( untracked ).

Để xem những gì đã xảy ra trong `Working Directory`, bạn hãy gõ `git status`. Điều này sẽ nói cho bạn biết bạn đang ở nhánh nào, liệu có điều gì khác biệt xảy ra ở `Local Repository` so với `Remote` hay không?

Ở bước này, khi bạn gõ `git status` bạn sẽ thấy `Bob.txt` là `untracked` file.

Trong bức hình phía dưới, bạn có thể thấy tính huống xảy ra nếu bạn thực hiện `git add Bob.txt`: Điều này nói nên rằng, bạn đã thêm nó vào khu vực `Staging Area`.

![Bạn đã thực sự hiểu git phần 1 ](https://res.cloudinary.com/djeghcumw/image/upload/v1561995861/blog/add.png)

Khi thực hiện xong bước này, tiếp theo sẽ là bước sẵn sàng để bạn `commit` tất cả những gì bạn đã làm vào `Local Repository`.

Để commit bạn hãy thực hiện dòng lệnh `git commit -m 'your message`. Với `your message` là những gì bạn muốn nhắn bạn đã làm những gì. Khi bạn thực hiện xong bước này, file của bạn sẽ được chuyển vào
`Local Repository`.

![Bạn đã thực sự hiểu git phần 1 ](https://res.cloudinary.com/djeghcumw/image/upload/v1561996307/blog/commit.png)

Vậy bây giờ thay đổi của bạn đã nằm trong khu vực `local repository`, đây là một nơi tốt miễn là bạn chưa sẵn sàng chia sẽ chúng.

Để chia sẽ sự thay đổi của bạn tới `Remote Repository`, chúng ta hãy cùng push chúng lên.

![Bạn đã thực sự hiểu git phần 1 ](https://res.cloudinary.com/djeghcumw/image/upload/v1561996588/blog/push.png)

Khi bạn thực hiện đoạn lệnh `git push`, sự thay đổi sẽ được gửi tới khu vực `Remote Repository`. Trong mô hình bên dưới, bạn sẽ thấy trạng thái được thay đổi sau khi push.

![Bạn đã thực sự hiểu git phần 1 ](https://res.cloudinary.com/djeghcumw/image/upload/v1561996893/blog/after_push.png)

## Thực hiện một số thay đổi

Đến bước này, thì chúng ta đã thực hiện công việc thêm một file mới và chia sẽ chúng lên `Remote Repository`. Nhưng để thú vị chúng ta cùng thay đổi một số thứ trong file chúng ta vừa thêm vào.

Chúng ta hãy thay đổi file `Bob.txt` bằng cách thêm đoạn **Hi!! I'm Bob. I'm new here.** vào file.

Bây giờ, nếu bạn thực hiện `git status`, bạn sẽ thấy trạng thái của `Bob.txt` là modified. Trong trạng thái này sự thay đổi của bạn đang nằm ở `Working Directory.`

Nếu bạn muốn thấy những gì thay đổi trong khu vực `Working Directory` bạn có thể thực hiện dòng lệnh `git diff` và thấy kết quả như bên dưới.

```javascript
diff --git a/Bob.txt b/Bob.txt
index e69de29..3ed0e1b 100644
--- a/Bob.txt
+++ b/Bob.txt
@@ -0,0 +1 @@
+Hi!! I'm Bob. I'm new here.
```

Tiếp tục sử dụng `git add Bob.txt` như bạn đã làm trước đó. Nó sẽ gửi thay đổi của bạn tới khu vực `Staging Area`.

Bạn hãy tiếp tục sử dụng `git diff` lần nữa. Bạn sẽ thấy kết quả lần này là trống rỗng. Điều này có nghĩa rằng `git diff` chỉ xảy ra nếu có sự thay đổi trong khu vực `Working Directory`.

Để xem thử những thay đổi nếu bạn đã `staged`, hãy sử dụng `git diff --staged` và thấy kết quả giống như hình trước.

Tiếp tục, để gia tăng tính thú vị hơn. Chúng ta cùng thay đổi file lần nữa bằng cách sửa lại file với thay đổi **Hi! I'm Bob. I'm new here.**

Câu hỏi đặt ra nếu sử dụng `git status` thì kết quả sẽ như thế nào? Đúng rồi, thật tuyệt vời! Sẽ có hai sự thay đổi. Một cái đã được `staged`,và một cái chúng ta vừa thay đổi nó vẫn còn nằm trong khu vực `working directory`.

Chúng ta có thể thấy sự khác biệt giữa `Working Directory` và những thứ chúng ta đã di chuyển vào khu vực `Staging Area`.

```javascript
diff --git a/Bob.txt b/Bob.txt
index 8eb57c4..3ed0e1b 100644
--- a/Bob.txt
+++ b/Bob.txt
@@ -1 +1 @@
-Hi!! I'm Bob. I'm new here.
+Hi! I'm Bob. I'm new here.
```

Oki, khá là ân ý về sự thay đổi rồi đúng không nào. Hãy bắt đầu thực hiện commit chúng như mình đã hướng dẫn. Sau khi commit thì những thay đổi đã chuyển tới `Local Repository`. Nhưng bây giờ nếu chúng ta muốn biết về sự thay đổi khi chúng ta vừa committed và những thứ có trước đó, thì làm như nào?

Chúng ta có thể làm điều đó, bằng cách so sánh các commit. Mọi commit trong git đều có một mã hash độc nhất.

Ngay bây giờ chúng ta hãy sử dụng `git log` và cùng xem kết quả.

```javascript
commit 87a4ad48d55e5280aa608cd79e8bce5e13f318dc (HEAD -> master)
Author: {YOU} <{YOUR EMAIL}>
Date:   Sun Jan 27 14:02:48 2019 +0100

    Add text to Bob

commit 8af2ff2a8f7c51e2e52402ecb7332aec39ed540e (origin/master, origin/HEAD)
Author: {YOU} <{YOUR EMAIL}>
Date:   Sun Jan 27 13:35:41 2019 +0100

    Add Bob

commit 71a6a9b299b21e68f9b0c61247379432a0b6007c
Author: UnseenWizzard <nicola.riedmann@live.de>
Date:   Fri Jan 25 20:06:57 2019 +0100

    Add Alice

commit ddb869a0c154f6798f0caae567074aecdfa58c46
Author: Nico Riedmann <UnseenWizzard@users.noreply.github.com>
Date:   Fri Jan 25 19:25:23 2019 +0100

    Add Tutorial Text

      Changes to the tutorial are all squashed into this commit on master, to keep the log free of clutter that distracts from the tutorial

      See the tutorial_wip branch for the actual commit history
```

Ở đây, chúng ta sẽ thấy một vài điều thú vị:

- Hai commit đầu tiên được thực hiện bởi tôi.
- Commit khởi tạo đầu tiên của bạn để thêm `Bob.txt` chính là nhánh chính hiện tại trên khu vực `Remote Repository`. Chúng ta sẽ xem xét điều này một lần nữa khi chúng ta nói về các branch.
- Commit mới nhất trong `Local Repository` là cái mà chúng ta vừa làm, và chúng ta biết mã hash của chúng.

Để so sánh commit đó và commit trước, thì chúng ta có thể thực hiện `git diff <commit> ^!`, Trong đó ^! có nghĩa nói với git hãy so sánh với commit trước đó. Vì vậy, trong trường hợp này tôi thực hiện `git diff 87a4ad48d55e5280aa608cd79e8bce5e13f318dc ^!`.

Trong sơ đồ bên dưới, bạn lại thấy các giai đoạn khác nhau của một số thay đổi và các lệnh diff áp dụng cho vị trí của các khu vực.

![Bạn đã thực sự hiểu git phần 1 ](https://res.cloudinary.com/djeghcumw/image/upload/v1561999953/blog/diffs.png)

Bây giờ nếu bạn đã oki với các thay đổi mà bạn muốn, hãy tiếp tục và push chúng lên `Remote Repository`.

Ở phần tiếp theo, chúng ta hãy cùng tìm hiểu về branch và những thứ xoay quanh chúng. Hãy cùng chờ phần 2 về chuỗi bài tìm hiểu git này nhé.

## Bài viết tham khảo:

- [https://dev.to/unseenwizzard/learn-git-concepts-not-commands-4gjc?fbclid=IwAR1iIK6ILL8eTDrcwQ21nnOZd_d9r0IICYlwlRRwN-hkdcqGjOT1CGU7U1A](https://dev.to/unseenwizzard/learn-git-concepts-not-commands-4gjc?fbclid=IwAR1iIK6ILL8eTDrcwQ21nnOZd_d9r0IICYlwlRRwN-hkdcqGjOT1CGU7U1A)
