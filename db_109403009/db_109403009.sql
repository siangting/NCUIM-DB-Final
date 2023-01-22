-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 192.168.56.101    Database: db_109403009
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tblCategory`
--

DROP TABLE IF EXISTS `tblCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblCategory` (
  `id_tblCategory` int unsigned NOT NULL,
  `CategoryName_tblCategory` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tblCategory`),
  UNIQUE KEY `id_catgory_UNIQUE` (`id_tblCategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblCategory`
--

LOCK TABLES `tblCategory` WRITE;
/*!40000 ALTER TABLE `tblCategory` DISABLE KEYS */;
INSERT INTO `tblCategory` VALUES (1,'科技'),(2,'遊戲'),(3,'教育'),(4,'地方創生'),(5,'空間'),(6,'飲食'),(7,'時尚'),(8,'音樂'),(9,'新春賀喜'),(10,'攝影');
/*!40000 ALTER TABLE `tblCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblComment`
--

DROP TABLE IF EXISTS `tblComment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblComment` (
  `id_tblComment` int unsigned NOT NULL,
  `proposal_id` int unsigned DEFAULT NULL,
  `member_id` int unsigned DEFAULT NULL,
  `UserComment_tblcomment` varchar(200) DEFAULT NULL,
  `ProposerResponse_tblComment` varchar(200) DEFAULT NULL,
  `CommentTime_tblComment` datetime NOT NULL,
  PRIMARY KEY (`id_tblComment`),
  KEY `proposal_id_fk_idx` (`proposal_id`),
  KEY `member_id_fk_idx` (`member_id`),
  CONSTRAINT `member_id_tblComment_fk` FOREIGN KEY (`member_id`) REFERENCES `tblMember` (`id_tblMember`),
  CONSTRAINT `proposal_id_tblComment_fk` FOREIGN KEY (`proposal_id`) REFERENCES `tblProposal` (`id_tblProposal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblComment`
--

LOCK TABLES `tblComment` WRITE;
/*!40000 ALTER TABLE `tblComment` DISABLE KEYS */;
INSERT INTO `tblComment` VALUES (1,5,9,'不好意思，我的贊助編號是P108681B 想問一下什麼時候會收到呢～！ 感謝','您好，禮盒已經送出，和豐店到店，應該已經抵達喔～ 感謝您對募資計畫的支持喔～ :)','2020-11-18 22:12:00'),(2,1,10,'GoPlus 已更新連線方式，你們還支援24小時不斷線嗎','丹尼的影片 1 : 40 秒有講解如何連線 GoPlus 功能喔～','2020-11-20 22:12:00'),(3,1,3,'請問當寶可夢執行背景應用程式or手機休眠時，247還會持續運作抓怪轉牌嗎?',NULL,'2021-09-18 02:18:00'),(4,5,4,'讚！！每日寫日記','太棒了，歡迎在我們FB粉絲頁跟大家分享喔～','2021-09-28 02:18:00'),(5,4,8,'加油！你的作品很有特色，如果size再完整一些，單價低一些應該很有市場的！','謝謝您的支持與鼓勵！！','2021-10-18 02:18:00'),(6,10,1,'上次短褲沒跟到，這次上衣短褲共下買。','謝謝您的支持 : )','2021-10-28 02:18:00'),(7,1,2,'我多訂一個能退嘛','要請您寄一封信到 support@zeczec.com','2019-03-24 09:31:00'),(8,2,6,'請問軟糖保存期限多久呢？因為同事都是垃圾讓人很需要囤貨 :)','您好，保存期限是一年喔！希望可以陪你平靜渡過被垃圾氣到不行的每一天 :)','2019-04-24 09:31:00'),(9,1,7,'有機會可以早點出貨嗎？6/1要等很久',NULL,'2019-05-24 09:31:00'),(10,3,1,'請問留言tag兩個人的活動我不小心讓他的網頁跳出來該怎麼再操作一次，謝謝。','您好！已另外傳送嘖嘖站內信給您，再請查收','2019-06-24 09:31:00');
/*!40000 ALTER TABLE `tblComment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblFAQ`
--

DROP TABLE IF EXISTS `tblFAQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblFAQ` (
  `id_tblFAQ` int NOT NULL,
  `proposal_id` int unsigned NOT NULL,
  `LastEditorId_tblFAQ` int DEFAULT NULL,
  `Question_tblFAQ` varchar(200) DEFAULT NULL,
  `Answer_tblFAQ` varchar(200) DEFAULT NULL,
  `UpdatedAt_tblFAQ` datetime NOT NULL,
  PRIMARY KEY (`id_tblFAQ`),
  UNIQUE KEY `id_tblFAQ_UNIQUE` (`id_tblFAQ`),
  KEY `proposal_id_fk_idx` (`proposal_id`),
  CONSTRAINT `proposal_id_tblFAQ_fk` FOREIGN KEY (`proposal_id`) REFERENCES `tblProposal` (`id_tblProposal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblFAQ`
--

LOCK TABLES `tblFAQ` WRITE;
/*!40000 ALTER TABLE `tblFAQ` DISABLE KEYS */;
INSERT INTO `tblFAQ` VALUES (1,4,8,'要如何下單？','先點擊想要贊助的方案之後，照著以下步驟 1、選擇您想要「信用卡付款」或是「ATM轉帳」2、選擇您要宅配或是超商取貨，並輸入對應的收件資訊 3、確認贊助人資訊，並按下立刻付款。 4、之後會根據付款方式給您相關的付款資料 5、付款後回到嘖嘖頁面，點選右上角選單的贊助紀錄，就可以確認剛剛是否付款成功囉！','2022-05-24 17:13:00'),(2,4,8,'請問何時會出貨？','預計於2022年7月初開始依訂單編號陸續出貨。','2022-05-24 15:03:31'),(3,1,7,'請問有什麼需要注意的呢？','由於新品PVC材質，於生產完成即封裝寄送，初次開啟會有些許味道屬於正常，收到後可先打開放置通風處即可消除。若有需清潔，可用中性清潔劑清洗乾淨並完全晾乾，切勿長時間曝曬於太陽下。 ','2022-05-24 15:03:43'),(4,2,6,'有多入之大宗採購需求該怎麼做？','歡迎加入LINE@好友搜尋「@550yisos」，將會有專人與您接洽喔！','2022-05-23 15:28:00'),(5,7,3,'付款方式有哪些？','目前開放ATM、信用卡。','2022-05-23 15:28:00'),(6,3,4,'可以用信用卡分期嗎？','【台灣的募資平台因應政府規定，均沒有提供分期付款的功能】不過，持卡者如果想以自己信卡來做【分期付款】這樣是可以的。但是，這樣就會有分期利率手續費的衍生（相關利率依每家銀行規範為準）所以，想要以分期付款的朋友，請你先與你持卡銀行確認相關資訊。','2022-05-23 15:18:00'),(7,10,1,'十月才能收到商品嗎？','事實上如果不受疫情或戰爭的影響~八月就能出貨了！目前確定八月最少可以出100組~先下單先拿到喔','2022-05-24 21:30:00'),(8,6,4,'有使用說明嗎?','請至粉絲專頁~魔術吸管~參考一下喔~','2022-05-15 14:36:00'),(9,6,4,'是否有分男女版型呢 ?','我們的版型皆為中性版型，中性版是男女皆適合喔！','2022-05-19 15:06:00'),(10,5,9,'可否寄送到國外？','目前我們的商品可以寄送到下列地區：香港(運費$250) / 澳門(運費$250) / 中國(運費$250) / 美國(運費$800) / 日本(運費$600)','2022-05-19 15:06:00');
/*!40000 ALTER TABLE `tblFAQ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblFollowingRecord`
--

DROP TABLE IF EXISTS `tblFollowingRecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblFollowingRecord` (
  `id_tblFollowingRecord` int unsigned NOT NULL,
  `proposal_id` int unsigned NOT NULL,
  `member_id` int unsigned NOT NULL,
  PRIMARY KEY (`id_tblFollowingRecord`),
  UNIQUE KEY `id_tblFollowingRecord_UNIQUE` (`id_tblFollowingRecord`),
  KEY `proposal_id_fk_idx` (`proposal_id`),
  KEY `member_id_fk_idx` (`member_id`),
  CONSTRAINT `member_id_tblFollowingRecord_fk` FOREIGN KEY (`member_id`) REFERENCES `tblMember` (`id_tblMember`),
  CONSTRAINT `proposal_id_tblFollowingRecord_fk` FOREIGN KEY (`proposal_id`) REFERENCES `tblProposal` (`id_tblProposal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblFollowingRecord`
--

LOCK TABLES `tblFollowingRecord` WRITE;
/*!40000 ALTER TABLE `tblFollowingRecord` DISABLE KEYS */;
INSERT INTO `tblFollowingRecord` VALUES (1,6,9),(2,1,10),(3,1,3),(4,5,4),(5,4,8),(6,10,1),(7,1,2),(8,2,6),(9,1,7),(10,3,1);
/*!40000 ALTER TABLE `tblFollowingRecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblMember`
--

DROP TABLE IF EXISTS `tblMember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblMember` (
  `id_tblMember` int unsigned NOT NULL AUTO_INCREMENT,
  `Name_tblMember` varchar(64) NOT NULL,
  `Phone_tblMember` varchar(64) NOT NULL,
  `Email_tblMember` varchar(64) NOT NULL,
  `Salt_tblMember` varchar(64) DEFAULT NULL,
  `Address_tblMember` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_tblMember`),
  UNIQUE KEY `Email_tblMember_UNIQUE` (`Email_tblMember`),
  UNIQUE KEY `id_tblMember_UNIQUE` (`id_tblMember`),
  CONSTRAINT `id_tblMember_fk` FOREIGN KEY (`id_tblMember`) REFERENCES `tblMemberCredential` (`id_tblMemberCredential`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblMember`
--

LOCK TABLES `tblMember` WRITE;
/*!40000 ALTER TABLE `tblMember` DISABLE KEYS */;
INSERT INTO `tblMember` VALUES (1,'毛若穎','0921003614','in.consequat@yahoo.com','0oplfZ16tyLX','366 苗栗縣銅鑼鄉民權路31號'),(2,'林芳岑','0988008346','adipiscing.enim.mi@outlook.com','7gB%z9Svg8EW','600 嘉義市東區世賢路24號'),(3,'胡素芝','0922830125','nullam.velit@yahoo.com','JJQF0j%tkx3i','325 桃園市龍潭區淮子埔一路29號'),(4,'童雅婷','0958351743','sed.auctor@hotmail.com','Rv$uGmL&C!%g','540 南投縣南投市三和一路14號'),(5,'賴麗萍','0912587773','sagittis.nullam@google.com','XcZg6Be^cU2y','508 彰化縣和美鎮潭北路15號'),(6,'黃志斌','0960105109','nec.leo.morbi@protonmail.com','aZjy*GvZt@s*','711 臺南市歸仁區崙頂二街11號'),(7,'廖松白','0961749001','sociosqu.ad@yahoo.com','j8tI5!wG88PM','411 臺中市太平區北田路14號'),(8,'徐嘉柏','0928735721','proin.non@protonmail.com','n7UDOe0uspZk','801 高雄市前金區自立二路18號'),(9,'李麗珠','0968169143','arcu.vel.quam@hotmail.com','wlmM33nAD@SR','201 基隆市信義區義四路22號'),(10,'施泓音','0970691667','dui.quis.accumsan@google.com','&@^ODhk0MH&l','622 嘉義縣大林鎮早知31號'),(11,'穆姿赭','09126543982','crowdfounding@gmail.com','#sviR91Ve@','桃園市中壢區中大路300號');
/*!40000 ALTER TABLE `tblMember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblMemberCredential`
--

DROP TABLE IF EXISTS `tblMemberCredential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblMemberCredential` (
  `id_tblMemberCredential` int unsigned NOT NULL AUTO_INCREMENT,
  `HashedUserId_tblMemberCredential` int unsigned DEFAULT NULL,
  `HashedPwdString_tblMemberCredential` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_tblMemberCredential`),
  UNIQUE KEY `id_tblMemberCredential_UNIQUE` (`id_tblMemberCredential`),
  UNIQUE KEY `HashedUserId_tblMemberCredential_UNIQUE` (`HashedUserId_tblMemberCredential`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblMemberCredential`
--

LOCK TABLES `tblMemberCredential` WRITE;
/*!40000 ALTER TABLE `tblMemberCredential` DISABLE KEYS */;
INSERT INTO `tblMemberCredential` VALUES (1,1,'5459ffea690882061cfa56fa9033278370e48de356c700637aad68d14f2ae0ae'),(2,2,'07703ba76ae595a212c8317146fb292fb773f34314a3708a6f3e916bbf6e499c'),(3,3,'1caf7cfa34bdb90fd7a332dfed5a5e0d1a153d6a164234aa98b7ba611b83abe7'),(4,4,'ea8ced964d6826e1eede67dccaea05e543e4bcf84ff06d6af8f7877413a91538'),(5,5,'7a09363a667de652e1666b0810219bb7886036dca13af909cd755c80df946365'),(6,6,'ccd108b762527fcdcdb8c5b6cad6480e9b81a5d92f29e6793d6865b274bc50dc'),(7,7,'a5c5e74448987538a8bffda3518f59e2f3785cf460d4f882a2c563af654fe13f'),(8,8,'1a4c96ddeda1e2bfc16abd7bd6f8a72dc416c10c824747cbe5b1f9cc20671c40'),(9,9,'e9c59dd5748d8c0be520b37658c8da542720916cc6d7ff627ad2ba0e76237bca'),(10,10,'5ad2e13f01b6c6597301b4dd8fa5b2a055c6e4245e84f63344f6bbb5c0f3c802'),(11,11,'d4273a1c226113fd2bbe3bcf72a7dcb9b9d5f3f31c3e51d0e786b4bdd11d08dc');
/*!40000 ALTER TABLE `tblMemberCredential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblProposal`
--

DROP TABLE IF EXISTS `tblProposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblProposal` (
  `id_tblProposal` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned NOT NULL,
  `Title_tblProposal` varchar(120) NOT NULL,
  `Content_tblProposal` longtext,
  `Amount_tblProposal` double unsigned DEFAULT NULL,
  `Goal_tblProposal` double unsigned DEFAULT NULL,
  `Status_tblProposal` int unsigned DEFAULT NULL,
  `ViewedNum_tblProposal` int unsigned DEFAULT NULL,
  `CreateDate_tblProposal` date NOT NULL,
  `DueDate_tblProposal` date DEFAULT NULL,
  `IsDeactivated_tblProposal` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_tblProposal`),
  UNIQUE KEY `id_tblProposal_UNIQUE` (`id_tblProposal`),
  KEY `category_id_fk_idx` (`category_id`),
  CONSTRAINT `category_id_tblProposal_fk` FOREIGN KEY (`category_id`) REFERENCES `tblCategory` (`id_tblCategory`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblProposal`
--

LOCK TABLES `tblProposal` WRITE;
/*!40000 ALTER TABLE `tblProposal` DISABLE KEYS */;
INSERT INTO `tblProposal` VALUES (1,1,'《 247 Catcher 》｜ 最全面的【抓寶 & 打團】輔助道具','大家好！我們是 PhotoFast 銀箭資訊。今年，我們創造出了一款能符合 Pokemon GO 玩家需求的抓寶利器！不只能突破現有的連線一小時限制，更讓您能夠在打團戰或攻道館時輕鬆應戰！',2393696,100000,2,1150,'2022-04-06','2022-07-05',0),(2,6,'【最後 3 天】台灣首發輕機能舒壓軟糖 ? Kimoo 情緒平衡軟糖 ? 日本專利「特濃舒壓ＧＡＢＡ」Ｘ「快樂Ｌ色氨酸」，面對再多鳥事也能有平靜好心情！','喜劇演員的起笑配方！募資前百人實測 → 75.8% 有感回饋：「吃了真的有鬆～」——— 你的心累了嗎？\"Not being O.K. is O.K.\"\" 沒關係，是情緒啊！吃一顆回到內在平靜小宇宙！\"',377200,200000,2,251,'2022-03-23','2022-06-21',0),(3,3,'數感宇宙探索課程｜為國小生打造的生活數學 DIY 影音學習組｜給孩子一堂不一樣的數學課','本課程結合數感實驗室逾 10 年數學教育經驗、史丹佛大學「成長型數學思維」理論。內容針對國小中年級以上的孩子，強調具體、跨域、手作、情境。鼓勵孩子探索思考，讓孩子愛上數學。',3737138,500000,2,641,'2022-05-04','2022-08-02',0),(4,7,'『Organs without body 2014 S/S 服裝秀』','「ORGANS WITHOUT BODY 」為 藝術家「安地羊 Andy Yen」2012創立之服裝品牌。',5050,100000,3,4,'2013-08-21','2013-11-19',1),(5,4,'x5 Project 台灣茶葉禮盒 | 邀請您一起用45款台灣茶重新認識『在地』','本次募資計畫是由茶品牌 Three Leafs Tea 透過45款茶做為與消費者連結的媒介，結合茶與藝術向世界說台灣。以「人、事、物、學、遊」五個層面介紹清晰易懂的台灣在地文化故事。',852482,50000,3,194,'2021-12-12','2022-03-12',1),(6,5,'樂待STAY 桃園水岸店 on Line 募資企劃-我們讓孩子樂呆 父母樂待','',282244,943038,2,63,'2022-05-25','2022-08-23',0),(7,3,'謎路?Way of Puzzle 2022【It\'s All I Have】專輯發?企劃','',45651,400000,2,31,'2022-05-23','2022-08-21',0),(8,2,'邏輯解謎｜密室逃脫桌遊 破解古老的秘密','益智解謎新視野，結合密室逃脫與立體拼圖的概念，打造一個全新的益智桌遊。你可以舒適地在家中享受愉快的動腦時光，將大腦發揮至極限。',0,100000,1,0,'2022-03-22',NULL,0),(9,10,'SIRUI 75mm ?變形鏡頭','還停留在變形鏡頭既沉且大的印象中？還以為變形鏡頭是高昂的貴族鏡頭？不！消費級別的變形鏡頭世界早已誕生——思銳1.33X寬銀幕變形鏡頭！目前，思銳已推出24mm/F2.8、35mm/F1.8、50mm/F1.8三個焦段，其以更小的體積、更高的性價比、更強的電影質感，讓大眾影友真正能無負擔地接觸變形鏡頭。',532600,100000,3,200,'2021-07-20','2021-10-18',1),(10,1,'【 HOMI｜地表最強全情境短袖 & EAM 登山防曬衣 】featuring CORDURA fabric / MIT 設計製造！','ㄧ件夏天的短袖可以有什麼不同？CORDURA 柔軟強韌，非塗層物理涼感，抗UV 前所未有的透氣調節，MIT 質感獨家設計製造 # 針對夏天的穿著環境，更舒適的穿著體驗而衍生出 HOMI 的第一件短袖物件 Movement T shirt，利用材料及設計創造出ㄧ件可以在夏日的不同環境下，隨時給你舒適機能與質感外型的短袖！',1556942,100000,3,3148,'2022-05-24','2022-08-22',1),(11,1,'好睏枕【讓你好好睏】脖子的溫柔靠山，釋放你的壓力與電力｜一夜好眠不是夢','台灣有超過20萬以上的人有睡眠障礙，你是不是也是其中一員？經常睡不好、睡不飽、醒來卻還是滿身疲累，一夜好眠成了一種奢求。...',0,100000,2,0,'2022-06-13','2022-09-11',0);
/*!40000 ALTER TABLE `tblProposal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblProposalMember`
--

DROP TABLE IF EXISTS `tblProposalMember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblProposalMember` (
  `id_tblProposalMember` int unsigned NOT NULL AUTO_INCREMENT,
  `proposal_id` int unsigned NOT NULL,
  `member_id` int unsigned NOT NULL,
  PRIMARY KEY (`id_tblProposalMember`),
  UNIQUE KEY `id_tblProposalMember_UNIQUE` (`id_tblProposalMember`),
  KEY `proposal_id_fk_idx` (`proposal_id`),
  KEY `member_id_fk_idx` (`member_id`),
  CONSTRAINT `member_id_tblProposalMember_fk` FOREIGN KEY (`member_id`) REFERENCES `tblMember` (`id_tblMember`),
  CONSTRAINT `proposal_id_tblProposalMember_fk` FOREIGN KEY (`proposal_id`) REFERENCES `tblProposal` (`id_tblProposal`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblProposalMember`
--

LOCK TABLES `tblProposalMember` WRITE;
/*!40000 ALTER TABLE `tblProposalMember` DISABLE KEYS */;
INSERT INTO `tblProposalMember` VALUES (1,4,8),(2,1,7),(3,2,6),(4,7,3),(5,3,4),(6,11,1),(7,6,4),(8,6,3),(9,5,9),(10,8,2),(11,9,10),(12,10,8);
/*!40000 ALTER TABLE `tblProposalMember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblProposalOption`
--

DROP TABLE IF EXISTS `tblProposalOption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblProposalOption` (
  `id_tblProposalOption` int unsigned NOT NULL,
  `proposal_id` int unsigned NOT NULL,
  `Title_tblProposalOption` varchar(45) NOT NULL,
  `Price_tblProposalOption` double unsigned NOT NULL,
  `Description_tblProposalOption` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_tblProposalOption`),
  UNIQUE KEY `id_tblProposalOption_UNIQUE` (`id_tblProposalOption`),
  UNIQUE KEY `proposal_id_UNIQUE` (`proposal_id`),
  KEY `proposal_id_fk_idx` (`proposal_id`),
  CONSTRAINT `proposal_id_fk` FOREIGN KEY (`proposal_id`) REFERENCES `tblProposal` (`id_tblProposal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblProposalOption`
--

LOCK TABLES `tblProposalOption` WRITE;
/*!40000 ALTER TABLE `tblProposalOption` DISABLE KEYS */;
INSERT INTO `tblProposalOption` VALUES (1,1,'247 早鳥超值組',2290,'內容物包含：247 Catcher x 1 自動點擊器 x 1 usb - C 充電線 x 1 專屬收納包 x 1 247 Catcher 說明書 x 1【重要提醒】台灣本島地區免運費，外島地區收額外運費。全球地區皆可寄，運費於結帳時顯示。若需統編請輸入收件資訊時備註。'),(2,3,'單組 體驗初學',1790,'Ａ數學分析／Ｂ邏輯推演／Ｃ策略規劃：３組擇１ '),(3,9,'【好評追加！超早鳥衣褲組合】',3899,'Movement 全情境短T X1 +  Movement 全情境短褲 X1 +  ▲未來售價：5060，現省1161 '),(4,5,'小資支持 12個月每月茶包禮',800,'【感謝禮】回饋您對我們計畫的支持，我們每個月會寄一包茶葉體驗包 + 電子刊物'),(5,10,'75mm 超級早鳥價格',18800,'75mm F1.8 Anamorphic 1.33X Lens X1 '),(6,8,'【 嘖嘖超早鳥優惠 】 未來售價 $1790｜現省300元',1490,'金字塔、諾克斯碉堡、龍之屋（三選一） ×1 款'),(7,6,'x5 Project 台灣茶葉禮盒 | 邀請您一起用45款台灣茶重新認識『在地』',1888,'想參與STAY最有名的親子活動嗎，此為一大一小體驗邀請，歡迎爸媽帶著你的孩子，或是孩子帶著你最愛的爸媽，參加我們90分鐘的專屬親子派對，和我們一起慶祝STAY桃園水岸店的開幕'),(8,7,'【只想聽歌組】',720,'【謎路人 2022 It\'s All I Have】 概念專輯 1張 '),(9,4,'原畫畫作一件10號',15000,'原畫畫作'),(10,2,'【嘖嘖價】1 入 83 折',690,'Kimoo情緒平衡軟糖 1 盒');
/*!40000 ALTER TABLE `tblProposalOption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblSponsorRecord`
--

DROP TABLE IF EXISTS `tblSponsorRecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblSponsorRecord` (
  `id_tblSponsorRecord` int unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int unsigned NOT NULL,
  `proposal_option_id` int unsigned NOT NULL,
  `Amount_tblSponsorRecord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id_tblSponsorRecord`),
  UNIQUE KEY `id_tblSponsorRecord_UNIQUE` (`id_tblSponsorRecord`),
  KEY `member_id_fk_idx` (`member_id`),
  KEY `proposal_option_id_fk_idx` (`proposal_option_id`),
  CONSTRAINT `member_id_tblSponsorRecord_fk` FOREIGN KEY (`member_id`) REFERENCES `tblMember` (`id_tblMember`),
  CONSTRAINT `proposal_option_id_fk` FOREIGN KEY (`proposal_option_id`) REFERENCES `tblProposalOption` (`id_tblProposalOption`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblSponsorRecord`
--

LOCK TABLES `tblSponsorRecord` WRITE;
/*!40000 ALTER TABLE `tblSponsorRecord` DISABLE KEYS */;
INSERT INTO `tblSponsorRecord` VALUES (1,9,4,800),(2,10,1,2290),(3,3,1,2290),(4,4,4,800),(5,8,9,15000),(6,1,5,18800),(7,2,1,2290),(8,6,10,690),(9,7,1,2290),(10,1,2,1790),(11,2,2,1000),(12,6,5,1200);
/*!40000 ALTER TABLE `tblSponsorRecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_109403009'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_CreateProposal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`109403009`@`192.168.56.1` PROCEDURE `sp_CreateProposal`(
	IN in_member_id int, 
		in_title varchar(120), 
        in_content TEXT, 
        in_goal int, 
        in_category_id int,
	OUT affected_row_num int
)
BEGIN
	ALTER TABLE db_109403009.tblProposal AUTO_INCREMENT = 1;
    ALTER TABLE db_109403009.tblProposalMember AUTO_INCREMENT = 1;

	INSERT INTO tblProposal (category_id, Title_tblProposal, Content_tblProposal, Goal_tblProposal, Amount_tblProposal, Status_tblProposal, ViewedNum_tblProposal,CreateDate_tblProposal, DueDate_tblProposal, IsDeactivated_tblProposal)
	VALUES (in_category_id, in_title, in_content, in_goal, 0, 2, 0, CURDATE(), DATE_ADD(CreateDate_tblProposal, INTERVAL 90 DAY), 0);
    
	INSERT INTO tblProposalMember (member_id)
	VALUES (in_member_id);
    
    UPDATE tblProposalMember
	SET proposal_id=(SELECT id_tblProposal
						FROM tblProposal
						WHERE tblProposal.Title_tblProposal=in_title)
	WHERE id_tblProposalMember = LAST_INSERT_ID() ;
    
	SELECT ROW_COUNT()
    INTO affected_row_num;
    
    select tblProposal.id_tblProposal as proposal_id,
			tblProposal.Title_tblProposal as proposal_title,
            tblProposal.Content_tblProposal as proposal_content,
            tblProposal.Amount_tblProposal as amount,
            tblProposal.Goal_tblProposal as goal,
            tblProposal.Status_tblProposal as status,
            tblProposal.ViewedNum_tblProposal as viewed_num,
            tblProposal.CreateDate_tblProposal as create_date,
            tblProposal.DueDate_tblProposal as due_date,
            tblCategory.CategoryName_tblCategory as category
	from tblProposal
    join tblCategory
    on tblProposal.category_id = tblCategory.id_tblCategory
    ORDER BY tblProposal.id_tblProposal DESC LIMIT 0 , 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_DeleteMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`109403009`@`192.168.56.1` PROCEDURE `sp_DeleteMember`(
	IN in_member_id int,
    OUT affected_row_num int
)
BEGIN
	DELETE FROM tblMember
    WHERE id_tblMember = in_member_id;
    
    DELETE FROM tblMemberCredential
    WHERE id_tblMemberCredential = in_member_id;
    
	SELECT ROW_COUNT()
    INTO affected_row_num;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetFollowedProposalsByMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`109403009`@`192.168.56.1` PROCEDURE `sp_GetFollowedProposalsByMember`(
	IN in_member_id int,
    OUT result_rows INT
)
BEGIN
	
	select tblFollowingRecord.member_id as member_id, 
			Title_tblProposal as proposal_title, 
			Amount_tblProposal as proposal_amount, 
            Goal_tblProposal as proposal_goal
    from tblProposal
	left join tblFollowingRecord 
	on tblProposal.id_tblProposal=tblFollowingRecord.proposal_id
	where tblFollowingRecord.member_id=in_member_id;
    
    select found_rows() 
    into result_rows;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetHistorySponsorByMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`109403009`@`192.168.56.1` PROCEDURE `sp_GetHistorySponsorByMember`(
	IN in_member_id int,
    OUT result_rows int
    )
BEGIN
	SELECT 
		tblSponsorRecord.member_id AS member_id,
		tblProposal.id_tblProposal AS proposal_id,
		tblProposal.Title_tblProposal AS proposal_title,
		tblProposalOption.Title_tblProposalOption AS proposal_option_title,
		tblSponsorRecord.Amount_tblSponsorRecord AS amount,
		tblProposal.Status_tblProposal AS status
    FROM tblSponsorRecord
    JOIN tblProposalOption
    ON tblSponsorRecord.proposal_option_id = tblProposalOption.id_tblProposalOption
    JOIN tblProposal
    ON tblProposalOption.proposal_id = tblProposal.id_tblProposal
    WHERE tblSponsorRecord.Member_id = in_member_id
    ORDER BY tblProposal.id_tblProposal;
    
    SELECT found_rows() 
    INTO result_rows;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetProposalByCompletionRate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`109403009`@`192.168.56.1` PROCEDURE `sp_GetProposalByCompletionRate`(
	IN in_ratio float,
    OUT result int
)
BEGIN
	CREATE TEMPORARY TABLE IF NOT EXISTS ProposalByCompletionRate AS
	(
	   SELECT 
		  id_tblProposal as proposal_id,
			Title_tblProposal as proposal_title,
            Amount_tblProposal as amount,
            Goal_tblProposal as goal,
			Amount_tblProposal / Goal_tblProposal as ratio
	   FROM tblProposal
	);

	select * 
	from ProposalByCompletionRate
    where ratio >= in_ratio
    ORDER BY ratio DESC;
    
	SELECT found_rows() 
    INTO result;
    
    DROP TABLE IF EXISTS ProposalByCompletionRate;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetProposalsByKeyword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`109403009`@`192.168.56.1` PROCEDURE `sp_GetProposalsByKeyword`(
	IN in_keyword varchar(64),
    OUT result_rows int
)
BEGIN
	SELECT id_tblProposal as proposal_id,
			Title_tblProposal as proposal_title,
			DueDate_tblProposal as due_date,
			Amount_tblProposal as amount
	FROM tblProposal
	WHERE Title_tblProposal LIKE Concat('%',in_keyword,'%');

	SELECT found_rows() 
    INTO result_rows;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetRecommendedProposals` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`109403009`@`192.168.56.1` PROCEDURE `sp_GetRecommendedProposals`(
	IN in_member_id int,
    OUT result_rows int
)
BEGIN

	CREATE TEMPORARY TABLE IF NOT EXISTS  MemberWhoSponsorSame AS
	(
		select tblSponsorRecord.member_id as member_id,
				tblSponsorRecord.proposal_option_id as proposal_option_id
		from tblSponsorRecord
		join (select * from tblSponsorRecord
			where member_id=in_member_id) as MemberSponsor
		on tblSponsorRecord.proposal_option_id=MemberSponsor.proposal_option_id
		where tblSponsorRecord.member_id != in_member_id
	);
    
    CREATE TEMPORARY TABLE IF NOT EXISTS  DifferentSponsor_MemberWhoSponsorSame AS
	(
		select tblSponsorRecord.member_id as member_id,
				tblSponsorRecord.proposal_option_id as proposal_option_id
		from MemberWhoSponsorSame
		join tblSponsorRecord
		on MemberWhoSponsorSame.member_id=tblSponsorRecord.member_id
		where MemberWhoSponsorSame.proposal_option_id != tblSponsorRecord.proposal_option_id
	);
    
	CREATE TEMPORARY TABLE IF NOT EXISTS OthersProposalWithStatus2 AS
	(
	   SELECT
			tblProposalMember.member_id as member_id,
			tblProposal.id_tblProposal as proposal_id,
            tblProposal.Title_tblProposal as propoal_title,
            tblProposal.Status_tblProposal as status,
			tblProposal.ViewedNum_tblProposal as viewed_num
	   FROM tblProposal
       join tblProposalMember
       on tblProposal.id_tblProposal = tblProposalMember.proposal_id
       where tblProposal.Status_tblProposal = 2
       and tblProposalMember.member_id != in_member_id
	);
    
	CREATE TEMPORARY TABLE IF NOT EXISTS RecommendedByMember AS
	(
		select OthersProposalWithStatus2.proposal_id,
				OthersProposalWithStatus2.propoal_title,
				OthersProposalWithStatus2.status,
				OthersProposalWithStatus2.viewed_num
		from DifferentSponsor_MemberWhoSponsorSame
		left join tblProposalOption
		on DifferentSponsor_MemberWhoSponsorSame.proposal_option_id = tblProposalOption.id_tblProposalOption
		left join OthersProposalWithStatus2
		on tblProposalOption.proposal_id = OthersProposalWithStatus2.proposal_id
		order by OthersProposalWithStatus2.viewed_num desc
	);
    
    -- Recommended By Member
	select *
    from RecommendedByMember;
    
	CREATE TEMPORARY TABLE IF NOT EXISTS RecommendedByViewedNum AS
	(
		select id_tblProposal as proposal_id,
				Title_tblProposal as propoal_title,
                Status_tblProposal as status,
                ViewedNum_tblProposal as viewed_num
		from tblProposal
		order by ViewedNum_tblProposal desc
		Limit 5
	);
    
    -- Recommended By ViewedNum
	select *
    from RecommendedByViewedNum;

	SELECT found_rows() 
    INTO result_rows;
    
	DROP TABLE IF EXISTS MemberWhoSponsorSame;
    DROP TABLE IF EXISTS DifferentSponsor_MemberWhoSponsorSame;
	DROP TABLE IF EXISTS OthersProposalWithStatus2;
    DROP TABLE IF EXISTS RecommendedByMember;
	DROP TABLE IF EXISTS RecommendedByViewedNum;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetUnrepliedComments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`109403009`@`192.168.56.1` PROCEDURE `sp_GetUnrepliedComments`(
	IN in_member_id int,
    OUT result int
)
BEGIN
	select tblProposalMember.member_id as member_id,
			tblComment.proposal_id as proposal_id,
            tblProposal.Title_tblProposal as proposal_title,
            tblComment.id_tblComment as comment_id,
            tblComment.UserComment_tblcomment as member_comment,
            tblComment.CommentTime_tblComment as comment_time,
            tblComment.ProposerResponse_tblComment as proposer_response
	from tblComment
    left join tblProposal
    on tblComment.proposal_id = tblProposal.id_tblProposal
    join tblProposalMember
    on tblProposal.id_tblProposal = tblProposalMember.proposal_id
    where tblProposalMember.member_id = in_member_id and tblComment.ProposerResponse_tblComment is null;

	SELECT found_rows() 
    INTO result;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`109403009`@`192.168.56.1` PROCEDURE `sp_Login`(
	IN in_email varchar(64), 
		in_hashedpwd varchar(200),
	OUT status_code int
)
BEGIN
	SELECT CASE
      WHEN tblMember.Email_tblMember = in_email and tblMemberCredential.HashedPwdString_tblMemberCredential = in_hashedpwd THEN 1
	  WHEN tblMember.Email_tblMember = in_email and tblMemberCredential.HashedPwdString_tblMemberCredential != in_hashedpwd THEN 2
	END AS Answer
    INTO status_code
	from tblMember
	join tblMemberCredential
	on tblMember.id_tblMember = tblMemberCredential.id_tblMemberCredential
    WHERE tblMember.Email_tblMember = in_email;
        
    select case
		when status_code = 1 then 1
        when status_code = 2 then 2
		else 3
        END AS Login
        INTO status_code;
        
	select status_code as Login;
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_RegisterMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`109403009`@`192.168.56.1` PROCEDURE `sp_RegisterMember`(
	IN in_email varchar(64), 
		in_hashedPwd varchar(200), 
		in_salt char(64), 
		in_name varchar(64), 
		in_address varchar(255), 
		in_phone varchar(64),
	OUT affected_row_num INT
)
BEGIN
	ALTER TABLE db_109403009.tblMember AUTO_INCREMENT = 1;
    ALTER TABLE db_109403009.tblMemberCredential AUTO_INCREMENT = 1;

    INSERT INTO tblMemberCredential (HashedPwdString_tblMemberCredential)
	VALUES (in_hashedPwd); 

	INSERT INTO tblMember (Email_tblMember, Salt_tblMember, Name_tblMember, Address_tblMember, Phone_tblMember) 
    VALUES (in_email, in_salt, in_name, in_address, in_phone);
    
	SELECT ROW_COUNT()
    INTO affected_row_num;
    
    SET SQL_SAFE_UPDATES=0;
    
    UPDATE  tblMemberCredential
	SET     HashedUserId_tblMemberCredential = (select id_tblMember
												from tblMember
                                                where tblMember.Email_tblMember = in_email)
	WHERE HashedPwdString_tblMemberCredential = in_hashedPwd;
    
    SET SQL_SAFE_UPDATES=1;
    
	select tblMember.id_tblMember as member_id, 
			tblMember.Name_tblMember as name, 
            tblMember.Email_tblMember as email,
            tblMemberCredential.HashedPwdString_tblMemberCredential as password ,
            tblMember.Salt_tblMember as salt,
            tblMember.Phone_tblMember as phone,
            tblMember.Address_tblMember as address
    from tblMember
	join tblMemberCredential
	on tblMember.id_tblMember = tblMemberCredential.id_tblMemberCredential    
    ORDER BY member_id DESC LIMIT 0 , 1;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpdateProposalStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`109403009`@`192.168.56.1` PROCEDURE `sp_UpdateProposalStatus`(	
	IN in_proposal_id int,
		in_status int,
    OUT affected_row_num int)
BEGIN
	select case
		when in_status > 0 and in_status < 4 and Status_tblProposal < in_status then in_status
		when in_status > 0 and in_status < 4 and  Status_tblProposal > in_status then Status_tblProposal
		else Status_tblProposal
	END AS Status
	INTO in_status
    from tblProposal
    WHERE id_tblProposal = in_proposal_id;
        
    UPDATE tblProposal
	SET Status_tblProposal = in_status
	WHERE id_tblProposal = in_proposal_id;    
    
    SELECT row_count()
    INTO affected_row_num;
    
    SELECT 
    id_tblProposal AS proposal_id,
    Status_tblProposal AS status
    FROM tblProposal
    WHERE id_tblProposal = in_proposal_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpdatePwd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`109403009`@`192.168.56.1` PROCEDURE `sp_UpdatePwd`(
	IN in_member_id int, 
		in_hashedPwd varchar(200), 
        in_salt char(64),
	OUT affected_row_num INT
)
BEGIN
	UPDATE tblMemberCredential
	SET HashedPwdString_tblMemberCredential = in_hashedPwd
	WHERE id_tblMemberCredential = in_member_id;
    
    SELECT ROW_COUNT()
    INTO affected_row_num;
    
    UPDATE tblMember
	SET Salt_tblMember = in_salt
	WHERE id_tblMember = in_member_id;
    
	select tblMember.id_tblMember as member_id, 
			tblMember.Name_tblMember as name, 
            tblMember.Email_tblMember as email,
            tblMemberCredential.HashedPwdString_tblMemberCredential as password ,
            tblMember.Salt_tblMember as salt,
            tblMember.Phone_tblMember as phone,
            tblMember.Address_tblMember as address
    from tblMember
	join tblMemberCredential
	on tblMember.id_tblMember = tblMemberCredential.id_tblMemberCredential    
    WHERE tblMember.id_tblMember = in_member_id;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-14 13:04:37
