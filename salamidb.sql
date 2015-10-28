-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Окт 28 2015 г., 10:12
-- Версия сервера: 5.6.26
-- Версия PHP: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `salamidb`
--

-- --------------------------------------------------------

--
-- Структура таблицы `album`
--

CREATE TABLE IF NOT EXISTS `album` (
  `album_id` int(11) NOT NULL,
  `facebook_album_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `picture_url` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `album`
--

INSERT INTO `album` (`album_id`, `facebook_album_id`, `name`, `description`, `picture_url`, `user_id`) VALUES
(18, '1378557972449974', 'Profile Pictures', 'unknown', 'https://scontent.xx.fbcdn.net/hphotos-xap1/v/t1.0-0/s180x540/10429412_1382705118701926_964606502965317900_n.jpg?oh=3ee85d63b17b367e96dde27eec062b54&oe=56C8402F', 20),
(29, '101843733509246', 'Lotos', 'Lotos collection', 'https://scontent.xx.fbcdn.net/hphotos-xpt1/v/l/t1.0-0/s180x540/12107133_101843750175911_8422451514008567875_n.jpg?oh=2877dd7b84c0e1c4265e9cc4cf452bb5&oe=56852201', 26),
(30, '165957790415497', 'stamps', 'postage stamps', 'https://scontent.xx.fbcdn.net/hphotos-xat1/v/t1.0-0/s180x540/12108740_165957800415496_2741463729455534445_n.jpg?oh=23dc56b7e6305368e116c3eb695eba69&oe=5684E82B', 27),
(31, '110326569326020', 'coins', 'collection', 'https://scontent.xx.fbcdn.net/hphotos-xpt1/v/t1.0-0/s180x540/12141545_110326579326019_3961874384867732017_n.jpg?oh=985b988b20af5a41be3517f83e15f2e3&oe=56CE6B94', 28),
(52, '711420958963588', 'Сollection', 'Бирдекели Украины', 'https://scontent.xx.fbcdn.net/hphotos-xpa1/v/t1.0-0/q88/s180x540/12112105_725930654179285_4669869719496727451_n.jpg?oh=1db7cbeb64754b7a17aab12631e678f6&oe=56C8E13D', 40),
(54, '117843415241877', 'collection', 'Bierdeckel Ukraine', 'https://scontent.xx.fbcdn.net/hphotos-xta1/v/t1.0-0/s180x540/11215138_117843525241866_4168645440851029155_n.jpg?oh=994d30011d52bb50f3aaf4f15766d6af&oe=56B9279E', 43);

-- --------------------------------------------------------

--
-- Структура таблицы `likes`
--

CREATE TABLE IF NOT EXISTS `likes` (
  `id` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `user1_id` int(11) NOT NULL,
  `user2_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `likes`
--

INSERT INTO `likes` (`id`, `type`, `user1_id`, `user2_id`) VALUES
(3, 'like', 26, 20),
(4, 'like', 40, 28),
(5, 'like', 40, 27),
(6, 'like', 40, 43);

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL,
  `text` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sender_id` int(11) NOT NULL,
  `recipient_id` int(11) NOT NULL,
  `state` varchar(8) NOT NULL DEFAULT 'new'
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `messages`
--

INSERT INTO `messages` (`id`, `text`, `created_at`, `sender_id`, `recipient_id`, `state`) VALUES
(1, 'Tcjfu', '2015-10-18 16:26:58', 40, 28, 'read'),
(2, 'Hgjf', '2015-10-18 16:27:13', 40, 28, 'read'),
(3, 'Hi', '2015-10-19 06:00:43', 40, 20, 'new'),
(4, 'Go', '2015-10-19 06:01:09', 40, 28, 'read'),
(5, 'Ghbgn', '2015-10-19 06:05:48', 40, 26, 'new'),
(6, 'Hi', '2015-10-19 11:38:45', 28, 40, 'read'),
(7, 'Привет!', '2015-10-23 11:45:06', 28, 28, 'read'),
(8, 'Hi', '2015-10-24 06:56:24', 27, 40, 'read'),
(9, 'Ага привет', '2015-10-24 07:24:23', 40, 28, 'read'),
(10, 'Привет', '2015-10-25 07:21:20', 40, 43, 'read'),
(11, 'Ты тут?', '2015-10-25 07:21:52', 40, 43, 'read'),
(12, 'Ээээээээээээээээээээээээээээээээйй', '2015-10-25 07:22:27', 40, 43, 'read'),
(13, 'Что-то чат глючит. Время закрывает часть сообщения', '2015-10-25 07:24:14', 40, 43, 'read'),
(14, 'А нет это только тогда когда одно слово невозможно перенести', '2015-10-25 07:25:36', 40, 43, 'read'),
(15, 'Foo', '2015-10-26 16:09:54', 40, 43, 'read'),
(16, 'Bar', '2015-10-26 16:10:25', 40, 43, 'read'),
(17, 'Привет', '2015-10-26 17:00:29', 40, 43, 'read'),
(18, '123', '2015-10-26 19:49:06', 43, 40, 'read'),
(19, '12345', '2015-10-26 19:58:38', 40, 43, 'read'),
(20, '12345', '2015-10-26 20:00:13', 43, 40, 'read'),
(21, '12345', '2015-10-26 20:09:10', 43, 40, 'read'),
(22, '12345', '2015-10-26 20:10:15', 43, 40, 'read'),
(23, '12345', '2015-10-26 20:36:00', 43, 40, 'read'),
(24, '11111', '2015-10-26 20:36:34', 43, 40, 'read'),
(25, '11', '2015-10-26 20:46:38', 40, 43, 'read'),
(26, '1', '2015-10-26 21:25:45', 40, 43, 'read'),
(27, '1', '2015-10-26 21:33:22', 40, 43, 'read'),
(28, '1', '2015-10-26 21:36:59', 40, 43, 'read'),
(29, 'uuu', '2015-10-27 06:34:36', 40, 43, 'read'),
(30, 'уууу', '2015-10-27 09:21:30', 40, 43, 'read'),
(31, 'уу', '2015-10-27 09:39:31', 40, 43, 'read'),
(32, 'yyyyyaaahuu', '2015-10-27 09:55:09', 43, 40, 'read'),
(33, 'yyyyyaaahuu', '2015-10-27 09:56:42', 43, 40, 'read'),
(34, 'yyyyyaaahuu', '2015-10-27 10:01:38', 43, 40, 'read'),
(35, 'Наш привет!', '2015-10-27 10:04:23', 43, 40, 'read'),
(36, 'Наш при!', '2015-10-27 10:17:46', 43, 40, 'read'),
(37, 'Наш и!', '2015-10-27 10:18:47', 43, 40, 'read'),
(38, 'Наш и!', '2015-10-27 12:13:01', 43, 40, 'read'),
(39, 'Наш и!', '2015-10-27 12:20:51', 43, 40, 'read'),
(40, 'Наш и!', '2015-10-27 12:35:00', 43, 40, 'read'),
(41, 'Наш и!', '2015-10-27 12:38:31', 43, 40, 'read'),
(42, 'Наш и!', '2015-10-27 12:43:42', 43, 40, 'read'),
(43, 'Н!', '2015-10-27 15:50:33', 43, 40, 'read'),
(44, '!', '2015-10-27 15:54:31', 43, 40, 'read'),
(45, 'какойто бред', '2015-10-27 15:57:44', 43, 40, 'read'),
(46, 'какойто бред', '2015-10-27 16:29:53', 43, 40, 'read'),
(47, 'А7', '2015-10-27 16:45:46', 40, 43, 'read'),
(48, 'Ага типа', '2015-10-27 18:57:11', 43, 40, 'read'),
(49, 'Qerty', '2015-10-27 19:05:51', 40, 43, 'read'),
(50, 'трудновато идёт', '2015-10-27 19:08:46', 43, 40, 'read'),
(51, 'телефон слабый', '2015-10-27 19:10:15', 43, 40, 'read'),
(52, 'слишком много фреймвёрка на маленький телефончик', '2015-10-27 19:36:53', 43, 40, 'read'),
(53, 'так ведь?', '2015-10-27 19:45:55', 43, 40, 'read'),
(54, 'Ага', '2015-10-27 19:48:35', 40, 43, 'read'),
(55, 'ладно, давай', '2015-10-27 19:57:07', 43, 40, 'read'),
(56, 'пока', '2015-10-27 20:07:32', 43, 40, 'read'),
(57, 'Пока', '2015-10-27 20:10:42', 40, 43, 'read'),
(58, 'привет', '2015-10-28 09:07:47', 43, 40, 'read');

-- --------------------------------------------------------

--
-- Структура таблицы `photos`
--

CREATE TABLE IF NOT EXISTS `photos` (
  `id` int(11) NOT NULL,
  `picture_url` varchar(255) DEFAULT NULL,
  `album_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `photos`
--

INSERT INTO `photos` (`id`, `picture_url`, `album_id`) VALUES
(11, 'https://scontent.xx.fbcdn.net/hphotos-xtp1/v/t1.0-9/10933865_1378557945783310_3310575411364636861_n.jpg?oh=10679996083987ba5e33ecfb66fe6338&oe=5699DCA2', 18),
(12, 'https://scontent.xx.fbcdn.net/hphotos-xap1/v/t1.0-9/p720x720/10429412_1382705118701926_964606502965317900_n.jpg?oh=194b501038ac0670fc1ad0f324624bae&oe=56916A11', 18),
(13, 'https://scontent.xx.fbcdn.net/hphotos-xpa1/v/t1.0-9/10526047_1382701098702328_2833924786505293382_n.jpg?oh=7aad2dc31d511fea47b7637b7d4fd6ec&oe=5686C694', 18),
(22, 'https://scontent.xx.fbcdn.net/hphotos-xtp1/v/t1.0-9/s720x720/12074814_101844716842481_1809716191345274592_n.jpg?oh=d149b33ed76c3e6aa4772799f0a78800&oe=569AEE43', 29),
(23, 'https://scontent.xx.fbcdn.net/hphotos-xpt1/l/t31.0-8/s720x720/12140174_101843750175911_8422451514008567875_o.jpg', 29),
(24, 'https://scontent.xx.fbcdn.net/hphotos-xat1/v/t1.0-9/s720x720/12108740_165957800415496_2741463729455534445_n.jpg?oh=da4d9267070e6e77cebf51cd3174386a&oe=56995906', 30),
(25, 'https://scontent.xx.fbcdn.net/hphotos-xtl1/v/t1.0-9/s720x720/12115598_165957803748829_2969230412695386788_n.jpg?oh=4bed290bdf9e9cef4d3d72b9c2a61d48&oe=569AB87B', 30),
(26, 'https://scontent.xx.fbcdn.net/hphotos-xpt1/v/t1.0-9/s720x720/12108957_165957797082163_1831225484055368211_n.jpg?oh=b8653cbf1798d3727c745995f77ac784&oe=56861A80', 30),
(27, 'https://scontent.xx.fbcdn.net/hphotos-xfl1/t31.0-8/s720x720/10256657_165957850415491_4842391096939785945_o.jpg', 30),
(28, 'https://scontent.xx.fbcdn.net/hphotos-xtp1/v/t1.0-9/12096388_165957857082157_5361670757533694584_n.jpg?oh=5a81dab0aec2edfeb5e05b697fd46972&oe=568F3700', 30),
(29, 'https://fbcdn-photos-c-a.akamaihd.net/hphotos-ak-xal1/t31.0-0/p180x540/12091198_165957890415487_4345181813894004784_o.jpg', 30),
(30, 'https://scontent.xx.fbcdn.net/hphotos-xta1/v/t1.0-0/p403x403/12088458_165957930415483_2916420496972438299_n.jpg?oh=2328664cb8c892a4e79efdebac28fa0b&oe=56895866', 30),
(31, 'https://scontent.xx.fbcdn.net/hphotos-xta1/v/t1.0-9/12108160_165957933748816_7010825664185736005_n.jpg?oh=ec0d20d49aac6df4ae5ae0194dda4d13&oe=568D21E4', 30),
(32, 'https://scontent.xx.fbcdn.net/hphotos-xpl1/v/t1.0-9/12115419_165957983748811_3724274402709462280_n.jpg?oh=3f9858a757a165b4f075e62d3568dba1&oe=5684CAA8', 30),
(33, 'https://scontent.xx.fbcdn.net/hphotos-xtp1/t31.0-8/s720x720/12113306_165957880415488_64709140579452196_o.jpg', 30),
(34, 'https://scontent.xx.fbcdn.net/hphotos-xpt1/v/t1.0-0/p180x540/12106935_165957943748815_6574410839862506476_n.jpg?oh=ccd83efd90769c1531cac8c3f6c8b791&oe=56CF2D9F', 30),
(35, 'https://scontent.xx.fbcdn.net/hphotos-xap1/v/t1.0-9/12065475_165958000415476_3784859778034232391_n.jpg?oh=277085f2ba8e023ec54283667537608e&oe=568F3824', 30),
(36, 'https://scontent.xx.fbcdn.net/hphotos-xtl1/t31.0-8/s720x720/12079831_165958010415475_2847130180345324823_o.jpg', 30),
(37, 'https://scontent.xx.fbcdn.net/hphotos-xpa1/t31.0-8/s720x720/12079997_165958040415472_9029972171107149818_o.jpg', 30),
(38, 'https://scontent.xx.fbcdn.net/hphotos-xat1/v/t1.0-9/12088414_165958050415471_8386106454166789052_n.jpg?oh=c616701e3dc2e92a809d164f4291d310&oe=56C515DF', 30),
(39, 'https://scontent.xx.fbcdn.net/hphotos-xtp1/v/t1.0-9/12106968_165958067082136_3481441337061911125_n.jpg?oh=4ae698ccae48f876a35cd9e45afea02f&oe=56C6DCA6', 30),
(40, 'https://scontent.xx.fbcdn.net/hphotos-xpa1/v/t1.0-9/12144899_165958120415464_3619759706511931315_n.jpg?oh=358787c2354f8b50e01917a8d64b9cbc&oe=568D3620', 30),
(41, 'https://scontent.xx.fbcdn.net/hphotos-xtp1/v/t1.0-9/s720x720/12122409_165958127082130_1289615597918886702_n.jpg?oh=886c1f7de0a8878cf0585c968ca14069&oe=5691FE87', 30),
(42, 'https://scontent.xx.fbcdn.net/hphotos-xtp1/t31.0-8/s720x720/12069020_110326585992685_200995786155656642_o.jpg', 31),
(43, 'https://scontent.xx.fbcdn.net/hphotos-xpt1/t31.0-8/s720x720/12080190_110326582659352_4894925261236295690_o.jpg', 31),
(44, 'https://scontent.xx.fbcdn.net/hphotos-xpt1/v/t1.0-9/s720x720/12141545_110326579326019_3961874384867732017_n.jpg?oh=dafda922c114ab30903f974475e30cdb&oe=56C5DEB9', 31),
(45, 'https://scontent.xx.fbcdn.net/hphotos-xat1/v/t1.0-0/p235x350/12109223_110326609326016_845114469997828767_n.jpg?oh=8e4f61a9989c658f77d3a2e7e23193f9&oe=569023F5', 31),
(46, 'https://scontent.xx.fbcdn.net/hphotos-xat1/v/t1.0-9/12088098_110326619326015_6330120098518832552_n.jpg?oh=0b1c0da277aeffaf6cbfbe2650205be3&oe=56CA547F', 31),
(47, 'https://scontent.xx.fbcdn.net/hphotos-xtp1/v/t1.0-9/s720x720/12107217_110326622659348_3628695258533638541_n.jpg?oh=4ed3e153383b2738e82028a610d83383&oe=56925AA2', 31),
(48, 'https://scontent.xx.fbcdn.net/hphotos-xap1/v/t1.0-9/s720x720/10523179_110326642659346_2596418611528428010_n.jpg?oh=18ff9560dd66a6a5414c6666e3459287&oe=56C72F5D', 31),
(49, 'https://scontent.xx.fbcdn.net/hphotos-xtp1/v/t1.0-9/12118860_110326655992678_1110805135944845846_n.jpg?oh=c109fd35b655727edca1e03ea5d1bee2&oe=56898182', 31),
(50, 'https://scontent.xx.fbcdn.net/hphotos-xta1/t31.0-8/s720x720/12113351_110326709326006_6832005690222047547_o.jpg', 31),
(51, 'https://scontent.xx.fbcdn.net/hphotos-xpa1/v/t1.0-9/12144892_110326662659344_9203421489412880889_n.jpg?oh=dd0b6a3d302cdc97a3b54153f4075cd3&oe=56897E22', 31),
(52, 'https://scontent.xx.fbcdn.net/hphotos-xpa1/t31.0-8/s720x720/12113469_110326715992672_3079801128466453025_o.jpg', 31),
(53, 'https://scontent.xx.fbcdn.net/hphotos-xlt1/v/t1.0-9/s720x720/12079255_110326722659338_499523552969184241_n.jpg?oh=d6f74ed72153fb389a6ef59d17faf7d5&oe=56D1F7AB', 31),
(54, 'https://scontent.xx.fbcdn.net/hphotos-xtl1/v/t1.0-9/12143069_110326762659334_8932455599752755508_n.jpg?oh=1adc3d6d7b58dc279ceccce002933149&oe=5689F57F', 31),
(55, 'https://scontent.xx.fbcdn.net/hphotos-xtp1/v/t1.0-9/12109137_110326775992666_1865922416956498933_n.jpg?oh=112bd0a776c5cda69892558249a355b3&oe=5699E9AB', 31),
(57, 'https://scontent.xx.fbcdn.net/hphotos-xpa1/v/t1.0-9/q81/s720x720/12112105_725930654179285_4669869719496727451_n.jpg?oh=62e222160c9a2dda5185af516a23b93e&oe=568EB240', 52),
(58, 'https://scontent.xx.fbcdn.net/hphotos-xpa1/v/t1.0-9/q81/s720x720/12115892_725930650845952_6831931144528044275_n.jpg?oh=429420202f8f87b289e98fc8413255e2&oe=56BDEC17', 52),
(59, 'https://scontent.xx.fbcdn.net/hphotos-xap1/v/t1.0-9/q81/s720x720/12122667_725930660845951_3635919114648228843_n.jpg?oh=c618e096d6dc37698e48095675a252de&oe=56C59F79', 52),
(60, 'https://scontent.xx.fbcdn.net/hphotos-xap1/v/t1.0-9/q82/s720x720/12109109_725930707512613_5028533448352559299_n.jpg?oh=095339e3e479ed9d1d61bb755fe72cba&oe=5689F39E', 52),
(61, 'https://scontent.xx.fbcdn.net/hphotos-xpl1/v/t1.0-9/q82/s720x720/10626798_725930657512618_2174102409025113814_n.jpg?oh=c4413982f0e0db9a1c1d6acf8cb2b297&oe=56CE6289', 52),
(62, 'https://scontent.xx.fbcdn.net/hphotos-xta1/v/t1.0-9/q82/s720x720/12115832_725930747512609_5284769653094298244_n.jpg?oh=3a00a48c55b5776e20df70cdec0fbfa9&oe=56CDA13F', 52),
(63, 'https://scontent.xx.fbcdn.net/hphotos-xat1/v/t1.0-9/q83/s720x720/12107205_725930744179276_2973879468768200098_n.jpg?oh=a196b6039816b17fff62d0c3cdbaeaa8&oe=568EF314', 52),
(64, 'https://scontent.xx.fbcdn.net/hphotos-xaf1/v/t1.0-9/q81/s720x720/10885302_725930740845943_4712730668615737445_n.jpg?oh=eaee52f41128a30ecd781bba11e37364&oe=56D1EE65', 52),
(65, 'https://scontent.xx.fbcdn.net/hphotos-xat1/v/t1.0-9/q81/s720x720/12107876_725930794179271_1212716769700105912_n.jpg?oh=8729bae7c4a51f367d89d707e7e04401&oe=568B82D8', 52),
(66, 'https://scontent.xx.fbcdn.net/hphotos-xtp1/v/t1.0-9/q82/s720x720/12144961_725930887512595_8228563351331127608_n.jpg?oh=4b8b314c4552498716841802e0b48880&oe=56CD1E3C', 52),
(67, 'https://scontent.xx.fbcdn.net/hphotos-xta1/v/t1.0-9/q82/s720x720/12109225_725930904179260_3428296434591639483_n.jpg?oh=fe8573a91a4c0cb27e358cca292b9f01&oe=5691C9D0', 52),
(68, 'https://scontent.xx.fbcdn.net/hphotos-xla1/v/t1.0-9/q82/s720x720/12141514_725930890845928_889317254522919374_n.jpg?oh=7a1eaed8b75e58b684410c3bebc8fb69&oe=56BEBB19', 52),
(69, 'https://scontent.xx.fbcdn.net/hphotos-xfa1/v/t1.0-9/q83/s720x720/1545841_725930930845924_6427551188354265433_n.jpg?oh=fae690de0e08f89b26ab44e5781c9acf&oe=56BF1D75', 52),
(70, 'https://scontent.xx.fbcdn.net/hphotos-xtl1/v/t1.0-0/q87/p235x350/12106700_725930947512589_2824327791800982354_n.jpg?oh=f6c83e4b5255d04a92dee3a69d5f0ab6&oe=56CD0698', 52),
(71, 'https://scontent.xx.fbcdn.net/hphotos-xta1/v/t1.0-9/s720x720/12112119_725930950845922_6204349224420740748_n.jpg?oh=0efe78c989aa437c3b72b972847a675a&oe=56C2CC62', 52),
(72, 'https://scontent.xx.fbcdn.net/hphotos-xat1/v/t1.0-9/q82/s720x720/12108150_725930984179252_7237432883425799393_n.jpg?oh=2926bfc90fd0cd965a23762e93a04e85&oe=56D1AD95', 52),
(73, 'https://scontent.xx.fbcdn.net/hphotos-xpt1/v/t1.0-9/q81/s720x720/12109098_725931000845917_5594049964652575359_n.jpg?oh=90cf917aef5c03eb217390781a84feb3&oe=56CE8C02', 52),
(74, 'https://scontent.xx.fbcdn.net/hphotos-xpa1/v/t1.0-9/q81/s720x720/10513366_725931054179245_2850967385294107685_n.jpg?oh=d0e94a3884a51d3dd8244b00bc036d0a&oe=56C42854', 52),
(75, 'https://fbcdn-sphotos-g-a.akamaihd.net/hphotos-ak-xta1/v/t1.0-9/s720x720/11218775_725931044179246_9165665699306393340_n.jpg?oh=aa09c7dd877e46c1292d9c53cb19f938&oe=56C81429&__gda__=1455051612_c2cca0c307072bbd7aa298c4baf297c2', 52),
(76, 'https://scontent.xx.fbcdn.net/hphotos-xap1/v/t1.0-9/s720x720/12065698_725931057512578_6070806490108198096_n.jpg?oh=c569d65c0b359fb1434232786ba8e5bb&oe=5691CEFC', 52),
(77, 'https://scontent.xx.fbcdn.net/hphotos-xpt1/v/t1.0-9/s720x720/11181935_725931084179242_4515371505273688545_n.jpg?oh=97fab0523b6269cfd0c09340a8cc3033&oe=56BF1C16', 52),
(78, 'https://scontent.xx.fbcdn.net/hphotos-xat1/v/t1.0-9/s720x720/12115858_725931107512573_4746921069504937789_n.jpg?oh=7bfc9be8190a376386db9d5504f17a00&oe=56CA9373', 52),
(79, 'https://scontent.xx.fbcdn.net/hphotos-xap1/v/t1.0-9/s720x720/12107847_725931110845906_9041979963750594137_n.jpg?oh=48be816c113e8411d898371b26c63bef&oe=568E0C98', 52),
(80, 'https://scontent.xx.fbcdn.net/hphotos-xpt1/v/t1.0-9/q85/s720x720/12122659_725931114179239_5883457882247291256_n.jpg?oh=9a086bee3445552c67a0f37aa3d22642&oe=56C66100', 52),
(81, 'https://scontent.xx.fbcdn.net/hphotos-xpa1/v/t1.0-9/q84/s720x720/10462445_725931140845903_4320844679882407999_n.jpg?oh=a49a776b02138a0dbaae66e57e7ce9cc&oe=56C4D8E6', 52),
(107, 'https://scontent.xx.fbcdn.net/hphotos-xtf1/t31.0-8/s720x720/12029842_117843471908538_6134226779144352478_o.jpg', 54),
(108, 'https://scontent.xx.fbcdn.net/hphotos-xta1/t31.0-8/s720x720/11950189_117843525241866_4168645440851029155_o.jpg', 54),
(109, 'https://scontent.xx.fbcdn.net/hphotos-xtf1/t31.0-8/s720x720/12183828_117843478575204_4928111126361252737_o.jpg', 54),
(110, 'https://scontent.xx.fbcdn.net/hphotos-xft1/t31.0-8/s720x720/12052427_117843491908536_5824412373769443153_o.jpg', 54),
(111, 'https://scontent.xx.fbcdn.net/hphotos-xpa1/t31.0-8/s720x720/12182720_117843538575198_6232811413227001487_o.jpg', 54),
(112, 'https://scontent.xx.fbcdn.net/hphotos-xfa1/t31.0-8/s720x720/12052599_117843628575189_4277661407451356047_o.jpg', 54),
(113, 'https://scontent.xx.fbcdn.net/hphotos-xtp1/t31.0-8/s720x720/12185412_117843621908523_2291966680407158263_o.jpg', 54),
(114, 'https://scontent.xx.fbcdn.net/hphotos-xla1/t31.0-8/s720x720/12182999_117843608575191_1004585261845944104_o.jpg', 54),
(115, 'https://scontent.xx.fbcdn.net/hphotos-xaf1/t31.0-8/s720x720/12030548_117843638575188_825218977192734212_o.jpg', 54),
(116, 'https://scontent.xx.fbcdn.net/hphotos-xpf1/t31.0-8/s720x720/12185162_117843668575185_5512235699868918368_o.jpg', 54),
(117, 'https://scontent.xx.fbcdn.net/hphotos-xaf1/t31.0-8/s720x720/10431286_117843641908521_8780388379704240740_o.jpg', 54),
(118, 'https://scontent.xx.fbcdn.net/hphotos-xpf1/t31.0-8/s720x720/12182687_117843685241850_5220042768643670642_o.jpg', 54),
(119, 'https://scontent.xx.fbcdn.net/hphotos-xfp1/t31.0-8/s720x720/12034458_117843691908516_6083575230200717301_o.jpg', 54),
(120, 'https://scontent.xx.fbcdn.net/hphotos-xpf1/t31.0-8/s720x720/12185110_117843861908499_945664022144965767_o.jpg', 54),
(121, 'https://fbcdn-sphotos-f-a.akamaihd.net/hphotos-ak-xap1/t31.0-8/s720x720/12183737_117844021908483_4292064966063402150_o.jpg', 54),
(122, 'https://scontent.xx.fbcdn.net/hphotos-xfl1/t31.0-8/s720x720/12029623_117844055241813_8282608078191687970_o.jpg', 54),
(123, 'https://scontent.xx.fbcdn.net/hphotos-xpf1/v/t1.0-9/1932215_117844071908478_300655867098335228_n.jpg?oh=71ea417823197a73eaee7f720d0290be&oe=56BC1B35', 54),
(124, 'https://scontent.xx.fbcdn.net/hphotos-xaf1/t31.0-8/s720x720/12182878_117844061908479_3389381259394367993_o.jpg', 54),
(125, 'https://scontent.xx.fbcdn.net/hphotos-xpt1/v/t1.0-9/12112049_117844105241808_5529029513995415_n.jpg?oh=436b942e96ddb57a52c61a23564b15bb&oe=56BF5458', 54),
(126, 'https://scontent.xx.fbcdn.net/hphotos-xtf1/v/t1.0-9/12039477_117844115241807_7927136802742415870_n.jpg?oh=df8f4a9a84bdd8946ec88a1e2499c539&oe=56BFA37C', 54),
(127, 'https://scontent.xx.fbcdn.net/hphotos-xpf1/v/t1.0-9/12032101_117844148575137_4852383304843061520_n.jpg?oh=657868b1126a408e8ab761423bb15767&oe=56C80FF4', 54),
(128, 'https://scontent.xx.fbcdn.net/hphotos-xpt1/v/t1.0-9/11218844_117844161908469_5664315610488990699_n.jpg?oh=dce82bfd61aa79f10fb147eef7a1ea6c&oe=56BC63D6', 54),
(129, 'https://scontent.xx.fbcdn.net/hphotos-xtf1/t31.0-8/s720x720/12186516_117844171908468_1503527354358370972_o.jpg', 54),
(130, 'https://scontent.xx.fbcdn.net/hphotos-xtf1/t31.0-8/s720x720/12183823_117844195241799_7194869172028732593_o.jpg', 54),
(131, 'https://scontent.xx.fbcdn.net/hphotos-xpt1/v/t1.0-9/12079554_117844181908467_8067780683163477913_n.jpg?oh=51bb606d4682ee49433fb728106dab78&oe=56CB8F7F', 54);

-- --------------------------------------------------------

--
-- Структура таблицы `salami_user`
--

CREATE TABLE IF NOT EXISTS `salami_user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) NOT NULL,
  `birthday` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `facebook_id` varchar(255) NOT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `collection_type` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `salami_user`
--

INSERT INTO `salami_user` (`id`, `email`, `create_time`, `name`, `birthday`, `gender`, `facebook_id`, `profile_picture`, `collection_type`, `location`) VALUES
(20, 'alexey.zapriy@yahoo.com', '2015-10-11 14:29:00', 'Alexey Belous', '07/03/1992', 'male', '1479429089029528', 'https://scontent.xx.fbcdn.net/hprofile-xap1/v/t1.0-1/p320x320/10429412_1382705118701926_964606502965317900_n.jpg?oh=7ac649358668b7c7b08c100261096fce&oe=56906FBE', 'pennants', '49.849956,36.113926'),
(26, 'sandra_mqmqvto_sadansky@tfbnw.net', '2015-10-13 11:46:09', 'Sandra Sadansky', '08/08/1980', 'female', '101841960176090', 'https://scontent.xx.fbcdn.net/hprofile-xpa1/v/t1.0-1/c94.0.320.320/p320x320/1379841_10150004552801901_469209496895221757_n.jpg?oh=e253a2d78ead3f2426e1561da458c912&oe=56933CA7', 'banknotes', ','),
(27, 'open_ysilzmw_graph@tfbnw.net', '2015-10-13 17:21:04', 'Open Graph', '08/08/1980', 'female', '147645692246707', 'https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xat1/v/t1.0-1/p320x320/12112095_165957603748849_1027339380420748977_n.jpg?oh=8acfe6fb238e27f751e9914670fa3d94&oe=56D2F246&__gda__=1452238433_c8832249ab48cce34a06880835384194', 'stamps', '49.695632,36.357829'),
(28, 'ba_ojpwpjt_ch@tfbnw.net', '2015-10-13 17:38:34', 'Ba Mo Ch', '08/08/1980', 'female', '110331562658854', 'https://scontent.xx.fbcdn.net/hprofile-xtl1/v/t1.0-1/p320x320/12105798_110325709326106_6825826830498483753_n.jpg?oh=75fbea13cabae7d1f104e8d75bb3c725&oe=56CFD7BB', 'coins', ','),
(40, 'zapriy.05@mail.ru', '2015-10-15 14:15:48', 'Roman Zapriy', '05/09/1983', 'male', '699292513509766', 'https://scontent.xx.fbcdn.net/hprofile-xpf1/v/t1.0-1/p320x320/11822756_695230833915934_8640396150136684128_n.jpg?oh=847feafbfd4a114eaff33b995891b9b6&oe=56853A25', 'bierdeckels', '49.6816868,36.3317524'),
(43, 'john_qegopqk_li@tfbnw.net', '2015-10-24 16:50:12', 'John Li', '08/08/1980', 'male', '118001368559415', 'https://scontent.xx.fbcdn.net/hprofile-xlf1/v/t1.0-1/p320x320/1508212_117842371908648_166582767137546766_n.jpg?oh=9fc0d60d7a90c128db3c8db2e8e39139&oe=56B83E5E', 'bierdeckels', ',');

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `salami_user_id` int(11) NOT NULL,
  `distance` int(11) DEFAULT NULL,
  `collection_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `settings`
--

INSERT INTO `settings` (`salami_user_id`, `distance`, `collection_type`) VALUES
(40, -1, '_');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`album_id`),
  ADD KEY `fk_album_user_idx` (`user_id`);

