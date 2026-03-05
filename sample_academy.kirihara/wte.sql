-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost
-- 生成日時: 2026 年 3 月 05 日 04:45
-- サーバのバージョン： 5.6.51
-- PHP のバージョン: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `wte`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `anns`
--

CREATE TABLE `anns` (
  `ann_id` int(10) UNSIGNED NOT NULL,
  `ann_target` tinyint(3) UNSIGNED NOT NULL,
  `ann_cdate` int(10) UNSIGNED NOT NULL,
  `ann_title` varchar(50) NOT NULL,
  `ann_content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `autos`
--

CREATE TABLE `autos` (
  `auto_id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `crd_id` bigint(20) UNSIGNED NOT NULL,
  `pln_id` varchar(50) NOT NULL,
  `auto_cdate` int(10) UNSIGNED NOT NULL,
  `auto_price` int(10) UNSIGNED NOT NULL,
  `auto_point` int(10) UNSIGNED NOT NULL,
  `auto_day` tinyint(3) UNSIGNED NOT NULL,
  `auto_last_ym` mediumint(8) UNSIGNED NOT NULL,
  `auto_status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `auto_count` smallint(5) UNSIGNED NOT NULL DEFAULT '1',
  `auto_sdate` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `auto_stop_reason` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `auto_mdate` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `auto_txn_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `buzzes`
--

CREATE TABLE `buzzes` (
  `buz_id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `prof_id` bigint(20) UNSIGNED NOT NULL,
  `buz_cdate` int(10) UNSIGNED NOT NULL,
  `buz_show` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `buz_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `cards`
--

CREATE TABLE `cards` (
  `crd_id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `mbract_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `pln_id` varchar(50) NOT NULL,
  `auto_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `crd_cdate` int(10) UNSIGNED NOT NULL,
  `crd_rdate` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `crd_price` int(10) UNSIGNED NOT NULL,
  `crd_point` int(10) UNSIGNED NOT NULL,
  `crd_subscription` tinyint(3) UNSIGNED NOT NULL,
  `crd_ref` tinyint(3) UNSIGNED NOT NULL,
  `crd_success` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `crd_txn_id` varchar(255) DEFAULT NULL,
  `crd_payer_id` varchar(13) DEFAULT NULL,
  `crd_receipt_id` varchar(20) DEFAULT NULL,
  `crd_ipn_message` text,
  `crd_nvp_message` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `ccates`
--

CREATE TABLE `ccates` (
  `ccate_id` int(10) UNSIGNED NOT NULL,
  `ccate_pid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ccate_layer` tinyint(3) UNSIGNED NOT NULL,
  `ccate_order` tinyint(3) UNSIGNED NOT NULL,
  `ccate_name` varchar(255) NOT NULL,
  `ccate_status` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `coupons`
--

CREATE TABLE `coupons` (
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED NOT NULL,
  `coupon_code` varchar(8) NOT NULL,
  `coupon_cdate` int(10) UNSIGNED NOT NULL,
  `coupon_expire` date NOT NULL DEFAULT '9999-12-31',
  `coupon_title` varchar(50) NOT NULL,
  `coupon_price` int(10) UNSIGNED NOT NULL,
  `coupon_max` int(10) UNSIGNED NOT NULL,
  `coupon_num` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `coupon_status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `coupon_note` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `courses`
--

CREATE TABLE `courses` (
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `prof_id` bigint(20) UNSIGNED NOT NULL,
  `course_cdate` int(10) UNSIGNED NOT NULL,
  `course_mdate` int(10) UNSIGNED NOT NULL,
  `course_status` tinyint(3) UNSIGNED NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `course_copy` varchar(255) DEFAULT NULL,
  `course_fee` int(10) UNSIGNED NOT NULL,
  `course_score` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `course_order_weight` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `course_reco` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `course_step` smallint(5) UNSIGNED NOT NULL,
  `course_ccate_id_1` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `course_ccate_id_2` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `course_logo` tinyint(3) UNSIGNED DEFAULT NULL,
  `course_youtube_id` varchar(255) DEFAULT NULL,
  `course_youtube_id2` varchar(255) DEFAULT NULL,
  `course_intro` text,
  `course_memo` text,
  `course_syllabus_member` varchar(255) DEFAULT NULL,
  `course_syllabus_prof` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `cpnacts`
--

CREATE TABLE `cpnacts` (
  `cpnact_id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED NOT NULL,
  `cpnact_type` tinyint(3) UNSIGNED NOT NULL,
  `cpnact_reason` tinyint(3) UNSIGNED NOT NULL,
  `cpnact_cdate` int(10) UNSIGNED NOT NULL,
  `cpnact_price` int(11) NOT NULL,
  `lsn_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `dcts`
--

CREATE TABLE `dcts` (
  `dct_id` int(10) UNSIGNED NOT NULL,
  `dct_title` varchar(255) NOT NULL,
  `dct_sort` int(10) UNSIGNED NOT NULL,
  `dct_status` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `dct_items` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `dmsgs`
--

CREATE TABLE `dmsgs` (
  `dmsg_id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `prof_id` bigint(20) UNSIGNED NOT NULL,
  `dmsg_cdate` int(10) UNSIGNED NOT NULL,
  `dmsg_direction` tinyint(3) UNSIGNED NOT NULL,
  `dmsg_content` text CHARACTER SET utf8mb4 NOT NULL,
  `dmsg_file` varchar(64) DEFAULT NULL,
  `dmsg_file_etime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dmsg_file_deleted` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `dwns`
--

CREATE TABLE `dwns` (
  `dwn_id` bigint(20) UNSIGNED NOT NULL,
  `dct_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dwn_title` varchar(100) NOT NULL,
  `dwn_type` tinyint(3) UNSIGNED NOT NULL,
  `dwn_loc` tinyint(3) UNSIGNED NOT NULL,
  `dwn_url` varchar(255) DEFAULT NULL,
  `dwn_point` int(10) UNSIGNED NOT NULL,
  `dwn_status` tinyint(3) UNSIGNED NOT NULL,
  `dwn_num` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dwn_pubdate` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dwn_score` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dwn_weight` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `dwn_period` int(10) UNSIGNED NOT NULL,
  `dwn_logo` tinyint(3) UNSIGNED NOT NULL,
  `dwn_duration` varchar(20) DEFAULT NULL,
  `dwn_fname` varchar(100) DEFAULT NULL,
  `dwn_intro` text,
  `dwn_note` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `dwnsels`
--

CREATE TABLE `dwnsels` (
  `dsl_id` bigint(20) UNSIGNED NOT NULL,
  `dwn_id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `dsl_expire` int(10) UNSIGNED NOT NULL,
  `dsl_cdate` int(10) UNSIGNED NOT NULL,
  `dsl_point` int(10) UNSIGNED NOT NULL,
  `dsl_type` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `favs`
--

CREATE TABLE `favs` (
  `fav_id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `prof_id` bigint(20) UNSIGNED NOT NULL,
  `fav_cdate` int(10) UNSIGNED NOT NULL,
  `fav_comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `fmls`
--

CREATE TABLE `fmls` (
  `fml_id` bigint(20) UNSIGNED NOT NULL,
  `fml_title` varchar(100) NOT NULL,
  `fml_base` tinyint(3) UNSIGNED NOT NULL,
  `fml_days` smallint(5) UNSIGNED NOT NULL,
  `fml_cond` tinyint(3) UNSIGNED NOT NULL,
  `fml_content` text,
  `fml_memo` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `lessons`
--

CREATE TABLE `lessons` (
  `lsn_id` bigint(20) UNSIGNED NOT NULL,
  `prof_id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `lsn_cdate` int(10) UNSIGNED NOT NULL,
  `lsn_stime` datetime NOT NULL,
  `lsn_etime` datetime NOT NULL,
  `lsn_cancel` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `lsn_cancel_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lsn_cancel_reason` text,
  `lsn_prof_repo` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `lsn_prof_repo_date` int(10) UNSIGNED NOT NULL,
  `lsn_prof_repo_note` text NOT NULL,
  `lsn_member_repo` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `lsn_member_repo_date` int(10) UNSIGNED NOT NULL,
  `lsn_member_repo_note` text NOT NULL,
  `lsn_member_repo_rating` tinyint(3) UNSIGNED DEFAULT NULL,
  `lsn_review` text,
  `lsn_review_show` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `lsn_status` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `lsn_status_date` int(10) UNSIGNED NOT NULL,
  `lsn_prof_fee` int(10) UNSIGNED NOT NULL,
  `lsn_pay_type` tinyint(3) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `lsn_pay_fee_rate` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lsn_base_price` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lsn_prof_margin` tinyint(3) UNSIGNED NOT NULL,
  `lsn_prof_price` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lsn_seller_margin` tinyint(3) UNSIGNED NOT NULL,
  `lsn_seller_price` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lsn_charged_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pdm_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `lsn_pdm_status` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `sdm_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `lsn_sdm_status` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `lsn_latest_msg_1` text,
  `lsn_latest_msg_2` text,
  `lsn_st_flag` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `lsn_prof_price_zei` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `logins`
--

CREATE TABLE `logins` (
  `lin_id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `lin_date` int(10) UNSIGNED NOT NULL,
  `lin_type` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `mbracts`
--

CREATE TABLE `mbracts` (
  `mbract_id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED NOT NULL,
  `mbract_type` tinyint(3) UNSIGNED NOT NULL,
  `mbract_reason` tinyint(3) UNSIGNED NOT NULL,
  `mbract_cdate` int(10) UNSIGNED NOT NULL,
  `mbract_price` int(11) NOT NULL,
  `crd_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `auto_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `lsn_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `dsl_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `members`
--

CREATE TABLE `members` (
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `member_cdate` int(10) UNSIGNED NOT NULL,
  `member_mdate` int(10) UNSIGNED NOT NULL,
  `member_status` tinyint(3) UNSIGNED NOT NULL,
  `member_email` varchar(255) NOT NULL,
  `member_pass` varchar(255) NOT NULL,
  `member_card` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `member_coupon` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `member_point` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `member_point_expire` date DEFAULT NULL,
  `member_lastname` varchar(100) DEFAULT NULL,
  `member_firstname` varchar(100) DEFAULT NULL,
  `member_handle` varchar(30) DEFAULT NULL,
  `member_skype_id` varchar(255) DEFAULT NULL,
  `member_gender` tinyint(3) UNSIGNED DEFAULT NULL,
  `member_company` varchar(100) DEFAULT NULL,
  `member_dept` varchar(100) DEFAULT NULL,
  `member_title` varchar(20) DEFAULT NULL,
  `member_zip1` varchar(3) DEFAULT NULL,
  `member_zip2` varchar(4) DEFAULT NULL,
  `member_addr1` varchar(5) DEFAULT NULL,
  `member_addr2` varchar(100) DEFAULT NULL,
  `member_addr3` varchar(100) DEFAULT NULL,
  `member_addr4` varchar(100) DEFAULT NULL,
  `member_tel1` varchar(5) DEFAULT NULL,
  `member_tel2` varchar(4) DEFAULT NULL,
  `member_tel3` varchar(4) DEFAULT NULL,
  `member_birthy` smallint(5) UNSIGNED DEFAULT NULL,
  `member_birthm` tinyint(3) UNSIGNED DEFAULT NULL,
  `member_birthd` tinyint(3) UNSIGNED DEFAULT NULL,
  `member_hp` varchar(255) DEFAULT NULL,
  `member_passphrase` varchar(8) DEFAULT NULL,
  `member_logo` tinyint(3) UNSIGNED DEFAULT NULL,
  `member_purpose` int(10) UNSIGNED DEFAULT NULL,
  `member_demand` int(10) UNSIGNED DEFAULT NULL,
  `member_interest` int(10) UNSIGNED DEFAULT NULL,
  `member_level` int(10) UNSIGNED DEFAULT NULL,
  `member_associate1` text,
  `member_associate2` text,
  `member_intro` text,
  `member_comment` text,
  `member_memo` text,
  `member_memo2` text,
  `member_note` text,
  `member_lang` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `member_coupon_expire` date DEFAULT NULL,
  `member_st_flag` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `member_course_flag` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `member_stripe_cus_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `msgs`
--

CREATE TABLE `msgs` (
  `msg_id` bigint(20) UNSIGNED NOT NULL,
  `lsn_id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `prof_id` bigint(20) UNSIGNED NOT NULL,
  `msg_cdate` int(10) UNSIGNED NOT NULL,
  `msg_direction` tinyint(3) UNSIGNED NOT NULL,
  `msg_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `mypgs`
--

CREATE TABLE `mypgs` (
  `mypg_id` tinyint(3) UNSIGNED NOT NULL,
  `mypg_title` varchar(100) DEFAULT NULL,
  `mypg_content` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `pdms`
--

CREATE TABLE `pdms` (
  `pdm_id` bigint(20) UNSIGNED NOT NULL,
  `prof_id` bigint(20) UNSIGNED NOT NULL,
  `pdm_cdate` int(10) UNSIGNED NOT NULL,
  `pdm_status` tinyint(3) UNSIGNED NOT NULL,
  `pdm_price` int(10) UNSIGNED NOT NULL,
  `pdm_price_zei` int(10) UNSIGNED NOT NULL,
  `pdm_price_gensen` int(10) UNSIGNED NOT NULL,
  `pdm_price_fix` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `plans`
--

CREATE TABLE `plans` (
  `pln_id` varchar(50) NOT NULL,
  `pln_title` varchar(100) NOT NULL,
  `pln_subscription` tinyint(3) UNSIGNED NOT NULL,
  `pln_price` int(10) UNSIGNED NOT NULL,
  `pln_point` int(10) UNSIGNED NOT NULL,
  `pln_status` tinyint(3) UNSIGNED NOT NULL,
  `pln_sort` int(10) UNSIGNED NOT NULL,
  `pln_no` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `preps`
--

CREATE TABLE `preps` (
  `prep_id` bigint(20) UNSIGNED NOT NULL,
  `prof_id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `lsn_id` bigint(20) UNSIGNED NOT NULL,
  `prep_cdate` int(10) UNSIGNED NOT NULL,
  `prep_status` tinyint(3) UNSIGNED NOT NULL,
  `prep_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `profs`
--

CREATE TABLE `profs` (
  `prof_id` bigint(20) UNSIGNED NOT NULL,
  `prof_cdate` int(10) UNSIGNED NOT NULL,
  `prof_mdate` int(10) UNSIGNED NOT NULL,
  `prof_status` tinyint(3) UNSIGNED NOT NULL,
  `prof_email` varchar(255) NOT NULL,
  `prof_pass` varchar(255) NOT NULL,
  `prof_fee` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `prof_score` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `prof_order_weight` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `prof_reco` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `prof_rank` tinyint(3) UNSIGNED NOT NULL,
  `prof_step` smallint(5) UNSIGNED NOT NULL DEFAULT '30',
  `prof_coupon_ok` tinyint(3) UNSIGNED NOT NULL,
  `prof_country` varchar(2) DEFAULT NULL,
  `prof_residence` varchar(2) DEFAULT NULL,
  `prof_lastname` varchar(100) DEFAULT NULL,
  `prof_firstname` varchar(100) DEFAULT NULL,
  `prof_handle` varchar(30) DEFAULT NULL,
  `prof_skype_id` varchar(32) DEFAULT NULL,
  `prof_gender` tinyint(3) UNSIGNED DEFAULT NULL,
  `prof_company` varchar(100) DEFAULT NULL,
  `prof_dept` varchar(100) DEFAULT NULL,
  `prof_title` varchar(20) DEFAULT NULL,
  `prof_zip1` varchar(15) DEFAULT NULL,
  `prof_zip2` varchar(15) DEFAULT NULL,
  `prof_addr1` varchar(100) DEFAULT NULL,
  `prof_addr2` varchar(200) DEFAULT NULL,
  `prof_addr3` varchar(200) DEFAULT NULL,
  `prof_addr4` varchar(200) DEFAULT NULL,
  `prof_tel1` varchar(5) DEFAULT NULL,
  `prof_tel2` varchar(4) DEFAULT NULL,
  `prof_tel3` varchar(4) DEFAULT NULL,
  `prof_birthy` smallint(5) UNSIGNED DEFAULT NULL,
  `prof_birthm` tinyint(3) UNSIGNED DEFAULT NULL,
  `prof_birthd` tinyint(3) UNSIGNED DEFAULT NULL,
  `prof_hp` varchar(255) DEFAULT NULL,
  `prof_audio_url` varchar(255) DEFAULT NULL,
  `prof_video_url` varchar(255) DEFAULT NULL,
  `prof_logo` tinyint(3) UNSIGNED DEFAULT NULL,
  `prof_associate1` text,
  `prof_associate2` text,
  `prof_character` int(10) UNSIGNED DEFAULT NULL,
  `prof_interest` int(10) UNSIGNED DEFAULT NULL,
  `prof_intro` text,
  `prof_intro2` text,
  `prof_memo` text,
  `prof_memo2` text,
  `prof_note` text,
  `prof_fulltext` text,
  `prof_app1` text,
  `prof_app2` text,
  `prof_app3` text,
  `prof_app4` text,
  `prof_override_margin` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `normal_point_fee_rate` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `normal_point_prof_margin` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `normal_point_seller_margin` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `cancel1_point_fee_rate` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `cancel1_point_prof_margin` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `cancel1_point_seller_margin` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `cancel2_point_fee_rate` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `cancel2_point_prof_margin` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `cancel2_point_seller_margin` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `cancel3_point_fee_rate` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `cancel3_point_prof_margin` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `cancel3_point_seller_margin` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `normal_coupon_fee_rate` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `normal_coupon_prof_margin` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `normal_coupon_seller_margin` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `cancel1_coupon_fee_rate` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `cancel1_coupon_prof_margin` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `cancel1_coupon_seller_margin` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `cancel2_coupon_fee_rate` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `cancel2_coupon_prof_margin` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `cancel2_coupon_seller_margin` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `cancel3_coupon_fee_rate` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `cancel3_coupon_prof_margin` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `cancel3_coupon_seller_margin` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `prof_bank_code` varchar(4) DEFAULT NULL,
  `prof_bank_name` varchar(20) DEFAULT NULL,
  `prof_bank_branch_code` varchar(3) DEFAULT NULL,
  `prof_bank_branch_name` varchar(20) DEFAULT NULL,
  `prof_bank_account_type` varchar(1) DEFAULT NULL,
  `prof_bank_account_number` varchar(8) DEFAULT NULL,
  `prof_bank_account_name` varchar(48) DEFAULT NULL,
  `prof_deduction` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `prof_invoice_registration` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `schedules`
--

CREATE TABLE `schedules` (
  `sch_id` bigint(20) UNSIGNED NOT NULL,
  `prof_id` bigint(20) UNSIGNED NOT NULL,
  `lsn_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `sch_cdate` int(10) UNSIGNED NOT NULL,
  `sch_stime` datetime NOT NULL,
  `sch_etime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `sdms`
--

CREATE TABLE `sdms` (
  `sdm_id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED NOT NULL,
  `sdm_cdate` int(10) UNSIGNED NOT NULL,
  `sdm_status` tinyint(3) UNSIGNED NOT NULL,
  `sdm_price` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `sellers`
--

CREATE TABLE `sellers` (
  `seller_id` bigint(20) UNSIGNED NOT NULL,
  `seller_cdate` int(10) UNSIGNED NOT NULL,
  `seller_mdate` int(10) UNSIGNED NOT NULL,
  `seller_status` tinyint(3) UNSIGNED NOT NULL,
  `seller_email` varchar(255) NOT NULL,
  `seller_pass` varchar(255) NOT NULL,
  `seller_name` varchar(30) NOT NULL,
  `seller_code` varchar(20) NOT NULL,
  `seller_margin_ratio` tinyint(3) UNSIGNED NOT NULL,
  `seller_company` varchar(255) NOT NULL,
  `seller_dept` varchar(255) DEFAULT NULL,
  `seller_title` varchar(20) DEFAULT NULL,
  `seller_lastname` varchar(100) DEFAULT NULL,
  `seller_firstname` varchar(100) DEFAULT NULL,
  `seller_zip1` varchar(3) DEFAULT NULL,
  `seller_zip2` varchar(4) DEFAULT NULL,
  `seller_addr1` varchar(5) DEFAULT NULL,
  `seller_addr2` varchar(20) DEFAULT NULL,
  `seller_addr3` varchar(50) DEFAULT NULL,
  `seller_addr4` varchar(50) DEFAULT NULL,
  `seller_tel1` varchar(5) DEFAULT NULL,
  `seller_tel2` varchar(4) DEFAULT NULL,
  `seller_tel3` varchar(4) DEFAULT NULL,
  `seller_url` varchar(255) DEFAULT NULL,
  `seller_memo` text,
  `seller_memo2` text,
  `seller_note` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `sysconf`
--

CREATE TABLE `sysconf` (
  `name` varchar(32) NOT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `tmpls`
--

CREATE TABLE `tmpls` (
  `tmpl_id` varchar(20) NOT NULL,
  `tmpl_content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `anns`
--
ALTER TABLE `anns`
  ADD PRIMARY KEY (`ann_id`);

--
-- テーブルのインデックス `autos`
--
ALTER TABLE `autos`
  ADD PRIMARY KEY (`auto_id`),
  ADD KEY `autos_member_id_idx` (`member_id`),
  ADD KEY `autos_crd_id_idx` (`crd_id`),
  ADD KEY `autos_pln_id_idx` (`pln_id`),
  ADD KEY `autos_last_ym_idx` (`auto_last_ym`);

--
-- テーブルのインデックス `buzzes`
--
ALTER TABLE `buzzes`
  ADD PRIMARY KEY (`buz_id`),
  ADD KEY `buzzes_member_id_idx` (`member_id`),
  ADD KEY `buzzes_prof_id_idx` (`prof_id`);

--
-- テーブルのインデックス `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`crd_id`),
  ADD KEY `cards_member_id_idx` (`member_id`),
  ADD KEY `cards_mbract_id_idx` (`mbract_id`),
  ADD KEY `cards_pln_id_idx` (`pln_id`),
  ADD KEY `cards_auto_id_idx` (`auto_id`),
  ADD KEY `cards_crd_txn_id_idx` (`crd_txn_id`),
  ADD KEY `cards_crd_payer_id_idx` (`crd_payer_id`),
  ADD KEY `cards_crd_receipt_id_idx` (`crd_receipt_id`);

--
-- テーブルのインデックス `ccates`
--
ALTER TABLE `ccates`
  ADD PRIMARY KEY (`ccate_id`);

--
-- テーブルのインデックス `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`coupon_id`),
  ADD UNIQUE KEY `coupons_coupon_code_idx` (`coupon_code`),
  ADD KEY `coupons_seller_id_idx` (`seller_id`),
  ADD KEY `coupons_coupon_expire_idx` (`coupon_expire`);

--
-- テーブルのインデックス `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `courses_prof_id_idx` (`prof_id`),
  ADD KEY `courses_course_score_idx` (`course_score`),
  ADD KEY `courses_course_order_weight_idx` (`course_order_weight`),
  ADD KEY `courses_course_ccate_id_1_idx` (`course_ccate_id_1`),
  ADD KEY `courses_course_ccate_id_2_idx` (`course_ccate_id_2`);

--
-- テーブルのインデックス `cpnacts`
--
ALTER TABLE `cpnacts`
  ADD PRIMARY KEY (`cpnact_id`),
  ADD KEY `cpnacts_coupon_id_idx` (`coupon_id`),
  ADD KEY `cpnacts_member_id_idx` (`member_id`),
  ADD KEY `cpnacts_seller_id_idx` (`seller_id`);

--
-- テーブルのインデックス `dcts`
--
ALTER TABLE `dcts`
  ADD PRIMARY KEY (`dct_id`),
  ADD KEY `dcts_dct_sort_idx` (`dct_sort`);

--
-- テーブルのインデックス `dmsgs`
--
ALTER TABLE `dmsgs`
  ADD PRIMARY KEY (`dmsg_id`),
  ADD KEY `dmsgs_member_id_idx` (`member_id`),
  ADD KEY `dmsgs_prof_id_idx` (`prof_id`);

--
-- テーブルのインデックス `dwns`
--
ALTER TABLE `dwns`
  ADD PRIMARY KEY (`dwn_id`),
  ADD KEY `dwns_dct_id_idx` (`dct_id`),
  ADD KEY `dwns_dwn_pubdate_idx` (`dwn_pubdate`),
  ADD KEY `dwns_dwn_score_idx` (`dwn_score`),
  ADD KEY `dwns_dwn_weight_idx` (`dwn_weight`);

--
-- テーブルのインデックス `dwnsels`
--
ALTER TABLE `dwnsels`
  ADD PRIMARY KEY (`dsl_id`),
  ADD KEY `dwnsels_dwn_id_idx` (`dwn_id`),
  ADD KEY `dwnsels_member_id_idx` (`member_id`),
  ADD KEY `dwnsels_dsl_expire_idx` (`dsl_expire`);

--
-- テーブルのインデックス `favs`
--
ALTER TABLE `favs`
  ADD PRIMARY KEY (`fav_id`),
  ADD KEY `favs_member_prof_id_idx` (`member_id`,`prof_id`),
  ADD KEY `favs_prof_id_idx` (`prof_id`);

--
-- テーブルのインデックス `fmls`
--
ALTER TABLE `fmls`
  ADD PRIMARY KEY (`fml_id`);

--
-- テーブルのインデックス `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`lsn_id`),
  ADD UNIQUE KEY `lessons_prof_id_idx` (`prof_id`,`lsn_stime`,`lsn_cancel_date`),
  ADD UNIQUE KEY `lessons_member_id_idx` (`member_id`,`lsn_stime`,`lsn_cancel_date`),
  ADD KEY `lessons_seller_id_idx` (`seller_id`),
  ADD KEY `lessons_course_id_idx` (`course_id`),
  ADD KEY `lessons_lsn_stime_idx` (`lsn_stime`),
  ADD KEY `lessons_lsn_etime_idx` (`lsn_etime`),
  ADD KEY `lessons_lsn_member_repo_date_idx` (`lsn_member_repo_date`),
  ADD KEY `lessons_lsn_status_date_idx` (`lsn_status_date`),
  ADD KEY `lessons_pdm_id_idx` (`pdm_id`),
  ADD KEY `lessons_sdm_id_idx` (`sdm_id`);

--
-- テーブルのインデックス `logins`
--
ALTER TABLE `logins`
  ADD PRIMARY KEY (`lin_id`),
  ADD KEY `logins_member_id_idx` (`member_id`);

--
-- テーブルのインデックス `mbracts`
--
ALTER TABLE `mbracts`
  ADD PRIMARY KEY (`mbract_id`),
  ADD KEY `mbracts_member_id_idx` (`member_id`),
  ADD KEY `mbracts_seller_id_idx` (`seller_id`),
  ADD KEY `mbracts_mbract_cdate_idx` (`mbract_cdate`);

--
-- テーブルのインデックス `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`member_id`),
  ADD UNIQUE KEY `members_member_email_idx` (`member_email`),
  ADD KEY `members_seller_id_idx` (`seller_id`),
  ADD KEY `members_coupon_id_idx` (`coupon_id`),
  ADD KEY `members_member_point_expire_idx` (`member_point_expire`),
  ADD KEY `members_member_handle_idx` (`member_handle`),
  ADD KEY `members_member_coupon_expire_idx` (`member_coupon_expire`) USING BTREE;

--
-- テーブルのインデックス `msgs`
--
ALTER TABLE `msgs`
  ADD PRIMARY KEY (`msg_id`),
  ADD KEY `msgs_lsn_id_idx` (`lsn_id`),
  ADD KEY `msgs_member_id_idx` (`member_id`),
  ADD KEY `msgs_prof_id_idx` (`prof_id`);

--
-- テーブルのインデックス `mypgs`
--
ALTER TABLE `mypgs`
  ADD PRIMARY KEY (`mypg_id`);

--
-- テーブルのインデックス `pdms`
--
ALTER TABLE `pdms`
  ADD PRIMARY KEY (`pdm_id`),
  ADD KEY `pdms_prof_id_idx` (`prof_id`);

--
-- テーブルのインデックス `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`pln_id`);

--
-- テーブルのインデックス `preps`
--
ALTER TABLE `preps`
  ADD PRIMARY KEY (`prep_id`),
  ADD KEY `preps_prof_id_idx` (`prof_id`),
  ADD KEY `preps_member_id_idx` (`member_id`),
  ADD KEY `preps_lsn_id_idx` (`lsn_id`);

--
-- テーブルのインデックス `profs`
--
ALTER TABLE `profs`
  ADD PRIMARY KEY (`prof_id`),
  ADD UNIQUE KEY `profs_prof_email_idx` (`prof_email`),
  ADD KEY `profs_prof_fee_idx` (`prof_fee`),
  ADD KEY `profs_prof_score_idx` (`prof_score`),
  ADD KEY `profs_prof_order_weight_idx` (`prof_order_weight`),
  ADD KEY `profs_prof_handle_idx` (`prof_handle`);

--
-- テーブルのインデックス `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`sch_id`),
  ADD UNIQUE KEY `schedules_prof_id_sch_stime_idx` (`prof_id`,`sch_stime`),
  ADD KEY `schedules_lsn_id_idx` (`lsn_id`),
  ADD KEY `schedules_sch_stime_idx` (`sch_stime`),
  ADD KEY `schedules_sch_etime_idx` (`sch_etime`);

--
-- テーブルのインデックス `sdms`
--
ALTER TABLE `sdms`
  ADD PRIMARY KEY (`sdm_id`),
  ADD KEY `sdms_seller_id_idx` (`seller_id`);

--
-- テーブルのインデックス `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`seller_id`),
  ADD UNIQUE KEY `sellers_seller_email_idx` (`seller_email`),
  ADD UNIQUE KEY `sellers_seller_name_idx` (`seller_name`),
  ADD UNIQUE KEY `sellers_seller_code_idx` (`seller_code`);

--
-- テーブルのインデックス `sysconf`
--
ALTER TABLE `sysconf`
  ADD PRIMARY KEY (`name`);

--
-- テーブルのインデックス `tmpls`
--
ALTER TABLE `tmpls`
  ADD PRIMARY KEY (`tmpl_id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `anns`
--
ALTER TABLE `anns`
  MODIFY `ann_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `autos`
--
ALTER TABLE `autos`
  MODIFY `auto_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `buzzes`
--
ALTER TABLE `buzzes`
  MODIFY `buz_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `cards`
--
ALTER TABLE `cards`
  MODIFY `crd_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `ccates`
--
ALTER TABLE `ccates`
  MODIFY `ccate_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `coupons`
--
ALTER TABLE `coupons`
  MODIFY `coupon_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `cpnacts`
--
ALTER TABLE `cpnacts`
  MODIFY `cpnact_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `dcts`
--
ALTER TABLE `dcts`
  MODIFY `dct_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `dmsgs`
--
ALTER TABLE `dmsgs`
  MODIFY `dmsg_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `dwns`
--
ALTER TABLE `dwns`
  MODIFY `dwn_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `dwnsels`
--
ALTER TABLE `dwnsels`
  MODIFY `dsl_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `favs`
--
ALTER TABLE `favs`
  MODIFY `fav_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `fmls`
--
ALTER TABLE `fmls`
  MODIFY `fml_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `lessons`
--
ALTER TABLE `lessons`
  MODIFY `lsn_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `logins`
--
ALTER TABLE `logins`
  MODIFY `lin_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `mbracts`
--
ALTER TABLE `mbracts`
  MODIFY `mbract_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `members`
--
ALTER TABLE `members`
  MODIFY `member_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `msgs`
--
ALTER TABLE `msgs`
  MODIFY `msg_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `pdms`
--
ALTER TABLE `pdms`
  MODIFY `pdm_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `preps`
--
ALTER TABLE `preps`
  MODIFY `prep_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `profs`
--
ALTER TABLE `profs`
  MODIFY `prof_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `schedules`
--
ALTER TABLE `schedules`
  MODIFY `sch_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `sdms`
--
ALTER TABLE `sdms`
  MODIFY `sdm_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `sellers`
--
ALTER TABLE `sellers`
  MODIFY `seller_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
