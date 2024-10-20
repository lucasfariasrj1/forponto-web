-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20-Out-2024 às 02:30
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `biolink`
--
CREATE DATABASE IF NOT EXISTS `biolink` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `biolink`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `biolinks_blocks`
--

CREATE TABLE `biolinks_blocks` (
  `biolink_block_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `link_id` int(11) DEFAULT NULL,
  `type` varchar(32) NOT NULL DEFAULT '',
  `location_url` varchar(512) DEFAULT NULL,
  `clicks` int(11) NOT NULL DEFAULT 0,
  `settings` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `is_enabled` tinyint(4) NOT NULL DEFAULT 1,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `biolinks_blocks`
--

INSERT INTO `biolinks_blocks` (`biolink_block_id`, `user_id`, `link_id`, `type`, `location_url`, `clicks`, `settings`, `order`, `start_date`, `end_date`, `is_enabled`, `datetime`) VALUES
(1, 1, 1, 'heading', NULL, 0, '{\"heading_type\":\"h1\",\"text\":\"Example page\",\"text_color\":\"white\"}', 0, NULL, NULL, 1, '2021-12-20 18:05:52'),
(2, 1, 1, 'paragraph', NULL, 0, '{\"text\":\"This is an example description.\",\"text_color\":\"white\"}', 1, NULL, NULL, 1, '2021-12-20 18:06:09');

-- --------------------------------------------------------

--
-- Estrutura da tabela `biolinks_templates`
--

CREATE TABLE `biolinks_templates` (
  `biolink_template_id` bigint(20) UNSIGNED NOT NULL,
  `link_id` int(11) DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `url` varchar(512) DEFAULT NULL,
  `image` varchar(40) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `is_enabled` tinyint(4) NOT NULL DEFAULT 1,
  `total_usage` bigint(20) UNSIGNED DEFAULT 0,
  `order` int(11) DEFAULT 0,
  `last_datetime` datetime DEFAULT NULL,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `biolinks_themes`
--

CREATE TABLE `biolinks_themes` (
  `biolink_theme_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `image` varchar(40) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `is_enabled` tinyint(4) NOT NULL DEFAULT 1,
  `order` int(11) DEFAULT 0,
  `last_datetime` datetime DEFAULT NULL,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `blog_posts`
--

CREATE TABLE `blog_posts` (
  `blog_post_id` bigint(20) UNSIGNED NOT NULL,
  `blog_posts_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `url` varchar(256) NOT NULL,
  `title` varchar(256) NOT NULL DEFAULT '',
  `description` varchar(256) DEFAULT NULL,
  `keywords` varchar(256) DEFAULT NULL,
  `image` varchar(40) DEFAULT NULL,
  `editor` varchar(16) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `language` varchar(32) DEFAULT NULL,
  `total_views` bigint(20) UNSIGNED DEFAULT 0,
  `is_published` tinyint(4) DEFAULT 1,
  `datetime` datetime DEFAULT NULL,
  `last_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `blog_posts_categories`
--

CREATE TABLE `blog_posts_categories` (
  `blog_posts_category_id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(256) NOT NULL,
  `title` varchar(256) NOT NULL DEFAULT '',
  `description` varchar(256) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `language` varchar(32) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `last_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `broadcasts`
--

CREATE TABLE `broadcasts` (
  `broadcast_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `subject` varchar(128) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `segment` varchar(64) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `users_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sent_users_ids` longtext DEFAULT NULL,
  `sent_emails` int(10) UNSIGNED DEFAULT 0,
  `total_emails` int(10) UNSIGNED DEFAULT 0,
  `status` varchar(16) DEFAULT NULL,
  `views` bigint(20) UNSIGNED DEFAULT 0,
  `clicks` bigint(20) UNSIGNED DEFAULT 0,
  `last_sent_email_datetime` datetime DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `last_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `broadcasts_statistics`
--

CREATE TABLE `broadcasts_statistics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `broadcast_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL,
  `target` varchar(2048) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `codes`
--

CREATE TABLE `codes` (
  `code_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `code` varchar(32) NOT NULL DEFAULT '',
  `discount` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `redeemed` int(11) NOT NULL DEFAULT 0,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `data`
--

CREATE TABLE `data` (
  `datum_id` bigint(20) UNSIGNED NOT NULL,
  `biolink_block_id` int(11) DEFAULT NULL,
  `link_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(32) DEFAULT NULL,
  `data` text DEFAULT NULL,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `domains`
--

CREATE TABLE `domains` (
  `domain_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `scheme` varchar(8) NOT NULL DEFAULT '',
  `host` varchar(128) NOT NULL DEFAULT '',
  `custom_index_url` varchar(256) DEFAULT NULL,
  `custom_not_found_url` varchar(256) DEFAULT NULL,
  `type` tinyint(11) DEFAULT 1,
  `is_enabled` tinyint(4) DEFAULT 0,
  `datetime` datetime DEFAULT NULL,
  `last_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `internal_notifications`
--

CREATE TABLE `internal_notifications` (
  `internal_notification_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `for_who` varchar(16) DEFAULT NULL,
  `from_who` varchar(16) DEFAULT NULL,
  `icon` varchar(64) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `url` varchar(512) DEFAULT NULL,
  `is_read` tinyint(3) UNSIGNED DEFAULT 0,
  `datetime` datetime DEFAULT NULL,
  `read_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `links`
--

CREATE TABLE `links` (
  `link_id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `splash_page_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `biolink_theme_id` int(11) DEFAULT NULL,
  `domain_id` int(11) DEFAULT 0,
  `pixels_ids` text DEFAULT NULL,
  `type` varchar(32) NOT NULL DEFAULT '',
  `subtype` varchar(32) DEFAULT NULL,
  `url` varchar(256) NOT NULL DEFAULT '',
  `location_url` varchar(2048) DEFAULT NULL,
  `clicks` int(11) NOT NULL DEFAULT 0,
  `settings` text DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `is_verified` tinyint(4) DEFAULT 0,
  `is_enabled` tinyint(4) NOT NULL DEFAULT 1,
  `last_datetime` datetime DEFAULT NULL,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `links`
--

INSERT INTO `links` (`link_id`, `project_id`, `splash_page_id`, `user_id`, `biolink_theme_id`, `domain_id`, `pixels_ids`, `type`, `subtype`, `url`, `location_url`, `clicks`, `settings`, `start_date`, `end_date`, `is_verified`, `is_enabled`, `last_datetime`, `datetime`) VALUES
(1, NULL, NULL, 1, NULL, 0, '[]', 'biolink', NULL, 'example', NULL, 0, '{\"verified_location\":\"top\",\"background_type\":\"preset\",\"background\":\"six\",\"favicon\":null,\"text_color\":\"#fff\",\"display_branding\":true,\"branding\":{\"name\":\"\",\"url\":\"\"},\"seo\":{\"block\":false,\"title\":\"\",\"meta_description\":\"\",\"image\":\"\"},\"utm\":{\"medium\":\"\",\"source\":\"\"},\"font\":\"arial\",\"font_size\":16,\"password\":null,\"sensitive_content\":false,\"leap_link\":\"\"}', NULL, NULL, 1, 1, NULL, '2021-12-20 18:05:36');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pages`
--

CREATE TABLE `pages` (
  `page_id` bigint(20) UNSIGNED NOT NULL,
  `pages_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `url` varchar(256) NOT NULL,
  `title` varchar(256) NOT NULL DEFAULT '',
  `description` varchar(256) DEFAULT NULL,
  `icon` varchar(32) DEFAULT NULL,
  `keywords` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `editor` varchar(16) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `type` varchar(16) DEFAULT '',
  `position` varchar(16) NOT NULL DEFAULT '',
  `language` varchar(32) DEFAULT NULL,
  `open_in_new_tab` tinyint(4) DEFAULT 1,
  `order` int(11) DEFAULT 0,
  `total_views` bigint(20) UNSIGNED DEFAULT 0,
  `is_published` tinyint(4) DEFAULT 1,
  `datetime` datetime DEFAULT NULL,
  `last_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `pages`
--

INSERT INTO `pages` (`page_id`, `pages_category_id`, `url`, `title`, `description`, `icon`, `keywords`, `editor`, `content`, `type`, `position`, `language`, `open_in_new_tab`, `order`, `total_views`, `is_published`, `datetime`, `last_datetime`) VALUES
(1, NULL, 'https://altumcode.com/', 'Software by AltumCode', '', NULL, NULL, NULL, '', 'external', 'bottom', NULL, 1, 1, 0, 1, '2024-10-18 12:55:37', '2024-10-18 12:55:37'),
(2, NULL, 'https://altumco.de/66biolinks', 'Built with 66biolinks', '', NULL, NULL, NULL, '', 'external', 'bottom', NULL, 1, 0, 0, 1, '2024-10-18 12:55:37', '2024-10-18 12:55:37');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pages_categories`
--

CREATE TABLE `pages_categories` (
  `pages_category_id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(256) NOT NULL,
  `title` varchar(256) NOT NULL DEFAULT '',
  `description` varchar(256) DEFAULT NULL,
  `icon` varchar(32) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `language` varchar(32) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `last_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `plan_id` int(10) UNSIGNED DEFAULT NULL,
  `processor` varchar(16) DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL,
  `frequency` varchar(16) DEFAULT NULL,
  `payment_id` varchar(128) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `plan` text DEFAULT NULL,
  `billing` text DEFAULT NULL,
  `business` text DEFAULT NULL,
  `taxes_ids` text DEFAULT NULL,
  `base_amount` float DEFAULT NULL,
  `total_amount` float DEFAULT NULL,
  `total_amount_default_currency` decimal(10,2) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `discount_amount` float DEFAULT NULL,
  `currency` varchar(4) DEFAULT NULL,
  `payment_proof` varchar(40) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  `datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pixels`
--

CREATE TABLE `pixels` (
  `pixel_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `pixel` varchar(64) NOT NULL,
  `last_datetime` datetime DEFAULT NULL,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `plans`
--

CREATE TABLE `plans` (
  `plan_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `description` varchar(256) NOT NULL DEFAULT '',
  `translations` text NOT NULL,
  `prices` text NOT NULL,
  `trial_days` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `settings` longtext NOT NULL,
  `taxes_ids` text DEFAULT NULL,
  `color` varchar(16) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `order` int(10) UNSIGNED DEFAULT 0,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `projects`
--

CREATE TABLE `projects` (
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `color` varchar(16) DEFAULT '#000',
  `last_datetime` datetime DEFAULT NULL,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `qr_codes`
--

CREATE TABLE `qr_codes` (
  `qr_code_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `link_id` int(11) DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `type` varchar(32) DEFAULT NULL,
  `qr_code_logo` varchar(64) DEFAULT NULL,
  `qr_code_background` varchar(40) DEFAULT NULL,
  `qr_code_foreground` varchar(40) DEFAULT NULL,
  `qr_code` varchar(64) NOT NULL,
  `settings` text DEFAULT NULL,
  `embedded_data` text DEFAULT NULL,
  `datetime` datetime NOT NULL,
  `last_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `redeemed_codes`
--

CREATE TABLE `redeemed_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code_id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL DEFAULT '',
  `value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`) VALUES
(1, 'main', '{\"title\":\"Your title\",\"default_language\":\"english\",\"default_theme_style\":\"light\",\"default_timezone\":\"UTC\",\"index_url\":\"\",\"terms_and_conditions_url\":\"\",\"privacy_policy_url\":\"\",\"not_found_url\":\"\",\"se_indexing\":true,\"ai_scraping_is_allowed\":true,\"display_index_plans\":true,\"display_index_testimonials\":true,\"display_index_faq\":true,\"default_results_per_page\":100,\"default_order_type\":\"DESC\",\"auto_language_detection_is_enabled\":true,\"blog_is_enabled\":false,\"api_is_enabled\":true,\"theme_style_change_is_enabled\":true,\"logo_light\":\"\",\"logo_dark\":\"\",\"logo_email\":\"\",\"opengraph\":\"\",\"favicon\":\"\",\"openai_api_key\":\"\",\"openai_model\":\"gpt-3.5-turbo\",\"force_https_is_enabled\":false,\"broadcasts_statistics_is_enabled\":false,\"breadcrumbs_is_enabled\":true,\"display_pagination_when_no_pages\":true}'),
(2, 'languages', '{\"english\":{\"status\":\"active\"}}'),
(3, 'users', '{\"login_rememberme_checkbox_is_checked\": false,\"email_confirmation\":false,\"welcome_email_is_enabled\":false,\"register_is_enabled\":true,\"register_only_social_logins\":false,\"register_display_newsletter_checkbox\":false,\"auto_delete_unconfirmed_users\":30,\"auto_delete_inactive_users\":90,\"user_deletion_reminder\":0,\"blacklisted_domains\":\"\",\"blacklisted_countries\":[],\"login_lockout_is_enabled\":true,\"login_lockout_max_retries\":3,\"login_lockout_time\":60,\"lost_password_lockout_is_enabled\":true,\"lost_password_lockout_max_retries\":3,\"lost_password_lockout_time\":60,\"resend_activation_lockout_is_enabled\":true,\"resend_activation_lockout_max_retries\":3,\"resend_activation_lockout_time\":60,\"register_lockout_is_enabled\":true,\"register_lockout_max_registrations\":3,\"register_lockout_time\":10}'),
(4, 'ads', '{\"ad_blocker_detector_is_enabled\":true,\"ad_blocker_detector_lock_is_enabled\":false,\"ad_blocker_detector_delay\":5,\"header\":\"\",\"footer\":\"\",\"header_biolink\":\"\",\"footer_biolink\":\"\",\"header_splash\":\"\",\"footer_splash\":\"\"}'),
(5, 'captcha', '{\"type\":\"basic\",\"recaptcha_public_key\":\"\",\"recaptcha_private_key\":\"\",\"login_is_enabled\":0,\"register_is_enabled\":0,\"lost_password_is_enabled\":0,\"resend_activation_is_enabled\":0}'),
(6, 'cron', '{\"key\":\"ef8ee4271b4cb181219d15c657a79ecb\"}'),
(7, 'email_notifications', '{\"emails\":\"\",\"new_user\":false,\"delete_user\":false,\"new_payment\":false,\"new_domain\":false,\"new_affiliate_withdrawal\":false,\"contact\":false}'),
(8, 'internal_notifications', '{\"users_is_enabled\":true,\"admins_is_enabled\":true,\"new_user\":true,\"delete_user\":true,\"new_newsletter_subscriber\":true,\"new_payment\":true,\"new_affiliate_withdrawal\":true}'),
(9, 'content', '{\"blog_is_enabled\":true,\"blog_share_is_enabled\":true,\"blog_categories_widget_is_enabled\":true,\"blog_popular_widget_is_enabled\":true,\"blog_views_is_enabled\":true,\"pages_is_enabled\":true,\"pages_share_is_enabled\":true,\"pages_popular_widget_is_enabled\":true,\"pages_views_is_enabled\":true}'),
(10, 'sso', '{\"is_enabled\":true,\"display_menu_items\":true,\"websites\":{}}'),
(11, 'facebook', '{\"is_enabled\":false,\"app_id\":\"\",\"app_secret\":\"\"}'),
(12, 'google', '{\"is_enabled\":false,\"client_id\":\"\",\"client_secret\":\"\"}'),
(13, 'twitter', '{\"is_enabled\":false,\"consumer_api_key\":\"\",\"consumer_api_secret\":\"\"}'),
(14, 'discord', '{\"is_enabled\":false,\"client_id\":\"\",\"client_secret\":\"\"}'),
(15, 'linkedin', '{\"is_enabled\":false,\"client_id\":\"\",\"client_secret\":\"\"}'),
(16, 'microsoft', '{\"is_enabled\":false,\"client_id\":\"\",\"client_secret\":\"\"}'),
(17, 'plan_custom', '{\"plan_id\":\"custom\",\"name\":\"Custom\",\"description\":\"Contact us for enterprise pricing.\",\"price\":\"Custom\",\"custom_button_url\":\"mailto:sample@example.com\",\"color\":null,\"status\":2,\"settings\":{}}'),
(18, 'plan_free', '{\"plan_id\":\"free\",\"name\":\"Free\",\"days\":null,\"status\":1,\"settings\":{\"additional_global_domains\":true,\"custom_url\":true,\"deep_links\":true,\"no_ads\":true,\"removable_branding\":true,\"custom_branding\":true,\"custom_colored_links\":true,\"statistics\":true,\"custom_backgrounds\":true,\"verified\":true,\"temporary_url_is_enabled\":true,\"seo\":true,\"utm\":true,\"socials\":true,\"fonts\":true,\"password\":true,\"sensitive_content\":true,\"leap_link\":true,\"api_is_enabled\":true,\"affiliate_is_enabled\":true,\"projects_limit\":10,\"pixels_limit\":10,\"biolinks_limit\":15,\"links_limit\":25,\"domains_limit\":1,\"enabled_biolink_blocks\":{\"link\":true,\"text\":true,\"image\":true,\"mail\":true,\"soundcloud\":true,\"spotify\":true,\"youtube\":true,\"twitch\":true,\"vimeo\":true,\"tiktok\":true,\"applemusic\":true,\"tidal\":true,\"anchor\":true,\"twitter_tweet\":true,\"instagram_media\":true,\"rss_feed\":true,\"custom_html\":true,\"vcard\":true,\"image_grid\":true,\"divider\":true}}}'),
(19, 'payment', '{\"is_enabled\":0,\"type\":\"both\",\"default_payment_frequency\":\"monthly\",\"currencies\":{\"BRL\":{\"code\":\"BRL\",\"symbol\":\"$\",\"default_payment_processor\":\"offline_payment\"}},\"default_currency\":\"BRL\",\"codes_is_enabled\":1,\"taxes_and_billing_is_enabled\":1,\"invoice_is_enabled\":1,\"user_plan_expiry_reminder\":0,\"user_plan_expiry_checker_is_enabled\":false,\"currency_exchange_api_key\":\"\"}'),
(20, 'paypal', '{\"is_enabled\":\"0\",\"mode\":\"sandbox\",\"client_id\":\"\",\"secret\":\"\"}'),
(21, 'stripe', '{\"is_enabled\":\"0\",\"publishable_key\":\"\",\"secret_key\":\"\",\"webhook_secret\":\"\"}'),
(22, 'offline_payment', '{\"is_enabled\":true,\"instructions\":\"Your offline/manual payment instructions go here, which the user will see when paying via this method.\",\"proof_size_limit\":2}'),
(23, 'coinbase', '{\"is_enabled\":false,\"api_key\":\"\",\"webhook_secret\":\"\",\"currencies\":[\"USD\"]}'),
(24, 'payu', '{\"is_enabled\":false,\"mode\":\"sandbox\",\"merchant_pos_id\":\"\",\"signature_key\":\"\",\"oauth_client_id\":\"\",\"oauth_client_secret\":\"\",\"currencies\":[\"USD\"]}'),
(25, 'iyzico', '{\"is_enabled\":false,\"mode\":\"live\",\"api_key\":\"\",\"secret_key\":\"\",\"currencies\":[\"USD\"]}'),
(26, 'paystack', '{\"is_enabled\":false,\"public_key\":\"\",\"secret_key\":\"\",\"currencies\":[\"USD\"]}'),
(27, 'razorpay', '{\"is_enabled\":false,\"key_id\":\"\",\"key_secret\":\"\",\"webhook_secret\":\"\",\"currencies\":[\"USD\"]}'),
(28, 'mollie', '{\"is_enabled\":false,\"api_key\":\"\"}'),
(29, 'yookassa', '{\"is_enabled\":false,\"shop_id\":\"\",\"secret_key\":\"\"}'),
(30, 'crypto_com', '{\"is_enabled\":false,\"publishable_key\":\"\",\"secret_key\":\"\",\"webhook_secret\":\"\"}'),
(31, 'paddle', '{\"is_enabled\":false,\"mode\":\"sandbox\",\"vendor_id\":\"\",\"api_key\":\"\",\"public_key\":\"\",\"currencies\":[\"USD\"]}'),
(32, 'mercadopago', '{\"is_enabled\":false,\"access_token\":\"\",\"currencies\":[\"USD\"]}'),
(33, 'midtrans', '{\"is_enabled\":false,\"server_key\":\"\",\"mode\":\"sandbox\",\"currencies\":[\"USD\"]}'),
(34, 'flutterwave', '{\"is_enabled\":false,\"secret_key\":\"\",\"currencies\":[\"USD\"]}'),
(35, 'smtp', '{\"from_name\":\"\",\"from\":\"\",\"host\":\"\",\"encryption\":\"tls\",\"port\":\"\",\"auth\":false,\"username\":\"\",\"password\":\"\",\"display_socials\":false,\"company_details\":\"\"}'),
(36, 'custom', '{\"head_js\":\"\",\"head_css\":\"\",\"head_js_biolink\":\"\",\"head_css_biolink\":\"\",\"head_js_splash_page\":\"\",\"head_css_splash_page\":\"\"}'),
(37, 'theme', '{\"light_gray_25\":\"#fcfcfd\",\"light_primary_50\":\"#eff8ff\",\"light_gray_50\":\"#fcfcfc\",\"light_primary_100\":\"#e1f2fe\",\"light_gray_100\":\"#f6f7f8\",\"light_primary_200\":\"#b9e5fc\",\"light_gray_200\":\"#f0f2f3\",\"light_primary_300\":\"#82d3fb\",\"light_gray_300\":\"#e5e7ea\",\"light_primary_400\":\"#3fbaf8\",\"light_gray_400\":\"#a6afb9\",\"light_primary_500\":\"#0ea5ea\",\"light_gray_500\":\"#9ba4b0\",\"light_primary_600\":\"#1180c5\",\"light_gray_600\":\"#6b7789\",\"light_primary_700\":\"#0c68a1\",\"light_gray_700\":\"#4c5361\",\"light_primary_800\":\"#0d5a86\",\"light_gray_800\":\"#31363e\",\"light_primary_900\":\"#0f496f\",\"light_gray_900\":\"#1d1f25\",\"light_border_radius\":0.5,\"light_font_family\":\"\",\"dark_gray_25\":\"#0a0c10\",\"dark_primary_50\":\"#010b12\",\"dark_gray_50\":\"#0d0e11\",\"dark_primary_100\":\"#0e4062\",\"dark_gray_100\":\"#181a1f\",\"dark_primary_200\":\"#0b4d74\",\"dark_gray_200\":\"#2f333b\",\"dark_primary_300\":\"#0b5e93\",\"dark_gray_300\":\"#3c424d\",\"dark_primary_400\":\"#0f76b6\",\"dark_gray_400\":\"#606b7a\",\"dark_primary_500\":\"#0e9ee1\",\"dark_gray_500\":\"#707d8e\",\"dark_primary_600\":\"#2bb3f7\",\"dark_gray_600\":\"#a0aab4\",\"dark_primary_700\":\"#6eccfb\",\"dark_gray_700\":\"#b4bbc4\",\"dark_primary_800\":\"#a1dcfc\",\"dark_gray_800\":\"#d7dbdf\",\"dark_primary_900\":\"#cde9fd\",\"dark_gray_900\":\"#f0f2f3\",\"dark_border_radius\":0.5,\"dark_font_family\":\"\",\"light_is_enabled\":false,\"dark_is_enabled\":false}'),
(38, 'socials', '{\"threads\":\"\",\"youtube\":\"\",\"facebook\":\"\",\"x\":\"\",\"instagram\":\"\",\"tiktok\":\"\",\"linkedin\":\"\",\"whatsapp\":\"\",\"email\":\"\"}'),
(39, 'announcements', '{\"guests_id\":\"16e2fdd0e771da32ec9e557c491fe17d\",\"guests_content\":\"\",\"guests_text_color\":\"#ffffff\",\"guests_background_color\":\"#000000\",\"users_id\":\"16e2fdd0e771da32ec9e557c491fe17d\",\"users_content\":\"\",\"users_text_color\":\"#dbebff\",\"users_background_color\":\"#000000\"}'),
(40, 'business', '{\"invoice_is_enabled\":\"0\",\"name\":\"\",\"address\":\"\",\"city\":\"\",\"county\":\"\",\"zip\":\"\",\"country\":\"\",\"email\":\"\",\"phone\":\"\",\"tax_type\":\"\",\"tax_id\":\"\",\"custom_key_one\":\"\",\"custom_value_one\":\"\",\"custom_key_two\":\"\",\"custom_value_two\":\"\"}'),
(41, 'webhooks', '{\"user_new\":\"\",\"user_delete\":\"\",\"payment_new\":\"\",\"code_redeemed\":\"\",\"contact\":\"\",\"cron_start\":\"\",\"cron_end\":\"\",\"domain_new\":\"\",\"domain_update\":\"\"}'),
(42, 'cookie_consent', '{\"is_enabled\":false,\"logging_is_enabled\":false,\"necessary_is_enabled\":true,\"analytics_is_enabled\":true,\"targeting_is_enabled\":true,\"layout\":\"bar\",\"position_y\":\"middle\",\"position_x\":\"center\"}'),
(43, 'links', '{\"example_url\":\"\",\"random_url_length\":5,\"branding\":\"by AltumCode\",\"shortener_is_enabled\":true,\"qr_codes_is_enabled\":true,\"biolinks_is_enabled\":true,\"biolinks_templates_is_enabled\":true,\"biolinks_new_blocks_position\":\"bottom\",\"files_is_enabled\":true,\"vcards_is_enabled\":true,\"events_is_enabled\":true,\"static_is_enabled\":true,\"splash_page_is_enabled\":true,\"splash_page_auto_redirect\":true,\"splash_page_link_unlock_seconds\":3,\"directory_is_enabled\":true,\"directory_access\":\"everyone\",\"directory_display\":\"all\",\"domains_is_enabled\":true,\"additional_domains_is_enabled\":true,\"main_domain_is_enabled\":true,\"domains_custom_main_ip\":\"\",\"blacklisted_domains\":\"\",\"blacklisted_keywords\":\"\",\"google_safe_browsing_is_enabled\":false,\"google_safe_browsing_api_key\":\"\",\"google_static_maps_is_enabled\":false,\"google_static_maps_api_key\":\"\",\"avatar_size_limit\":2,\"background_size_limit\":2,\"favicon_size_limit\":2,\"seo_image_size_limit\":2,\"thumbnail_image_size_limit\":2,\"image_size_limit\":2,\"audio_size_limit\":2,\"video_size_limit\":2,\"file_size_limit\":2,\"product_file_size_limit\":2,\"static_size_limit\":2}'),
(44, 'codes', '{}'),
(45, 'tools', '{\"is_enabled\":true,\"access\":\"everyone\",\"available_tools\":{\"dns_lookup\":true,\"ip_lookup\":true,\"reverse_ip_lookup\":true,\"ssl_lookup\":true,\"whois_lookup\":true,\"ping\":true,\"md2_generator\":true,\"md4_generator\":true,\"md5_generator\":true,\"whirlpool_generator\":true,\"sha1_generator\":true,\"sha224_generator\":true,\"sha256_generator\":true,\"sha384_generator\":true,\"sha512_generator\":true,\"sha512_224_generator\":true,\"sha512_256_generator\":true,\"sha3_224_generator\":true,\"sha3_256_generator\":true,\"sha3_384_generator\":true,\"sha3_512_generator\":true,\"base64_encoder\":true,\"base64_decoder\":true,\"base64_to_image\":true,\"image_to_base64\":true,\"url_encoder\":true,\"url_decoder\":true,\"lorem_ipsum_generator\":true,\"markdown_to_html\":true,\"case_converter\":true,\"random_number_generator\":true,\"uuid_v4_generator\":true,\"bcrypt_generator\":true,\"password_generator\":true,\"password_strength_checker\":true,\"slug_generator\":true,\"html_minifier\":true,\"css_minifier\":true,\"js_minifier\":true,\"user_agent_parser\":true,\"website_hosting_checker\":true,\"file_mime_type_checker\":true,\"gravatar_checker\":false,\"character_counter\":true,\"list_randomizer\":true,\"reverse_words\":true,\"reverse_letters\":true,\"emojis_remover\":true,\"reverse_list\":true,\"list_alphabetizer\":true,\"upside_down_text_generator\":true,\"old_english_text_generator\":true,\"cursive_text_generator\":true,\"palindrome_checker\":true,\"url_parser\":true,\"color_converter\":true,\"http_headers_lookup\":true,\"duplicate_lines_remover\":true,\"text_to_speech\":true,\"idn_punnycode_converter\":true,\"json_validator_beautifier\":true,\"qr_code_reader\":true,\"meta_tags_checker\":true,\"exif_reader\":true,\"color_picker\":true,\"sql_beautifier\":true,\"html_entity_converter\":true,\"binary_converter\":true,\"hex_converter\":true,\"ascii_converter\":true,\"decimal_converter\":true,\"octal_converter\":true,\"morse_converter\":true,\"number_to_words_converter\":true,\"mailto_link_generator\":true,\"youtube_thumbnail_downloader\":true,\"safe_url_checker\":true,\"utm_link_generator\":true,\"whatsapp_link_generator\":true,\"youtube_timestamp_link_generator\":true,\"google_cache_checker\":true,\"url_redirect_checker\":true,\"image_optimizer\":true,\"png_to_jpg\":true,\"png_to_webp\":true,\"png_to_bmp\":true,\"png_to_gif\":true,\"png_to_ico\":true,\"jpg_to_png\":true,\"jpg_to_webp\":true,\"jpg_to_gif\":true,\"jpg_to_ico\":true,\"jpg_to_bmp\":true,\"webp_to_jpg\":true,\"webp_to_gif\":true,\"webp_to_png\":true,\"webp_to_bmp\":true,\"webp_to_ico\":true,\"bmp_to_jpg\":true,\"bmp_to_gif\":true,\"bmp_to_png\":true,\"bmp_to_webp\":true,\"bmp_to_ico\":true,\"ico_to_jpg\":true,\"ico_to_gif\":true,\"ico_to_png\":true,\"ico_to_webp\":true,\"ico_to_bmp\":true,\"gif_to_jpg\":true,\"gif_to_ico\":true,\"gif_to_png\":true,\"gif_to_webp\":true,\"gif_to_bmp\":true,\"text_separator\":true,\"email_extractor\":true,\"url_extractor\":true,\"text_size_calculator\":true,\"paypal_link_generator\":true,\"bbcode_to_html\":true,\"html_tags_remover\":true,\"celsius_to_fahrenheit\":true,\"celsius_to_kelvin\":true,\"fahrenheit_to_celsius\":true,\"fahrenheit_to_kelvin\":true,\"kelvin_to_celsius\":true,\"kelvin_to_fahrenheit\":true,\"miles_to_kilometers\":true,\"kilometers_to_miles\":true,\"miles_per_hour_to_kilometers_per_hour\":true,\"kilometers_per_hour_to_miles_per_hour\":true,\"kilograms_to_pounds\":true,\"pounds_to_kilograms\":true,\"number_to_roman_numerals\":true,\"roman_numerals_to_number\":true,\"liters_to_gallons_us\":true,\"liters_to_gallons_imperial\":true,\"gallons_us_to_liters\":true,\"gallons_imperial_to_liters\":true,\"unix_timestamp_to_date\":true,\"date_to_unix_timestamp\":true,\"signature_generator\":true},\"extra_content_is_enabled\":true,\"share_is_enabled\":true,\"similar_widget_is_enabled\":true}'),
(46, 'license', '{\"license\":\"nullcave.pro\",\"type\":\"Extended License\"}'),
(47, 'product_info', '{\"version\":\"47.0.0\", \"code\":\"4700\"}');

-- --------------------------------------------------------

--
-- Estrutura da tabela `splash_pages`
--

CREATE TABLE `splash_pages` (
  `splash_page_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `title` varchar(256) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `link_unlock_seconds` int(10) UNSIGNED DEFAULT 5,
  `auto_redirect` tinyint(3) UNSIGNED DEFAULT 0,
  `settings` text DEFAULT NULL,
  `last_datetime` datetime DEFAULT NULL,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `taxes`
--

CREATE TABLE `taxes` (
  `tax_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `value_type` enum('percentage','fixed') DEFAULT NULL,
  `type` enum('inclusive','exclusive') DEFAULT NULL,
  `billing_type` enum('personal','business','both') DEFAULT NULL,
  `countries` text DEFAULT NULL,
  `datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tools_usage`
--

CREATE TABLE `tools_usage` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tool_id` varchar(64) DEFAULT NULL,
  `total_views` bigint(20) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `track_links`
--

CREATE TABLE `track_links` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `link_id` int(11) DEFAULT NULL,
  `biolink_block_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `country_code` varchar(8) DEFAULT NULL,
  `city_name` varchar(128) DEFAULT NULL,
  `os_name` varchar(16) DEFAULT NULL,
  `browser_name` varchar(32) DEFAULT NULL,
  `referrer_host` varchar(256) DEFAULT NULL,
  `referrer_path` varchar(1024) DEFAULT NULL,
  `device_type` varchar(16) DEFAULT NULL,
  `browser_language` varchar(16) DEFAULT NULL,
  `utm_source` varchar(128) DEFAULT NULL,
  `utm_medium` varchar(128) DEFAULT NULL,
  `utm_campaign` varchar(128) DEFAULT NULL,
  `is_unique` tinyint(4) DEFAULT 0,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(320) NOT NULL,
  `password` varchar(128) DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `billing` text DEFAULT NULL,
  `api_key` varchar(32) DEFAULT NULL,
  `token_code` varchar(32) DEFAULT NULL,
  `twofa_secret` varchar(16) DEFAULT NULL,
  `anti_phishing_code` varchar(8) DEFAULT NULL,
  `one_time_login_code` varchar(32) DEFAULT NULL,
  `pending_email` varchar(128) DEFAULT NULL,
  `email_activation_code` varchar(32) DEFAULT NULL,
  `lost_password_code` varchar(32) DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `is_newsletter_subscribed` tinyint(4) NOT NULL DEFAULT 0,
  `has_pending_internal_notifications` tinyint(4) NOT NULL DEFAULT 0,
  `plan_id` varchar(16) NOT NULL DEFAULT '',
  `plan_expiration_date` datetime DEFAULT NULL,
  `plan_settings` text DEFAULT NULL,
  `plan_trial_done` tinyint(4) DEFAULT 0,
  `plan_expiry_reminder` tinyint(4) DEFAULT 0,
  `payment_subscription_id` varchar(64) DEFAULT NULL,
  `payment_processor` varchar(16) DEFAULT NULL,
  `payment_total_amount` float DEFAULT NULL,
  `payment_currency` varchar(4) DEFAULT NULL,
  `referral_key` varchar(32) DEFAULT NULL,
  `referred_by` varchar(32) DEFAULT NULL,
  `referred_by_has_converted` tinyint(4) DEFAULT 0,
  `language` varchar(32) DEFAULT 'english',
  `currency` varchar(4) DEFAULT NULL,
  `timezone` varchar(32) DEFAULT 'UTC',
  `preferences` text DEFAULT NULL,
  `extra` text DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `continent_code` varchar(8) DEFAULT NULL,
  `country` varchar(8) DEFAULT NULL,
  `city_name` varchar(32) DEFAULT NULL,
  `device_type` varchar(16) DEFAULT NULL,
  `browser_language` varchar(32) DEFAULT NULL,
  `browser_name` varchar(32) DEFAULT NULL,
  `os_name` varchar(16) DEFAULT NULL,
  `last_activity` datetime DEFAULT NULL,
  `total_logins` int(11) DEFAULT 0,
  `user_deletion_reminder` tinyint(4) DEFAULT 0,
  `source` varchar(32) DEFAULT 'direct'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`, `name`, `billing`, `api_key`, `token_code`, `twofa_secret`, `anti_phishing_code`, `one_time_login_code`, `pending_email`, `email_activation_code`, `lost_password_code`, `type`, `status`, `is_newsletter_subscribed`, `has_pending_internal_notifications`, `plan_id`, `plan_expiration_date`, `plan_settings`, `plan_trial_done`, `plan_expiry_reminder`, `payment_subscription_id`, `payment_processor`, `payment_total_amount`, `payment_currency`, `referral_key`, `referred_by`, `referred_by_has_converted`, `language`, `currency`, `timezone`, `preferences`, `extra`, `datetime`, `ip`, `continent_code`, `country`, `city_name`, `device_type`, `browser_language`, `browser_name`, `os_name`, `last_activity`, `total_logins`, `user_deletion_reminder`, `source`) VALUES
(1, 'admin', '$2y$10$uFNO0pQKEHSFcus1zSFlveiPCB3EvG9ZlES7XKgJFTAl5JbRGFCWy', 'AltumCode', NULL, '8548b46a2ee1df23abe2dfa10cfc63a3', 'e627c82b15f5106312ee8364941adc74', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 'custom', '2030-01-01 12:00:00', '{\"url_minimum_characters\":1,\"url_maximum_characters\":256,\"additional_domains\":[],\"custom_url\":true,\"deep_links\":true,\"no_ads\":true,\"removable_branding\":true,\"custom_branding\":true,\"statistics\":true,\"custom_backgrounds\":true,\"verified\":false,\"temporary_url_is_enabled\":true,\"cloaking_is_enabled\":true,\"app_linking_is_enabled\":true,\"seo\":true,\"utm\":true,\"fonts\":true,\"password\":true,\"sensitive_content\":true,\"leap_link\":true,\"api_is_enabled\":true,\"dofollow_is_enabled\":true,\"biolink_blocks_limit\":-1,\"projects_limit\":-1,\"splash_pages_limit\":-1,\"pixels_limit\":-1,\"qr_codes_limit\":-1,\"biolinks_limit\":-1,\"links_limit\":-1,\"files_limit\":-1,\"vcards_limit\":-1,\"events_limit\":-1,\"static_limit\":-1,\"domains_limit\":-1,\"payment_processors_limit\":-1,\"signatures_limit\":-1,\"teams_limit\":-1,\"team_members_limit\":-1,\"affiliate_commission_percentage\":50,\"track_links_retention\":365,\"custom_css_is_enabled\":true,\"custom_js_is_enabled\":true,\"enabled_biolink_blocks\":{\"link\":true,\"heading\":true,\"paragraph\":true,\"avatar\":true,\"image\":true,\"socials\":true,\"email_collector\":true,\"threads\":true,\"soundcloud\":true,\"spotify\":true,\"youtube\":true,\"twitch\":true,\"vimeo\":true,\"tiktok_video\":true,\"paypal\":true,\"phone_collector\":true,\"map\":true,\"applemusic\":true,\"tidal\":true,\"anchor\":true,\"twitter_profile\":true,\"twitter_tweet\":true,\"pinterest_profile\":true,\"instagram_media\":true,\"snapchat\":true,\"rss_feed\":true,\"custom_html\":true,\"vcard\":true,\"image_grid\":true,\"divider\":true,\"list\":true,\"alert\":true,\"tiktok_profile\":true,\"big_link\":true,\"faq\":true,\"typeform\":true,\"discord\":true,\"facebook\":true,\"reddit\":true,\"audio\":true,\"video\":true,\"file\":true,\"countdown\":true,\"cta\":true,\"external_item\":true,\"share\":true,\"youtube_feed\":true,\"timeline\":true,\"review\":true,\"image_slider\":true,\"pdf_document\":true,\"markdown\":true,\"rumble\":true,\"telegram\":true,\"donation\":true,\"product\":true,\"service\":true},\"documents_model\":\"gpt-4-1106-preview\",\"documents_per_month_limit\":-1,\"words_per_month_limit\":-1,\"images_api\":\"dall-e-3\",\"images_per_month_limit\":-1,\"transcriptions_per_month_limit\":-1,\"transcriptions_file_size_limit\":2,\"chats_model\":\"gpt-4-vision-preview\",\"chats_per_month_limit\":-1,\"chat_messages_per_chat_limit\":-1,\"chat_image_size_limit\":2,\"syntheses_api\":\"openai_audio\",\"syntheses_per_month_limit\":-1,\"synthesized_characters_per_month_limit\":-1,\"force_splash_page_on_link\":false,\"force_splash_page_on_biolink\":false,\"force_splash_page_on_file\":false,\"force_splash_page_on_static\":false,\"force_splash_page_on_vcard\":false,\"force_splash_page_on_event\":false}', 0, 0, NULL, NULL, NULL, NULL, '73a323689e33657ad5eb085702dc70e8', NULL, 0, 'english', NULL, 'UTC', NULL, NULL, '2024-10-18 12:55:37', '::1', NULL, NULL, NULL, 'desktop', 'pt', 'Chrome', 'Windows', '2024-10-19 19:38:38', 1, 0, 'direct');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users_logs`
--

CREATE TABLE `users_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `device_type` varchar(16) DEFAULT NULL,
  `os_name` varchar(16) DEFAULT NULL,
  `continent_code` varchar(8) DEFAULT NULL,
  `country_code` varchar(8) DEFAULT NULL,
  `city_name` varchar(32) DEFAULT NULL,
  `browser_language` varchar(32) DEFAULT NULL,
  `browser_name` varchar(32) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `users_logs`
--

INSERT INTO `users_logs` (`id`, `user_id`, `type`, `ip`, `device_type`, `os_name`, `continent_code`, `country_code`, `city_name`, `browser_language`, `browser_name`, `datetime`) VALUES
(1, 1, 'login.default.success', '::1', 'desktop', 'Windows', NULL, NULL, NULL, 'pt', 'Chrome', '2024-10-18 15:56:07');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `biolinks_blocks`
--
ALTER TABLE `biolinks_blocks`
  ADD PRIMARY KEY (`biolink_block_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `links_type_index` (`type`),
  ADD KEY `links_links_link_id_fk` (`link_id`);

--
-- Índices para tabela `biolinks_templates`
--
ALTER TABLE `biolinks_templates`
  ADD PRIMARY KEY (`biolink_template_id`),
  ADD KEY `link_id` (`link_id`);

--
-- Índices para tabela `biolinks_themes`
--
ALTER TABLE `biolinks_themes`
  ADD PRIMARY KEY (`biolink_theme_id`);

--
-- Índices para tabela `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`blog_post_id`),
  ADD KEY `blog_post_id_index` (`blog_post_id`),
  ADD KEY `blog_post_url_index` (`url`),
  ADD KEY `blog_posts_category_id` (`blog_posts_category_id`),
  ADD KEY `blog_posts_is_published_index` (`is_published`),
  ADD KEY `blog_posts_language_index` (`language`);

--
-- Índices para tabela `blog_posts_categories`
--
ALTER TABLE `blog_posts_categories`
  ADD PRIMARY KEY (`blog_posts_category_id`),
  ADD KEY `url` (`url`),
  ADD KEY `blog_posts_categories_url_language_index` (`url`,`language`);

--
-- Índices para tabela `broadcasts`
--
ALTER TABLE `broadcasts`
  ADD PRIMARY KEY (`broadcast_id`);

--
-- Índices para tabela `broadcasts_statistics`
--
ALTER TABLE `broadcasts_statistics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `broadcast_id` (`broadcast_id`),
  ADD KEY `broadcasts_statistics_user_id_broadcast_id_type_index` (`broadcast_id`,`user_id`,`type`),
  ADD KEY `broadcasts_statistics_ibfk_1` (`user_id`);

--
-- Índices para tabela `codes`
--
ALTER TABLE `codes`
  ADD PRIMARY KEY (`code_id`),
  ADD KEY `type` (`type`),
  ADD KEY `code` (`code`);

--
-- Índices para tabela `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`datum_id`),
  ADD UNIQUE KEY `datum_id` (`datum_id`),
  ADD KEY `link_id` (`link_id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `biolink_block_id` (`biolink_block_id`);

--
-- Índices para tabela `domains`
--
ALTER TABLE `domains`
  ADD PRIMARY KEY (`domain_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `host` (`host`),
  ADD KEY `type` (`type`);

--
-- Índices para tabela `internal_notifications`
--
ALTER TABLE `internal_notifications`
  ADD PRIMARY KEY (`internal_notification_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `users_notifications_for_who_idx` (`for_who`) USING BTREE;

--
-- Índices para tabela `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `url` (`url`),
  ADD KEY `links_subtype_index` (`subtype`),
  ADD KEY `links_type_index` (`type`),
  ADD KEY `links_biolinks_themes_biolink_theme_id_fk` (`biolink_theme_id`),
  ADD KEY `links_splash_page_id_index` (`splash_page_id`);

--
-- Índices para tabela `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`page_id`),
  ADD KEY `pages_pages_category_id_index` (`pages_category_id`),
  ADD KEY `pages_url_index` (`url`),
  ADD KEY `pages_is_published_index` (`is_published`),
  ADD KEY `pages_language_index` (`language`);

--
-- Índices para tabela `pages_categories`
--
ALTER TABLE `pages_categories`
  ADD PRIMARY KEY (`pages_category_id`),
  ADD KEY `url` (`url`),
  ADD KEY `pages_categories_url_language_index` (`url`,`language`);

--
-- Índices para tabela `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_user_id` (`user_id`),
  ADD KEY `plan_id` (`plan_id`);

--
-- Índices para tabela `pixels`
--
ALTER TABLE `pixels`
  ADD PRIMARY KEY (`pixel_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices para tabela `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`plan_id`);

--
-- Índices para tabela `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`project_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices para tabela `qr_codes`
--
ALTER TABLE `qr_codes`
  ADD PRIMARY KEY (`qr_code_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `qr_codes_links_link_id_fk` (`link_id`);

--
-- Índices para tabela `redeemed_codes`
--
ALTER TABLE `redeemed_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code_id` (`code_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices para tabela `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Índices para tabela `splash_pages`
--
ALTER TABLE `splash_pages`
  ADD PRIMARY KEY (`splash_page_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices para tabela `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`tax_id`);

--
-- Índices para tabela `tools_usage`
--
ALTER TABLE `tools_usage`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tools_usage_tool_id_idx` (`tool_id`) USING BTREE;

--
-- Índices para tabela `track_links`
--
ALTER TABLE `track_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `link_id` (`link_id`),
  ADD KEY `track_links_date_index` (`datetime`),
  ADD KEY `track_links_project_id_index` (`project_id`),
  ADD KEY `track_links_users_user_id_fk` (`user_id`),
  ADD KEY `track_links_biolink_block_id_index` (`biolink_block_id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `plan_id` (`plan_id`),
  ADD KEY `api_key` (`api_key`);

--
-- Índices para tabela `users_logs`
--
ALTER TABLE `users_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_logs_user_id` (`user_id`),
  ADD KEY `users_logs_ip_type_datetime_index` (`ip`,`type`,`datetime`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `biolinks_blocks`
--
ALTER TABLE `biolinks_blocks`
  MODIFY `biolink_block_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `biolinks_templates`
--
ALTER TABLE `biolinks_templates`
  MODIFY `biolink_template_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `biolinks_themes`
--
ALTER TABLE `biolinks_themes`
  MODIFY `biolink_theme_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `blog_post_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `blog_posts_categories`
--
ALTER TABLE `blog_posts_categories`
  MODIFY `blog_posts_category_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `broadcasts`
--
ALTER TABLE `broadcasts`
  MODIFY `broadcast_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `broadcasts_statistics`
--
ALTER TABLE `broadcasts_statistics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `codes`
--
ALTER TABLE `codes`
  MODIFY `code_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `data`
--
ALTER TABLE `data`
  MODIFY `datum_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `domains`
--
ALTER TABLE `domains`
  MODIFY `domain_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `internal_notifications`
--
ALTER TABLE `internal_notifications`
  MODIFY `internal_notification_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `links`
--
ALTER TABLE `links`
  MODIFY `link_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `pages`
--
ALTER TABLE `pages`
  MODIFY `page_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `pages_categories`
--
ALTER TABLE `pages_categories`
  MODIFY `pages_category_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pixels`
--
ALTER TABLE `pixels`
  MODIFY `pixel_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `plans`
--
ALTER TABLE `plans`
  MODIFY `plan_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `projects`
--
ALTER TABLE `projects`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `qr_codes`
--
ALTER TABLE `qr_codes`
  MODIFY `qr_code_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `redeemed_codes`
--
ALTER TABLE `redeemed_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de tabela `splash_pages`
--
ALTER TABLE `splash_pages`
  MODIFY `splash_page_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `taxes`
--
ALTER TABLE `taxes`
  MODIFY `tax_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tools_usage`
--
ALTER TABLE `tools_usage`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `track_links`
--
ALTER TABLE `track_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `users_logs`
--
ALTER TABLE `users_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `biolinks_blocks`
--
ALTER TABLE `biolinks_blocks`
  ADD CONSTRAINT `biolinks_blocks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `biolinks_blocks_ibfk_2` FOREIGN KEY (`link_id`) REFERENCES `links` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `biolinks_templates`
--
ALTER TABLE `biolinks_templates`
  ADD CONSTRAINT `biolinks_templates_ibfk_1` FOREIGN KEY (`link_id`) REFERENCES `links` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD CONSTRAINT `blog_posts_ibfk_1` FOREIGN KEY (`blog_posts_category_id`) REFERENCES `blog_posts_categories` (`blog_posts_category_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limitadores para a tabela `broadcasts_statistics`
--
ALTER TABLE `broadcasts_statistics`
  ADD CONSTRAINT `broadcasts_statistics_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `broadcasts_statistics_ibfk_2` FOREIGN KEY (`broadcast_id`) REFERENCES `broadcasts` (`broadcast_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `data`
--
ALTER TABLE `data`
  ADD CONSTRAINT `data_ibfk_1` FOREIGN KEY (`link_id`) REFERENCES `links` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `data_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `data_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `data_ibfk_4` FOREIGN KEY (`biolink_block_id`) REFERENCES `biolinks_blocks` (`biolink_block_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `domains`
--
ALTER TABLE `domains`
  ADD CONSTRAINT `domains_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `internal_notifications`
--
ALTER TABLE `internal_notifications`
  ADD CONSTRAINT `internal_notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `links`
--
ALTER TABLE `links`
  ADD CONSTRAINT `links_biolinks_themes_biolink_theme_id_fk` FOREIGN KEY (`biolink_theme_id`) REFERENCES `biolinks_themes` (`biolink_theme_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `links_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `links_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `links_splash_pages_splash_page_id_fk` FOREIGN KEY (`splash_page_id`) REFERENCES `splash_pages` (`splash_page_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limitadores para a tabela `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `pages_ibfk_1` FOREIGN KEY (`pages_category_id`) REFERENCES `pages_categories` (`pages_category_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limitadores para a tabela `pixels`
--
ALTER TABLE `pixels`
  ADD CONSTRAINT `pixels_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `qr_codes`
--
ALTER TABLE `qr_codes`
  ADD CONSTRAINT `qr_codes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `qr_codes_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `qr_codes_links_link_id_fk` FOREIGN KEY (`link_id`) REFERENCES `links` (`link_id`);

--
-- Limitadores para a tabela `track_links`
--
ALTER TABLE `track_links`
  ADD CONSTRAINT `track_links_ibfk_1` FOREIGN KEY (`link_id`) REFERENCES `links` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `track_links_links_project_id_fk` FOREIGN KEY (`project_id`) REFERENCES `links` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `track_links_projects_project_id_fk` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `track_links_users_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `users_logs`
--
ALTER TABLE `users_logs`
  ADD CONSTRAINT `users_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Banco de dados: `forponto`
--
CREATE DATABASE IF NOT EXISTS `forponto` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `forponto`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id` int(11) NOT NULL,
  `matricula` varchar(50) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `funcionarios`
--

INSERT INTO `funcionarios` (`id`, `matricula`, `senha`, `nome`, `created_at`) VALUES
(1, '0001', '123456', '', '2024-10-19 21:07:42'),
(2, '0002', '$2a$10$rSu8Ad/miShgVG.SH3Sc1uduxUHjnlfkJy4R596.tMprVATyuB91K', 'Lucas', '2024-10-19 21:20:23'),
(3, '15065', '$2a$10$zXJWvaYiPGJ/KdgypqWuyuPGQ78r/2cEoS6BlmN.euCxb20y4.N46', 'Marcela Viana', '2024-10-19 21:29:15');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pontos`
--

CREATE TABLE `pontos` (
  `id` int(11) NOT NULL,
  `funcionario_id` int(11) NOT NULL,
  `data` date NOT NULL,
  `hora_entrada` time DEFAULT NULL,
  `hora_saida` time DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `pontos`
--

INSERT INTO `pontos` (`id`, `funcionario_id`, `data`, `hora_entrada`, `hora_saida`, `created_at`, `updated_at`) VALUES
(1, 2, '2024-10-20', '00:23:26', '00:23:43', '2024-10-19 21:23:26', '2024-10-19 21:23:43'),
(2, 2, '2024-10-20', '00:27:32', NULL, '2024-10-19 21:27:32', '2024-10-19 21:27:32');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matricula` (`matricula`);

--
-- Índices para tabela `pontos`
--
ALTER TABLE `pontos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `funcionario_id` (`funcionario_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `pontos`
--
ALTER TABLE `pontos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `pontos`
--
ALTER TABLE `pontos`
  ADD CONSTRAINT `pontos_ibfk_1` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`);
--
-- Banco de dados: `forpontoweb`
--
CREATE DATABASE IF NOT EXISTS `forpontoweb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `forpontoweb`;
--
-- Banco de dados: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Extraindo dados da tabela `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"forponto\",\"table\":\"pontos\"},{\"db\":\"forponto\",\"table\":\"funcionarios\"}]');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Extraindo dados da tabela `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-10-19 23:30:24', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"pt\"}');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Índices para tabela `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Índices para tabela `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Índices para tabela `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Índices para tabela `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Índices para tabela `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Índices para tabela `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Índices para tabela `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Índices para tabela `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Índices para tabela `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Índices para tabela `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Índices para tabela `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Índices para tabela `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Índices para tabela `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Índices para tabela `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Índices para tabela `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Índices para tabela `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Índices para tabela `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Banco de dados: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
