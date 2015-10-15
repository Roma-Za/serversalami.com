-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Окт 15 2015 г., 20:29
-- Версия сервера: 5.6.24
-- Версия PHP: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `album`
--

INSERT INTO `album` (`album_id`, `facebook_album_id`, `name`, `description`, `picture_url`, `user_id`) VALUES
(18, '1378557972449974', 'Profile Pictures', 'unknown', 'https://scontent.xx.fbcdn.net/hphotos-xap1/v/t1.0-0/s180x540/10429412_1382705118701926_964606502965317900_n.jpg?oh=3ee85d63b17b367e96dde27eec062b54&oe=56C8402F', 20),
(29, '101843733509246', 'Lotos', 'Lotos collection', 'https://scontent.xx.fbcdn.net/hphotos-xpt1/v/l/t1.0-0/s180x540/12107133_101843750175911_8422451514008567875_n.jpg?oh=2877dd7b84c0e1c4265e9cc4cf452bb5&oe=56852201', 26),
(30, '165957790415497', 'stamps', 'postage stamps', 'https://scontent.xx.fbcdn.net/hphotos-xat1/v/t1.0-0/s180x540/12108740_165957800415496_2741463729455534445_n.jpg?oh=23dc56b7e6305368e116c3eb695eba69&oe=5684E82B', 27),
(31, '110326569326020', 'coins', 'collection', 'https://scontent.xx.fbcdn.net/hphotos-xpt1/v/t1.0-0/s180x540/12141545_110326579326019_3961874384867732017_n.jpg?oh=985b988b20af5a41be3517f83e15f2e3&oe=56CE6B94', 28),
(48, '711420958963588', 'Сollection', 'типа коллекция', 'https://scontent.xx.fbcdn.net/hphotos-xtp1/v/t1.0-0/s180x540/12003346_711421015630249_1739596090561163625_n.jpg?oh=fc485152b163eda7e1c8ff502b6bc9bf&oe=56992364', 40);

-- --------------------------------------------------------

--
-- Структура таблицы `likes`
--

CREATE TABLE IF NOT EXISTS `likes` (
  `id` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `user1_id` int(11) NOT NULL,
  `user2_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `likes`
--

INSERT INTO `likes` (`id`, `type`, `user1_id`, `user2_id`) VALUES
(3, 'like', 26, 20),
(4, 'like', 40, 28);

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL,
  `text` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sender_id` int(11) NOT NULL,
  `recipient_id` int(11) NOT NULL,
  `state` varchar(8) NOT NULL DEFAULT 'new'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1443113717),
('m130524_201442_init', 1443113737);

-- --------------------------------------------------------

--
-- Структура таблицы `photos`
--