--
-- Индексы таблицы `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`,`user1_id`,`user2_id`),
  ADD KEY `fk_likes_salami_user1_idx` (`user1_id`),
  ADD KEY `fk_likes_salami_user2_idx` (`user2_id`);

--
-- Индексы таблицы `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`,`sender_id`,`recipient_id`),
  ADD KEY `fk_messages_salami_user_idx` (`sender_id`),
  ADD KEY `fk_messages_salami_user1_idx` (`recipient_id`);

--
-- Индексы таблицы `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `photos_ibfk_1` (`album_id`);

--
-- Индексы таблицы `salami_user`
--
ALTER TABLE `salami_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `facebook_id` (`facebook_id`);

--
-- Индексы таблицы `settings`
--
ALTER TABLE `settings`
  ADD UNIQUE KEY `salami_user_id` (`salami_user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `album`
--
ALTER TABLE `album`
  MODIFY `album_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT для таблицы `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT для таблицы `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=132;
--
-- AUTO_INCREMENT для таблицы `salami_user`
--
ALTER TABLE `salami_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=44;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `fk_album_user` FOREIGN KEY (`user_id`) REFERENCES `salami_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `fk_likes_salami_user1` FOREIGN KEY (`user1_id`) REFERENCES `salami_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_likes_salami_user2` FOREIGN KEY (`user2_id`) REFERENCES `salami_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `fk_messages_salami_user` FOREIGN KEY (`sender_id`) REFERENCES `salami_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_messages_salami_user1` FOREIGN KEY (`recipient_id`) REFERENCES `salami_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `photos`
--
ALTER TABLE `photos`
  ADD CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `album` (`album_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `settings`
--
ALTER TABLE `settings`
  ADD CONSTRAINT `settings_ibfk_1` FOREIGN KEY (`salami_user_id`) REFERENCES `salami_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
