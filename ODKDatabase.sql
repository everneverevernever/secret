-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 20 2024 г., 07:16
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ODKDatabase`
--

-- --------------------------------------------------------

--
-- Структура таблицы `refAxp`
--

CREATE TABLE `refAxp` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `refAxpElements`
--

CREATE TABLE `refAxpElements` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `axp_id` int DEFAULT NULL,
  `unit_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  `decor_type_id` int DEFAULT NULL,
  `required` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `refAxpElements`
--

INSERT INTO `refAxpElements` (`id`, `name`, `axp_id`, `unit_id`, `quantity`, `type_id`, `decor_type_id`, `required`) VALUES
(1, 'Элемент ОДК 1', NULL, 1, 100, 1, 1, 1),
(2, 'Элемент ОДК 2', NULL, 2, 200, 2, 2, 1),
(3, 'Элемент ОДК 3', NULL, 3, 150, 1, 3, 0),
(4, 'Элемент ОДК 4', NULL, 1, 250, 3, 2, 1),
(5, 'Элемент ОДК 5', NULL, 2, 300, 2, 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `refContractors`
--

CREATE TABLE `refContractors` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `refContractors`
--

INSERT INTO `refContractors` (`id`, `name`) VALUES
(1, 'ООО \"Строитель\"'),
(2, 'АО \"Городстрой\"'),
(3, 'ЗАО \"Мегастрой\"'),
(4, 'ООО \"РемонтСервис\"'),
(5, 'ИП \"Петров И.И.\"');

-- --------------------------------------------------------

--
-- Структура таблицы `refEvents`
--

CREATE TABLE `refEvents` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `refEvents`
--

INSERT INTO `refEvents` (`id`, `name`, `start_date`, `end_date`) VALUES
(1, 'Строительство жилого комплекса', '2024-01-01', '2024-12-31'),
(2, 'Реконструкция дороги', '2024-03-01', '2024-10-31'),
(3, 'Ремонт школы', '2024-06-01', '2024-09-30'),
(4, 'Строительство торгового центра', '2024-04-01', '2024-11-30'),
(5, 'Реконструкция парка', '2024-05-01', '2024-08-31');

-- --------------------------------------------------------

--
-- Структура таблицы `refWarehouses`
--

CREATE TABLE `refWarehouses` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `hide` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `refWarehouseStock`
--

CREATE TABLE `refWarehouseStock` (
  `id` int NOT NULL,
  `warehouse_id` int DEFAULT NULL,
  `axp_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `axp_element_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `tblBoughtConstructionElements`
--

CREATE TABLE `tblBoughtConstructionElements` (
  `id` int NOT NULL,
  `create_date` date DEFAULT NULL,
  `axp_id` int DEFAULT NULL,
  `contractor_id` int DEFAULT NULL,
  `stock_Stock_id` int DEFAULT NULL,
  `contract_date` date DEFAULT NULL,
  `contract_number` varchar(255) DEFAULT NULL,
  `count_element` int DEFAULT NULL,
  `odk` varchar(255) DEFAULT NULL,
  `event_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `tblBoughtConstructionElements`
--

INSERT INTO `tblBoughtConstructionElements` (`id`, `create_date`, `axp_id`, `contractor_id`, `stock_Stock_id`, `contract_date`, `contract_number`, `count_element`, `odk`, `event_id`) VALUES
(1, '2000-01-01', NULL, 1, 1, '2000-01-01', '1231312', 1, 'Элемент ОДК 1', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `tblBoughtConstructionElementsElements`
--

CREATE TABLE `tblBoughtConstructionElementsElements` (
  `id` int NOT NULL,
  `create_date` date DEFAULT NULL,
  `odk` varchar(255) DEFAULT NULL,
  `axp_element_id` int DEFAULT NULL,
  `count_element` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `tblElementsExtraditeConstruction`
--

CREATE TABLE `tblElementsExtraditeConstruction` (
  `id` int NOT NULL,
  `count_element` int DEFAULT NULL,
  `element_id` int DEFAULT NULL,
  `ExtraditeConstruction_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `tblExtraditeConstructionElements`
--

CREATE TABLE `tblExtraditeConstructionElements` (
  `id` int NOT NULL,
  `create_date` date DEFAULT NULL,
  `axp_id` int DEFAULT NULL,
  `contractor_id` int DEFAULT NULL,
  `stock_Stock_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `tblInstallation`
--

CREATE TABLE `tblInstallation` (
  `id` int NOT NULL,
  `installation_id` int DEFAULT NULL,
  `odk` varchar(255) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `breaker_address` varchar(255) DEFAULT NULL,
  `supply_connected` tinyint(1) DEFAULT NULL,
  `allows_generator` tinyint(1) DEFAULT NULL,
  `supervisor` varchar(255) DEFAULT NULL,
  `contractor_supervisor` varchar(255) DEFAULT NULL,
  `opmode_planned` varchar(255) DEFAULT NULL,
  `opmode_factual` varchar(255) DEFAULT NULL,
  `odk_num` varchar(255) DEFAULT NULL,
  `completion_percentage` decimal(5,2) DEFAULT NULL,
  `completion_date_planned` date DEFAULT NULL,
  `completion_date_factual` date DEFAULT NULL,
  `installation_comments` text,
  `address_comments` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `refAxp`
--
ALTER TABLE `refAxp`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `refAxpElements`
--
ALTER TABLE `refAxpElements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `axp_id` (`axp_id`);

--
-- Индексы таблицы `refContractors`
--
ALTER TABLE `refContractors`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `refEvents`
--
ALTER TABLE `refEvents`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `refWarehouses`
--
ALTER TABLE `refWarehouses`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `refWarehouseStock`
--
ALTER TABLE `refWarehouseStock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_id` (`warehouse_id`),
  ADD KEY `axp_id` (`axp_id`),
  ADD KEY `axp_element_id` (`axp_element_id`);

--
-- Индексы таблицы `tblBoughtConstructionElements`
--
ALTER TABLE `tblBoughtConstructionElements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `axp_id` (`axp_id`),
  ADD KEY `contractor_id` (`contractor_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Индексы таблицы `tblBoughtConstructionElementsElements`
--
ALTER TABLE `tblBoughtConstructionElementsElements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `axp_element_id` (`axp_element_id`);

--
-- Индексы таблицы `tblElementsExtraditeConstruction`
--
ALTER TABLE `tblElementsExtraditeConstruction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ExtraditeConstruction_id` (`ExtraditeConstruction_id`);

--
-- Индексы таблицы `tblExtraditeConstructionElements`
--
ALTER TABLE `tblExtraditeConstructionElements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `axp_id` (`axp_id`),
  ADD KEY `contractor_id` (`contractor_id`);

--
-- Индексы таблицы `tblInstallation`
--
ALTER TABLE `tblInstallation`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `tblBoughtConstructionElements`
--
ALTER TABLE `tblBoughtConstructionElements`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `refAxpElements`
--
ALTER TABLE `refAxpElements`
  ADD CONSTRAINT `refaxpelements_ibfk_1` FOREIGN KEY (`axp_id`) REFERENCES `refAxp` (`id`);

--
-- Ограничения внешнего ключа таблицы `refWarehouseStock`
--
ALTER TABLE `refWarehouseStock`
  ADD CONSTRAINT `refwarehousestock_ibfk_1` FOREIGN KEY (`warehouse_id`) REFERENCES `refWarehouses` (`id`),
  ADD CONSTRAINT `refwarehousestock_ibfk_2` FOREIGN KEY (`axp_id`) REFERENCES `refAxp` (`id`),
  ADD CONSTRAINT `refwarehousestock_ibfk_3` FOREIGN KEY (`axp_element_id`) REFERENCES `refAxpElements` (`id`);

--
-- Ограничения внешнего ключа таблицы `tblBoughtConstructionElements`
--
ALTER TABLE `tblBoughtConstructionElements`
  ADD CONSTRAINT `tblboughtconstructionelements_ibfk_1` FOREIGN KEY (`axp_id`) REFERENCES `refAxp` (`id`),
  ADD CONSTRAINT `tblboughtconstructionelements_ibfk_2` FOREIGN KEY (`contractor_id`) REFERENCES `refContractors` (`id`),
  ADD CONSTRAINT `tblboughtconstructionelements_ibfk_3` FOREIGN KEY (`event_id`) REFERENCES `refEvents` (`id`);

--
-- Ограничения внешнего ключа таблицы `tblBoughtConstructionElementsElements`
--
ALTER TABLE `tblBoughtConstructionElementsElements`
  ADD CONSTRAINT `tblboughtconstructionelementselements_ibfk_1` FOREIGN KEY (`axp_element_id`) REFERENCES `refAxpElements` (`id`);

--
-- Ограничения внешнего ключа таблицы `tblElementsExtraditeConstruction`
--
ALTER TABLE `tblElementsExtraditeConstruction`
  ADD CONSTRAINT `tblelementsextraditeconstruction_ibfk_1` FOREIGN KEY (`ExtraditeConstruction_id`) REFERENCES `tblExtraditeConstructionElements` (`id`);

--
-- Ограничения внешнего ключа таблицы `tblExtraditeConstructionElements`
--
ALTER TABLE `tblExtraditeConstructionElements`
  ADD CONSTRAINT `tblextraditeconstructionelements_ibfk_1` FOREIGN KEY (`axp_id`) REFERENCES `refAxp` (`id`),
  ADD CONSTRAINT `tblextraditeconstructionelements_ibfk_2` FOREIGN KEY (`contractor_id`) REFERENCES `refContractors` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
