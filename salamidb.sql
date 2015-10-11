-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Окт 11 2015 г., 15:56
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `album`
--

INSERT INTO `album` (`album_id`, `facebook_album_id`, `name`, `description`, `picture_url`, `user_id`) VALUES
(17, '711420958963588', 'Сollection', 'типа коллекция', 'https://scontent.xx.fbcdn.net/hphotos-xtp1/v/t1.0-0/s180x540/12003346_711421015630249_1739596090561163625_n.jpg?oh=fc485152b163eda7e1c8ff502b6bc9bf&oe=56992364', 19);

-- --------------------------------------------------------

--
-- Структура таблицы `likes`
--

CREATE TABLE IF NOT EXISTS `likes` (
  `id` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `user1_id` int(11) NOT NULL,
  `user2_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL,
  `text` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sender_id` int(11) NOT NULL,
  `recipient_id` int(11) NOT NULL
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `photos`
--

INSERT INTO `photos` (`id`, `picture_url`, `album_id`) VALUES
(9, 'https://scontent.xx.fbcdn.net/hphotos-xtp1/v/t1.0-9/q81/s720x720/12003346_711421015630249_1739596090561163625_n.jpg?oh=8ff61c29aeb5b6465f341a937eac9a30&oe=56D309E2', 17),
(10, 'https://scontent.xx.fbcdn.net/hphotos-xta1/v/t1.0-9/s720x720/12004110_711421415630209_1305689299921036111_n.jpg?oh=51d41c1ad46666f1e40d941e410cae15&oe=56D09BB4', 17);

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `salami_user`
--

INSERT INTO `salami_user` (`id`, `email`, `create_time`, `name`, `birthday`, `gender`, `facebook_id`, `profile_picture`, `collection_type`, `location`) VALUES
(19, 'zapriy.05@mail.ru', '2015-10-09 08:58:49', 'Roma  Za', '05/09/1983', 'male', '699292513509766', 'https://scontent.xx.fbcdn.net/hprofile-xpf1/v/t1.0-1/p320x320/11822756_695230833915934_8640396150136684128_n.jpg?oh=847feafbfd4a114eaff33b995891b9b6&oe=56853A25', 'beer caps', '49.694022,36.26572');

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
  MODIFY `album_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT для таблицы `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `salami_user`
--
ALTER TABLE `salami_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
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
ADD CONSTRAINT `fk_likes_salami_user1` FOREIGN KEY (`user1_id`) REFERENCES `salami_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_likes_salami_user2` FOREIGN KEY (`user2_id`) REFERENCES `salami_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `messages`
--
ALTER TABLE `messages`
ADD CONSTRAINT `fk_messages_salami_user` FOREIGN KEY (`sender_id`) REFERENCES `salami_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_messages_salami_user1` FOREIGN KEY (`recipient_id`) REFERENCES `salami_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `photos`
--
ALTER TABLE `photos`
ADD CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `album` (`album_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
