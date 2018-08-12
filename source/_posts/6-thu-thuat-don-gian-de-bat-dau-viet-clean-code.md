---
title: 6 thủ thuật đơn giản để bắt đầu viết "clean code"
date: 2018-08-12 17:42:43
authorId: manh_cuong
tags:
---
![](https://res.cloudinary.com/djeghcumw/image/upload/v1533374235/blog/clean_code_1.jpg) 


Viết clean code là một công việc không dễ dàng. Nó yêu cầu kinh nghiệm với các tips khác nhau đồng thời phải luyện tập rất nhiều. Vấn đề ở đây là có rất nhiều tips và practice về chủ đề này, nó làm cho chúng ta không xác định được phương hướng. Kết quả, quá khó cho một developer chọn các tips và các practice để theo. Hãy làm công việc này đơn giản hơn. Trong bài viết này, đầu tiên chúng ta hãy thảo luận một vài lợi ích của việc viết clean code. Sau đó, chúng ta sẽ đi vào từng tips, practice mà các developer thường sử dụng nhất.
<!-- more -->

## Nội dung

### Lợi ích của việc viết clean code
1. Dễ dàng để bắt đầu, hoặc tiếp tục
2. Tốt cho làm việc nhóm
3. Dễ dàng theo học

### Các tips của việc viết clean code
1. Làm code dễ đọc cho mọi người
2. Sử dụng tên có ý nghĩa cho variables, function và methods
3. Để mỗi function hoặc method thực hiện chỉ một tác vụ, chức năng
4. Sử dụng comment đúng cách, rõ ràng
5. Tính nhất quán
6. Review code thường xuyên

## Lợi ích của viết code sạch sẽ (clean code)

Hãy bắt đầu nói về một số lợi ích của viết clean code. Một trong số các lợi ích chủ yếu là giúp chúng ta tiết kiệm thời gian để đọc và cố gắng để hiểu đoạn code làm gì. Một đống code lộn xộn có khả năng gây khó dễ  cho bất kì developer nào, tiêu tốn thời gian cho việc hiểu code. Và nếu code là quá lộn xộn, developer có thể quyết định dừng lại và bắt đầu lại từ đầu.

### 1.Dễ dàng để bắt đầu hoặc tiếp tục
Để tôi giải thích điều này trong một ví dụ đơn giản. Chúng ta hãy quay trở lại một trong những project chúng ta đã làm từ lâu. Hãy tưởng tượng rằng, chúng tôi không viết clean code và trốn tránh nó. Sau cái nhìn đầu tiên, chúng tôi thấy code xấu và rất lộn xộn. Và, chúng tôi có thể đã nhìn thấy khó như thế nào để tiếp tục tại nơi chúng tôi đã rời đi trước đây.
Kết quả chúng tôi phải tiêu tốn nhiều thời gian hơn cho project, cho việc hiểu đoạn code mà chính chúng tôi đã viết trước đó. Điều này thực sự là không cần thiết. Chúng ta nên tránh nó bằng cách bắt đầu học cách viết clean code. Giờ, chúng ta phải đầu tư cho nó. Đó cũng có một số thay đổi nhỏ rằng code cũ là quá lộn xộn or xấu và chúng tôi có thể quyết định bắt đầu lại từ đầu. Khách hàng của chúng tôi có lẽ sẽ không vui vẻ sau khi nghe những tin mới này.
Clean code, thường sẽ không xảy ra vấn đề này. Quay trở lại với ví dụ trước nhưng với tình trạng ngược lại. Giờ code của chúng tôi sạch sẽ và thanh lịch :> Mất bao lâu để chúng tôi có thể hiểu được nó. Có lẽ  chúng tôi cần  một vài phút để hiểu mọi thứ làm việc như thế nào. In the end, it's been a while since we wrote it. Tuy nhiên, thời gian đầu tư cho việc này nhỏ hơn đáng kể trường hợp đầu tiên. Khách hàng thậm chí sẽ chẳng nhận thấy chúng.
Đây là lợi ích đầu tiên của việc viết code. Điều này là không chỉ đúng cho project hay công việc của chúng tôi mà còn cho công việc của bất kì developer nào khác. Clean code cho phép chúng ta bắt đầu rất nhanh. Chúng ta, hay bất kì ai, không cần tiêu tốn thì giờ để học chúng. Thay vào đó, chúng ta có thể ứng dụng ngay vào công việc. 

### 2. Tốt cho việc làm việc nhóm
Lợi ích khác của việc clean code liên quan chặt chẽ đến cái đầu tiên. Nó cho phép sử dụng nhanh và dễ dàng hơn. Những gì tôi nói có ý nghĩa gì? Hãy tưởng tượng rằng chúng ta cần thuê một cô developer. Mất bao lâu để cô ấy có thể hiểu được code và học cách làm việc với nó? Điều này còn tùy. Bởi vì nếu code của bạn lộn xộn và xấu, cô ta sẽ cần nhiều thời gian hơn để hiểu được nó. Trong trường hợp ngược lại, nếu code của bạn sạch sẽ, dễ đọc, đơn giản, cô ấy có thể bắt đầu nhanh hơn.
Một vài người có thể muốn tranh luận rằng đó không phải là vấn đề vì chúng ta có thể ở đó và giúp cô ấy. Và, điều đó là sự thật. Tuy nhiên, sự giúp đỡ của chúng ta sẽ chỉ có thể trong thời gian ngắn, một hai hoặc ba ngày, chưa chắc cô ấy có thể hiểu được chỉ với một vài ngày.Nó thật sự làm chậm tiến trình không chỉ với cô ấy mà còn đối với team. 
Khi chúng ta cố gắng viết code rõ ràng, nó sẽ dễ dàng cho người khác có thể theo và làm việc với nó. Chắc chắn chúng ta sẽ cần time để giúp developer mới có thể học, hiểu và làm việc. Tuy nhiên, thời gian là một vài ngày không phải một tuần. Ngoài ra, clean code còn giúp đưa developer mới hòa nhập nhanh với team và giúp các developer hiểu được code trong một lần. Đơn giản hơn, clean code là dễ dàng để giải thích hơn là gây hiểu nhầm.

### 3. Dễ dàng để theo học
Có một điều chúng ta cần phải nhớ. Hiểu và học về cách làm việc với code chỉ là một phần. Chúng ta cần phải chắc chắn developer có thể theo các practices code. Điều này là quan trọng bởi vì chúng ta không chỉ muốn viết clean code mà còn phải giữ  nó, phải suy nghĩ về lâu dài.
Câu hỏi đặt ra, sẽ như thế nào nếu có một developer tự code theo tiêu chuẩn riêng, phá vỡ convention của team. Trong một team, điều này sẽ được giải quyết một cách dễ dàng, developer phải điều chỉnh code của mình phù hợp với convention của team nếu không muốn bị đẩy ra khỏi project. 

Cách giải quyết thứ 2, thuyết phục team theo chuẩn code practices, điều này là khả thi nếu practices của developer là tốt hơn, giúp code dễ đọc và ổn định. Chúng ta luôn luôn phải đặt câu hỏi với practices hiện tại và tìm ra các practices tốt hơn.

Cuối cùng, developer phải lựa chọn một trong 2 cách trên.

## Tips để viết clean code
Giờ là thời gian để học một vài tips để viết clean code. Như chúng ta đã thấy, clean code theo một số practices nhất định. Các practices làm code sạch sẽ hơn, dễ đọc, dễ mở rộng. Không cần thiết phải tuân theo thực hiện tất cả các practices. Thực hiện 1 hoặc 2 practices cũng sẽ mang đến kết quả tích cực

### 1. Làm code dễ đọc cho mọi người
Code của chúng ta viết ra sẽ được dịch bởi máy tính, điều này hoàn toàn là sự thật. Tuy nhiên, không đồng nghĩa với việc chúng ta bỏ qua việc viết clean code. Người khác có thể làm việc với code của bạn sau này, thậm chí chính bạn sẽ phải quay trở lại với chúng trong tương lai. Vì lí do này, bạn phải biết quan tâm tới code của bạn viết ra, làm cho nó dễ dàng để đọc và hiểu. Bằng cách nào???
Cách đơn giản nhất là dùng space, nó rút gọn code của bạn. Tuy nhiên, cũng không cần thiết viết code minify. Thay vào đó, chúng ta có thể sử dụng thụt lề, xuống dòng và dòng trống để làm cấu trúc code của bạn dễ đọc hơn. Khi chúng tôi quyết định thực hiện practices này, tính dễ đọc và tính dễ hiểu của code đã cải thiện đáng kể.

**Example 1:**

    // Bad
    const userData=[{userId: 1, userName: 'Anthony Johnson', memberSince: '08-01-2017', fluentIn: [ 'English', 'Greek', 'Russian']},{userId: 2, userName: 'Alice Stevens', memberSince: '02-11-2016', fluentIn: [ 'English', 'French', 'German']},{userId: 3, userName: 'Bradley Stark', memberSince: '29-08-2013', fluentIn: [ 'Czech', 'English', 'Polish']},{userId: 4, userName: 'Hirohiro Matumoto', memberSince: '08-05-2015', fluentIn: [ 'Chinese', 'English', 'German', 'Japanese']}];
    
    // Better
    const userData = [
      {
        userId: 1,
        userName: 'Anthony Johnson',
        memberSince: '08-01-2017',
        fluentIn: [
          'English',
          'Greek',
          'Russian'
        ]
      }, {
        userId: 2,
        userName: 'Alice Stevens',
        memberSince: '02-11-2016',
        fluentIn: [
          'English',
          'French',
          'German'
        ]
      }, {
        userId: 3,
        userName: 'Bradley Stark',
        memberSince: '29-08-2013',
        fluentIn: [
          'Czech',
          'English',
          'Polish'
        ]
      }, {
        userId: 4,
        userName: 'Hirohiro Matumoto',
        memberSince: '08-05-2015',
        fluentIn: [
          'Chinese',
          'English',
          'German',
          'Japanese'
        ]
      }
    ];
  
**Example 2:**
      
    // Bad
        
    class CarouselLeftArrow extends Component{render(){return ( <a href="#" className="carousel__arrow carousel__arrow--left" onClick={this.props.onClick}> <span className="fa fa-2x fa-angle-left"/> </a> );}};
    
    // Better
    class CarouselLeftArrow extends Component {
      render() {
        return (
          <a
            href="#"
            className="carousel__arrow carousel__arrow--left"
            onClick={this.props.onClick}
          >
            <span className="fa fa-2x fa-angle-left" />
          </a>
        );
      }
    };

### 2. Sử dụng tên có ý nghĩa cho variables, methods và function
Tips này sẽ cải thiện đáng kể tính dễ đọc cho code của bạn. Thế nào là tên có ý nghĩa?
Tên có ý nghĩa là tên mô tả đầy đủ chức năng, tính chất, làm cho người khác, không chỉ chúng ta - có thể hiểu được mục đích của variables, function và method. Ngoài ra, tên nên mô tả những gì variable, function hoặc method làm.

**Example:**

    // Bad
    const fnm = ‘Tom’;
    const lnm = ‘Hanks’;
    const x = 31;
    const l = lstnm.length;
    const boo = false;
    const curr = true;
    const sfn = ‘Remember the name’;
    const dbl = [‘1984’, ‘1987’, ‘1989’, ‘1991’].map((i) => {
      return i * 2;
    });
    
    // Better
    const firstName = ‘Tom’;
    const lastName = ‘Hanks’
    const age = 31;
    const lastNameLength = lastName.length;
    const isComplete = false;
    const isCurrentlyActive = true;
    const songFileName = ‘Remember the name’;
    const yearsDoubled = [‘1984’, ‘1987’, ‘1989’, ‘1991’].map((year) => {
      return year * 2;
    });
  
Tuy nhiên, tên cần được giới hạn từ 3 -> 4 từ. Nếu chúng ta cần sử dụng hơn 4 từ, có lẽ chúng ta đang gán quá nhiều chức năng cho tên, hãy đơn giản hóa nó. Nhớ rằng, chỉ sử dụng tên dài khi cần thiết.


### 3. Để function hoặc method thực hiện chỉ một task
Khi tôi bắt đầu viết code, tôi viết các function và method trông giống như con dao 2 lưỡi của quân đội thụy sĩ. Chúng xử lí hầu hết mọi thứ. Thứ 2, hầu hết mọi người không biết function hay method này làm gì, ngoại trừ tôi ( nhiều khi chính tôi cũng không hiểu :> ). Thứ 3, các function thường rất khó để đoán trước, tiềm ần nhiều bug. Tôi đã tạo nên một mớ code lộn xộn.

Rồi một ai đó đã cho tôi một lời khuyên hữu ích. Mỗi function, method chỉ thực hiện một task. Lời khuyên đơn giản này đã thay đổi mọi thứ và giúp tôi viết code clean hơn, ít nhất là hơn trước đó :)) Function của tôi đã trở nên dễ đọc hơn rất nhiều.

