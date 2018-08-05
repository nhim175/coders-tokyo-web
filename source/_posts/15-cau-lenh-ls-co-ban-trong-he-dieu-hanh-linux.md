---
title: 15 câu lệnh ls cơ bản trong hệ điều hành linux
date: 2018-08-06 01:07:26
authorId: manh_cuong
tags:
---
Câu lệnh `ls` là một trong những câu lệnh thường được sử dụng nhiều nhất trong Linux. Tôi tin rằng câu lệnh `ls` là câu lệnh bạn có thể sử dụng khi bạn vào terminal của Linux.
Tôi sử dụng câu lệnh `ls` hàng ngày và thường thì chúng tôi không nhận ra và cũng không bao giờ sử dụng các câu lệnh có trong linux. Trong bài viết này, chúng tôi sẽ thảo luận các câu lệnh `ls` cơ bản.
<!--more -->

### 1. List Files sử dụng `ls` không có tùy chọn
List File không có tùy chọn và thư mục, nơi chúng ta không thể xem chi tiết như file types, size, modified date and time, permission và link...etc..

    # ls
    0001.pcap        Desktop    Downloads         index.html   install.log.syslog  Pictures  Templates
    anaconda-ks.cfg  Documents  fbcmd_update.php  install.log  Music               Public    Videos

### 2. List Files với tùy chọn `-l`
Ở đây, `ls -l` hiện thị file hoặc thư mục, size, modified date and time, file hoặc folder name và permission của nó.

    # ls -l
    total 176
    -rw-r--r--. 1 root root   683 Aug 19 09:59 0001.pcap
    -rw-------. 1 root root  1586 Jul 31 02:17 anaconda-ks.cfg
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Desktop
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Documents
    drwxr-xr-x. 4 root root  4096 Aug 16 02:55 Downloads
    -rw-r--r--. 1 root root 21262 Aug 12 12:42 fbcmd_update.php
    -rw-r--r--. 1 root root 46701 Jul 31 09:58 index.html
    -rw-r--r--. 1 root root 48867 Jul 31 02:17 install.log
    -rw-r--r--. 1 root root 11439 Jul 31 02:13 install.log.syslog
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Music
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Pictures
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Public
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Templates
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Videos

### 3. Xem Files Ẩn
Danh sách file bao gồm file ẩn bắt đầu bằng dấu `.`

    # ls -a
    .                .bashrc  Documents         .gconfd          install.log         .nautilus     .pulse-cookie
    ..               .cache   Downloads         .gnome2          install.log.syslog  .netstat.swp  .recently-used.xbel
    0001.pcap        .config  .elinks           .gnome2_private  .kde                .opera        .spice-vdagent
    anaconda-ks.cfg  .cshrc   .esd_auth         .gtk-bookmarks   .libreoffice        Pictures      .tcshrc
    .bash_history    .dbus    .fbcmd            .gvfs            .local              .pki          Templates
    .bash_logout     Desktop  fbcmd_update.php  .ICEauthority    .mozilla            Public        Videos
    .bash_profile    .digrc   .gconf            index.html       Music               .pulse        .wireshark

### 4. List File với định dạng có thể đọc với tùy chọn `-lh`
Với sự kết hợp của tùy chọn `-lh`, hiển thị size trong định dạng có thể đọc được.

    # ls -lh
    total 176K
    -rw-r--r--. 1 root root  683 Aug 19 09:59 0001.pcap
    -rw-------. 1 root root 1.6K Jul 31 02:17 anaconda-ks.cfg
    drwxr-xr-x. 2 root root 4.0K Jul 31 02:48 Desktop
    drwxr-xr-x. 2 root root 4.0K Jul 31 02:48 Documents
    drwxr-xr-x. 4 root root 4.0K Aug 16 02:55 Downloads
    -rw-r--r--. 1 root root  21K Aug 12 12:42 fbcmd_update.php
    -rw-r--r--. 1 root root  46K Jul 31 09:58 index.html
    -rw-r--r--. 1 root root  48K Jul 31 02:17 install.log
    -rw-r--r--. 1 root root  12K Jul 31 02:13 install.log.syslog
    drwxr-xr-x. 2 root root 4.0K Jul 31 02:48 Music
    drwxr-xr-x. 2 root root 4.0K Jul 31 02:48 Pictures
    drwxr-xr-x. 2 root root 4.0K Jul 31 02:48 Public
    drwxr-xr-x. 2 root root 4.0K Jul 31 02:48 Templates
    drwxr-xr-x. 2 root root 4.0K Jul 31 02:48 Videos

