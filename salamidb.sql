-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Сен 27 2015 г., 23:21
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `album`
--

INSERT INTO `album` (`album_id`, `facebook_album_id`, `name`, `description`, `picture_url`, `user_id`) VALUES
(1, '123123123123123', '"Roman"', NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `code` char(2) NOT NULL,
  `name` char(52) NOT NULL,
  `population` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `country`
--

INSERT INTO `country` (`code`, `name`, `population`) VALUES
('AU', 'Australia', 18886000),
('BR', 'Brazil', 170115000),
('CA', 'Canada', 1147000),
('CN', 'China', 1277558000),
('DE', 'Germany', 82164700),
('FR', 'France', 59225700),
('GB', 'United Kingdom', 59623400),
('IN', 'India', 1013662000),
('RU', 'Russia', 146934000),
('US', 'United States', 278357000);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `salami_user`
--

CREATE TABLE IF NOT EXISTS `salami_user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `birthday` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `facebook_id` varchar(255) DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `salami_user`
--

INSERT INTO `salami_user` (`id`, `email`, `create_time`, `name`, `birthday`, `gender`, `facebook_id`, `profile_picture`, `location`) VALUES
(1, 'alexey@email.com', '2015-09-27', 'Alexey', NULL, NULL, '1232343453', NULL, NULL),
(2, '"hello@email.com"', NULL, '"Roman"', NULL, NULL, '"123123123123123"', NULL, NULL);

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
-- Индексы таблицы `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`code`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`), ADD KEY `album_id` (`album_id`);

--
-- Индексы таблицы `salami_user`
--
ALTER TABLE `salami_user`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `album_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `salami_user`
--
ALTER TABLE `salami_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
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
ADD CONSTRAINT `fk_album_user` FOREIGN KEY (`user_id`) REFERENCES `salami_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `photos`
--
ALTER TABLE `photos`
ADD CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `album` (`album_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