CREATE TABLE IF NOT EXISTS `photos` (
  `id` int(11) NOT NULL,
  `picture_url` varchar(255) DEFAULT NULL,
  `album_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

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
(79, 'https://scontent.xx.fbcdn.net/hphotos-xtp1/v/t1.0-9/q81/s720x720/12003346_711421015630249_1739596090561163625_n.jpg?oh=8ff61c29aeb5b6465f341a937eac9a30&oe=56D309E2', 48),
(80, 'https://scontent.xx.fbcdn.net/hphotos-xta1/v/t1.0-9/s720x720/12004110_711421415630209_1305689299921036111_n.jpg?oh=51d41c1ad46666f1e40d941e410cae15&oe=56D09BB4', 48);

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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `salami_user`
--

INSERT INTO `salami_user` (`id`, `email`, `create_time`, `name`, `birthday`, `gender`, `facebook_id`, `profile_picture`, `collection_type`, `location`) VALUES
(20, 'alexey.zapriy@yahoo.com', '2015-10-11 14:29:00', 'Alexey Belous', '07/03/1992', 'male', '1479429089029528', 'https://scontent.xx.fbcdn.net/hprofile-xap1/v/t1.0-1/p320x320/10429412_1382705118701926_964606502965317900_n.jpg?oh=7ac649358668b7c7b08c100261096fce&oe=56906FBE', 'pennants', '49.849956,36.113926'),
(26, 'sandra_mqmqvto_sadansky@tfbnw.net', '2015-10-13 11:46:09', 'Sandra Sadansky', '08/08/1980', 'female', '101841960176090', 'https://scontent.xx.fbcdn.net/hprofile-xpa1/v/t1.0-1/c94.0.320.320/p320x320/1379841_10150004552801901_469209496895221757_n.jpg?oh=e253a2d78ead3f2426e1561da458c912&oe=56933CA7', 'banknotes', ','),
(27, 'open_ysilzmw_graph@tfbnw.net', '2015-10-13 17:21:04', 'Open Graph', '08/08/1980', 'female', '147645692246707', 'https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xat1/v/t1.0-1/p320x320/12112095_165957603748849_1027339380420748977_n.jpg?oh=8acfe6fb238e27f751e9914670fa3d94&oe=56D2F246&__gda__=1452238433_c8832249ab48cce34a06880835384194', 'stamps', '49.695632,36.357829'),
(28, 'ba_ojpwpjt_ch@tfbnw.net', '2015-10-13 17:38:34', 'Ba Mo Ch', '08/08/1980', 'female', '110331562658854', 'https://scontent.xx.fbcdn.net/hprofile-xtl1/v/t1.0-1/p320x320/12105798_110325709326106_6825826830498483753_n.jpg?oh=75fbea13cabae7d1f104e8d75bb3c725&oe=56CFD7BB', 'coins', ','),
(40, 'zapriy.05@mail.ru', '2015-10-15 14:15:48', 'Roman Zapriy', '05/09/1983', 'male', '699292513509766', 'https://scontent.xx.fbcdn.net/hprofile-xpf1/v/t1.0-1/p320x320/11822756_695230833915934_8640396150136684128_n.jpg?oh=847feafbfd4a114eaff33b995891b9b6&oe=56853A25', 'stamps', '49.693491,36.297096');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'romka', 'cfw3cRfGNCDM5nJ7hh5LBITSN6fNjbIO', '$2y$13$it2d1LW9yxi5rO6iAjEwWuRIy/aIlLPDXPyNhrPFxlGtRUQBBUr7e', NULL, 'romka@ttt.com', 10, 1443171404, 1443171404),
(2, 'ppp', 'NXXhAw2aM8dcwYjGiwf69KJYkXOwM9EB', '$2y$13$QJcOKZaIzT/GSneDtj/A2etOpPqV0fLEctRDmFSSjuuVa.8NZKpOG', NULL, 'ppppa@111.com', 10, 1443172536, 1443172536),
(3, '123456', '', '$2y$13$ju.1Bb/M6DtNQIiD7KYWJeL39iMC69Bup0GA1C8QySKzO2vSgXQB2', NULL, '123456@123.com', 10, 1443191665, 1443191665);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`album_id`), ADD KEY `fk_album_user_idx` (`user_id`);

--
-- Индексы таблицы `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`,`user1_id`,`user2_id`), ADD KEY `fk_likes_salami_user1_idx` (`user1_id`), ADD KEY `fk_likes_salami_user2_idx` (`user2_id`);

--
-- Индексы таблицы `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`,`sender_id`,`recipient_id`), ADD KEY `fk_messages_salami_user_idx` (`sender_id`), ADD KEY `fk_messages_salami_user1_idx` (`recipient_id`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`), ADD KEY `photos_ibfk_1` (`album_id`);

--
-- Индексы таблицы `salami_user`
--
ALTER TABLE `salami_user`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `facebook_id` (`facebook_id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `album`
--
ALTER TABLE `album`
  MODIFY `album_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT для таблицы `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT для таблицы `salami_user`
--
ALTER TABLE `salami_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