### 5. List File và Directories với kí tự `/` ở cuối
Sử dụng tùy chọn `-F` cùng với câu lệnh `ls`, sẽ có kí tự `/` ở sau thư mục.

    # ls -F
    0001.pcap        Desktop/    Downloads/        index.html   install.log.syslog  Pictures/  Templates/
    anaconda-ks.cfg  Documents/  fbcmd_update.php  install.log  Music/              Public/    Videos/

### 6. List File theo thứ tự  đảo ngược
Câu lệnh với tùy chọn `ls -r` hiển thị files và directories theo thứ tự đảo ngược.

    # ls -r
    Videos     Public    Music               install.log  fbcmd_update.php  Documents  anaconda-ks.cfg
    Templates  Pictures  install.log.syslog  index.html   Downloads         Desktop    0001.pcap

### 7. Liệt kê các thư mục con
câu lệnh với tùy chọn ls-R sẽ hiển thị danh sách thư mục dưới dạng tree.

    # ls -R
    total 1384
    -rw-------. 1 root     root      33408 Aug  8 17:25 anaconda.log
    -rw-------. 1 root     root      30508 Aug  8 17:25 anaconda.program.log
    ./httpd:
    total 132
    -rw-r--r--  1 root root     0 Aug 19 03:14 access_log
    -rw-r--r--. 1 root root 61916 Aug 10 17:55 access_log-20120812
    ./lighttpd:
    total 68
    -rw-r--r--  1 lighttpd lighttpd  7858 Aug 21 15:26 access.log
    -rw-r--r--. 1 lighttpd lighttpd 37531 Aug 17 18:21 access.log-20120819
    ./nginx:
    total 12
    -rw-r--r--. 1 root root    0 Aug 12 03:17 access.log
    -rw-r--r--. 1 root root  390 Aug 12 03:17 access.log-20120812.gz

### 8. List File theo thời gian
Sự phối hợp của tùy chọn `-ltr` sẽ hiển thị file và directories theo thứ tự mới nhất.

    # ls -ltr
    total 176
    -rw-r--r--. 1 root root 11439 Jul 31 02:13 install.log.syslog
    -rw-r--r--. 1 root root 48867 Jul 31 02:17 install.log
    -rw-------. 1 root root  1586 Jul 31 02:17 anaconda-ks.cfg
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Desktop
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Videos
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Templates
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Public
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Pictures
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Music
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Documents
    -rw-r--r--. 1 root root 46701 Jul 31 09:58 index.html
    -rw-r--r--. 1 root root 21262 Aug 12 12:42 fbcmd_update.php
    drwxr-xr-x. 4 root root  4096 Aug 16 02:55 Downloads
    -rw-r--r--. 1 root root   683 Aug 19 09:59 0001.pcap

### 9. Sắp xếp File theo size
Câu lệnh `-lS` hiện thị file size theo thứ thự từ lớn đến nhỏ.

    # ls -lS
    total 176
    -rw-r--r--. 1 root root 48867 Jul 31 02:17 install.log
    -rw-r--r--. 1 root root 46701 Jul 31 09:58 index.html
    -rw-r--r--. 1 root root 21262 Aug 12 12:42 fbcmd_update.php
    -rw-r--r--. 1 root root 11439 Jul 31 02:13 install.log.syslog
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Desktop
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Documents
    drwxr-xr-x. 4 root root  4096 Aug 16 02:55 Downloads
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Music
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Pictures
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Public
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Templates
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Videos
    -rw-------. 1 root root  1586 Jul 31 02:17 anaconda-ks.cfg
    -rw-r--r--. 1 root root   683 Aug 19 09:59 0001.pcap

