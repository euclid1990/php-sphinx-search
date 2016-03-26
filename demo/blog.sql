-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 26, 2016 at 05:57 PM
-- Server version: 5.5.47-0ubuntu0.12.04.1
-- PHP Version: 5.5.33-1+deb.sury.org~precise+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'C/C++', '2016-03-01 00:00:00', NULL, NULL),
(2, 'Java', '2016-03-01 00:00:00', NULL, NULL),
(3, 'PHP', '2016-03-01 00:00:00', NULL, NULL),
(4, 'MySQL', '2016-03-01 00:00:00', NULL, NULL),
(5, 'Vietnamese', '2016-03-01 00:00:00', NULL, NULL),
(6, 'Japanese', '2016-03-01 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `content`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Introduction to C++', 'C++ is a huge language so much that it uses various sets of instructions from different parts to do its work. Some of these instructions come in computer files that you simply "put" in your program. These instructions or files are also called libraries. To make your job easier, some of these libraries have already been written for you so that as you include them in your program, you already have a good foundation to continue your construction. Yet, some of these libraries have their limitations, which means you will expand them by writing or including your own libraries.', '2016-04-01 00:00:00', NULL, NULL),
(2, 1, 'C++ Projects and Linkage', 'A computer application is primarily a series of files put together to compose a single entity. With previous generations of programming, you had to create text files, save them with a source code .c, a .cc, or a .cpp extension, link them and compile them. Many modern programming environments allow you to create the files and hand them to the compiler that would link them as a project, and then create an executable. In reality, the process has not changed, it has only been made easier and faster. Still, because the programming environments are developed by different companies, each presents its own way of creating the necessary files, compiling them, and creating an executable.', '2016-04-01 00:00:00', NULL, NULL),
(3, 2, 'Java And Internet - Creating Java Applet', 'Internet helped Java to bring it to the forefront and Java influenced Internet by simplifying the web programming and inventing applets. Applets expanded the scope of internet. Java also addressed two other important issues of internet, which are security and portability.', '2016-04-01 00:00:00', NULL, NULL),
(4, 2, 'Modern ways of Suspending, Resuming, and Stopping Threads', 'The earlier support provided by JDK 1.1 to manage threads using suspend(), resume() and stop() are no more relevant since they are deprecated in Java programing source. The suspend method is deprecated because when a thread which has lock is suspended, it causes the other threads to wait. Reference the followings code.', '2016-04-01 00:00:00', NULL, NULL),
(5, 3, 'PHP 7 Migration Guide', 'PHP 7 is out since December 2015 and several updates were released. Its advantages compare to PHP 5.x are huge but first you need to consider what are the backwards incompatible changes so you can evaluate the effort that it may take you, so it does not break your existing applications.', '2016-04-01 00:00:00', NULL, NULL),
(6, 3, 'PHP Source Code Protection Solutions', 'Many PHP developers need to protect their source code programing when they distribute it to customers, to minimize the chances of their work being altered or copied without their permissions.\r\n\r\nRead this article to learn about PHP source code protection solutions in general, and how PackApp package can help protecting your PHP source code.', '2016-04-01 00:00:00', NULL, NULL),
(7, 1, 'MySQL Applier for Hadoop', 'Big Data is transforming the way organizations harness new insights from their business, and Apache Hadoop is at the center of that transformation.\r\n\r\nTo support this growing emphasis on real-time operations, MySQL is releasing a new Hadoop Applier to enable the replication of events from MySQL to Hadoop / Hive / HDFS (Hadoop Distributed File System) as they happen. The Hadoop Applier complements existing batch-based Apache Sqoop connectivity.\r\n\r\nThis developer article gives you everything you need to get started in implementing real-time MySQL to Hadoop integration.', '2016-04-01 00:00:00', NULL, NULL),
(8, 2, 'MySQL Replication Utilities', 'Learn how to use MySQL 5.6 and the MySQL Utilities to setup, monitor and manage your MySQL replication topology. See how a single command can be used to add replication slaves. See for yourself how easy it is to use the utilities to continually monitor the replication master and then automatically promote the most appropriate slave in the event of a failure. For those who prefer more user control, the monitoring can run in an alert-only mode and you\'ll learn how you can manually initiate failover using a single command.', '2016-04-01 00:00:00', NULL, NULL),
(9, 3, 'Getting started with DTracing MySQL', 'DTrace is a dynamic tracing facility built into the Solaris and Open Solaris operating systems and can be used by system administrators and developers alike to observe the runtime behavior of user level programs and of the operating system itself. On one hand, DTrace can be used to identify potential bottlenecks in the running processes on a production system and on the other DTrace can help you understand the runtime behavior of an external program such as MySQL better.', '2016-04-01 00:00:00', NULL, NULL),
(10, 1, '5 cách để làm trang web của bạn nhẹ và nhanh hơn', '5 cách để làm trang web của bạn nhẹ và nhanh hơn Dưới đây là 5 "chiêu" mạnh mẽ mà bạn có thể hoàn thành chỉ trong vài phút để làm trang web của bạn nhanh hơn cho tất cả người sử dụng!', '2016-04-01 00:00:00', NULL, NULL),
(11, 2, '30 đoạn biểu thức chính quy mà lập trình viên web nên biết', 'Biểu thức chính quy (hay regex) là một công cụ mạnh mẽ mà mỗi nhà phát triển nên biết. Nó có thể khớp với một chuỗi các ký tự dựa trên các thông số rất phức tạp nhưng lại rất nhanh, và có thể giúp bạn tiết kiệm rất nhiều thời gian khi xây dựng các trang web động.\n\nDù các nhà phát triển Web phải đối mặt với nhiều nhiệm vụ khác nhau hơn so với các nhà phát triển phần mềm, nhưng đa số trong đó vẫn có cùng mã nền tảng. Biểu thức chính quy hơi khó học lúc đầu, nhưng có thể rất mạnh mẽ khi được sử dụng một cách chính xác. Biểu thức chính quy cũng thường được bắt gặp trong rất mã nguồn.', '2016-04-01 00:00:00', NULL, NULL),
(12, 3, 'Những sai lầm thường gặp về outsourcing', 'Trong quyển sách Beyond Java, xuất bản vài năm trước có đoạn:\r\n\r\n[Java has characteristics that many of us take for granted. You can find good Java developers everywhere. No one ever gets fired for choosing Java. It\'s mature and ready for outsourcing.]\r\n\r\nTại sao lại nói Java là "ready for outsourcing"?\r\nÝ nghĩa sâu xa của câu này là gì? Chúng ta thử tìm hiểu xem sao.', '2016-04-01 00:00:00', NULL, NULL),
(13, 1, '第一：紹介 (しょうかい) ', 'A: こんにちは！\r\nB: こんにちは。私(わたし)は青木です。\r\nA:　私はリーです。', '2016-04-01 00:00:00', NULL, NULL),
(14, 2, '第二：訪問（ほうもん）', 'A:　これは何（なん）ですか？\nB:　それは辞書（じしょ）です。\nA:　ああ、辞書ですか。', '2016-04-01 00:00:00', NULL, NULL),
(15, 3, '第三：電話（でんわ）', 'A:　もしもし、Bさんのお宅（たく）ですか？\r\nB:　はい、そうです。\r\nA:　Bさんは今日（きょう）どこへ行きますか？\r\nB:　私は今日工場へ行きます。Aさんも行きますか。\r\nA:　いいえ、私は行きません。', '2016-04-01 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posts_categories`
--

CREATE TABLE `posts_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts_categories`
--

INSERT INTO `posts_categories` (`id`, `post_id`, `category_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, '2016-04-01 00:00:00', NULL, NULL),
(2, 2, 1, '2016-04-01 00:00:00', NULL, NULL),
(3, 3, 2, '2016-04-01 00:00:00', NULL, NULL),
(4, 4, 2, '2016-04-01 00:00:00', NULL, NULL),
(5, 5, 3, '2016-04-01 00:00:00', NULL, NULL),
(6, 6, 3, '2016-04-01 00:00:00', NULL, NULL),
(7, 7, 4, '2016-04-01 00:00:00', NULL, NULL),
(8, 8, 4, '2016-04-01 00:00:00', NULL, NULL),
(9, 9, 4, '2016-04-01 00:00:00', NULL, NULL),
(10, 10, 5, '2016-04-01 00:00:00', NULL, NULL),
(11, 11, 5, '2016-04-01 00:00:00', NULL, NULL),
(12, 12, 5, '2016-04-01 00:00:00', NULL, NULL),
(13, 13, 6, '2016-04-01 00:00:00', NULL, NULL),
(14, 14, 6, '2016-04-01 00:00:00', NULL, NULL),
(15, 15, 6, '2016-04-01 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Alex', '2016-03-01 00:00:00', NULL, NULL),
(2, 'Peter', '2016-03-02 00:00:00', NULL, NULL),
(3, 'Susan', '2016-03-03 00:00:00', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts_categories`
--
ALTER TABLE `posts_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `posts_categories`
--
ALTER TABLE `posts_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