Nếu bạn gặp khó khăn trong việc tìm tên mô tả cho function hoặc method của bạn, hoặc bạn cần viết 
hướng dẫn cho mọi người hiểu được chúng, bạn nên cân nhắc thực hiện practices này. Để mỗi function hoặc method thực hiện chỉ một task. Tin tôi đi, code của bạn chắc chắn sẽ dễ đọc, dễ hiểu hơn rất nhiều.

    // Example no.1: Simple subtraction
    function subtract(x, y) {
        return x - y;
    }
    // Example no.1: Simple multiplication
    function multiply(x, y) {
        return x * y;
    }
    
    // Example no.1: Double numbers in an array
    function doubleArray(array) {
      return array.map(number => number * 2)
    }
 
### 4. Sử dụng comment để làm rõ ràng
Thỉng thoảng chúng ta có thể phải sử dụng các cách tiếp cận giải quyết vấn đề bởi vì không còn cách nào khác hoặc có thể chúng ta không có đủ thời gian để tìm một giải pháp tốt hơn. Điều này sẽ khó khăn để code giải thích nghĩa của chúng. Sử dụng comment có thể giải quyết được vấn đề này. Comment có thể giúp chúng ta giải thích với người khác tại sao chúng ta viết thế này và cụ thể chúng làm gì. 
Nên dùng comment chỉ khi nào cần thiết, không dùng comment để giải thích code xấu, lộn xộn. Nếu code không rõ ràng, chúng ta nên giải quyết vấn đề này bằng cách cải tiến code, không nên dùng comment trong trường hợp này, sẽ càng thêm rắc rối.