### 10. Hiển thị số Inode của File hoặc Directories
Chúng ta có thể nhìn thấy vài con số ở trước file/directory name. Với tùy chọn `-i` sẽ hiển thi danh sách file/directory cùng số inode.

    # ls -i
    20112 0001.pcap        23610 Documents         23793 index.html          23611 Music     23597 Templates
    23564 anaconda-ks.cfg  23595 Downloads            22 install.log         23612 Pictures  23613 Videos
    23594 Desktop          23585 fbcmd_update.php     35 install.log.syslog  23601 Public

### 11. Kiểm tra version của câu lệnh ls
Kiểm tra phiên bản của `ls`

    # ls --version
    ls (GNU coreutils) 8.4
    Copyright (C) 2010 Free Software Foundation, Inc.
    License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
    This is free software: you are free to change and redistribute it.
    There is NO WARRANTY, to the extent permitted by law.
    Written by Richard M. Stallman and David MacKenzie.

### 12. Hiển thị trang trợ giúp
Danh sách các câu lệnh trợ giúp sẽ nằm trong tùy chọn này.

    # ls --help
    Usage: ls [OPTION]... [FILE]...

### 13. Danh sách thông tin Directory
Với câu lệnh `ls -l`, các danh sách file dưới thư mục `/tmp`. Trong đó có tham số `-ld` hiển thị thông tin của thư mục `/tmp`

    # ls -l /tmp
    total 408
    drwx------. 2 narad narad   4096 Aug  2 02:00 CRX_75DAF8CB7768
    -r--------. 1 root  root  384683 Aug  4 12:28 htop-1.0.1.tar.gz
    drwx------. 2 root  root    4096 Aug  4 11:20 keyring-6Mfjnk
    drwx------. 2 root  root    4096 Aug 16 01:33 keyring-pioZJr
    drwx------. 2 gdm   gdm     4096 Aug 21 11:26 orbit-gdm
    drwx------. 2 root  root    4096 Aug 19 08:41 pulse-gl6o4ZdxQVrX
    drwx------. 2 narad narad   4096 Aug  4 08:16 pulse-UDH76ExwUVoU
    drwx------. 2 gdm   gdm     4096 Aug 21 11:26 pulse-wJtcweUCtvhn
    -rw-------. 1 root  root     300 Aug 16 03:34 yum_save_tx-2012-08-16-03-34LJTAa1.yumtx

    # ls -ld /tmp/
    drwxrwxrwt. 13 root root 4096 Aug 21 12:48 /tmp/

### 14. Hiển thị UID và GID của Files
Để hiển thị UID và GID của file và directories, sử dụng tùy chọn `-n` cùng câu lệnh ls

    # ls -n
    total 36
    drwxr-xr-x. 2 500 500 4096 Aug  2 01:52 Downloads
    drwxr-xr-x. 2 500 500 4096 Aug  2 01:52 Music
    drwxr-xr-x. 2 500 500 4096 Aug  2 01:52 Pictures
    -rw-rw-r--. 1 500 500   12 Aug 21 13:06 tmp.txt
    drwxr-xr-x. 2 500 500 4096 Aug  2 01:52 Videos

### 15. Câu lệnh ls và định danh của nó
Chúng ta tạo ra định danh cho câu lệnh `ls`, khi chúng ta thực thi câu lệnh `ls`, nó sẽ có tùy chọn `-l` theo mặc định và hiển thị danh sách dài như đã đề cập trước đó.

    # alias ls="ls -l"

**Chú ý:** Chúng ta có thể nhìn thấy số định danh khả dụng trong hệ thống của bạn bằng câu lệnh dưới đây và cũng có thể là không bí danh như ví dụ phía dưới

    # alias
    alias cp='cp -i'
    alias l.='ls -d .* --color=auto'
    alias ll='ls -l --color=auto'
    alias ls='ls --color=auto'
    alias mv='mv -i'
    alias rm='rm -i'
    alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'

Để xóa một định danh đã định nghĩa trước đó, chỉ cần sử dụng câu lệnh unalias

    # unalias ls

Source: [https://www.tecmint.com/15-basic-ls-command-examples-in-linux/](https://www.tecmint.com/15-basic-ls-command-examples-in-linux/)