### 5. Tính nhất quán (consistency)
Khi chúng ta tìm practices hoặc style chúng ta thích, chúng ta nên sử dụng nó nhất quán trong project. Sử dụng các coding practices hoặc style khác nhau sẽ là ý tưởng không tốt một chút nào cả. Nó làm việc quay trở lại sử dụng các project trước đây trở nên khó khăn.
Điều tốt nhất là chọn một coding practices và gắn bó với nó trong project của chúng ta. Điều này làm mọi thứ trở nên dễ dàng khi chúng ta muốn cải tiến code và làm việc với nó. 
Câu hỏi đặt ra: Nếu muốn thử các coding style và practices thì làm thế nào? Đó là điều tốt, nó giúp ta tìm ra các phương pháp phù hợp với bản thân và project. Tuy nhiên, nó chỉ dành cho các project thử nghiệm, không phải cho project chính.
Tóm lại, chúng ta nên thử nhiều practices qua nhiều examples. Đúng là điều này sẽ mất thời gian, tuy nhiên nó dạy ta suy nghĩ về thay đổi đúng cách, thuận lợi hơn cho viêc maintain code.

### 6. Review Code thường xuyên
Đây là tips cuối cùng trong bài viết này. Viết code clean không hẳn là mọi thứ hoàn hảo. Công việc của chúng ta không hoàn thành với dấu chấm phẩy. Bước tiếp theo là giữ cho code clean. Công việc của chúng ta đòi hỏi code viết ra phải được maintain, không phải viết một lần rồi bỏ. Khi chúng ta viết một thứ gì đó, nên review lại và thử cải tiến code. Ngược lại, nếu chúng ta không review, code sẽ trở nên cũ kĩ, khó hiểu và  sớm bị thải loại. Nếu bạn muốn code của bạn là tốt nhất, hãy review và update chúng hàng ngày.
Code có xu hướng phức tạp và lộn xộn theo thời gian. Cách để ngăn chặn điều này là review và maintain code. Điều này có thể không cần thiết cho các dự án không còn sử dụng. Phần còn lại, maintain là một phần việc không thể thiếu.


## Kết luận
Chúng ta đã đi qua 6 tips để cải thiện skill clean code. Hi vọng nó sẽ giúp bạn trong việc bắt đầu viết clean code. Để làm được điều này, có thể sẽ phải cần  nhiều thời gian. Hãy luyện tập chúng thật nhiều. 

Source:  [https://hackernoon.com/6-simple-tips-on-how-to-start-writing-clean-code-d66c241aa268](https://hackernoon.com/6-simple-tips-on-how-to-start-writing-clean-code-d66c241aa268)

Bài dịch còn nhiều thiếu sót, mong bạn đọc thông cảm và nhận được sự đóng góp từ các bạn..!! Have a nice day.!
 
