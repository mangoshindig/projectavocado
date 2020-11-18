CREATE DATABASE  IF NOT EXISTS `workflowconfig` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `workflowconfig`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: workflowconfig
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `AccountID` int NOT NULL AUTO_INCREMENT,
  `Code` varchar(45) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `IsActive` tinyint DEFAULT NULL,
  `CreatedBy` varchar(255) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `LastModifiedBy` varchar(255) DEFAULT NULL,
  `LastModifiedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`AccountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `action`
--

DROP TABLE IF EXISTS `action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `action` (
  `ActionID` int NOT NULL AUTO_INCREMENT,
  `AccountID` int DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `CreatedBy` varchar(255) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `LastModifiedBy` varchar(255) DEFAULT NULL,
  `LastModifiedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`ActionID`),
  KEY `FK_Action_AccountID_idx` (`AccountID`),
  CONSTRAINT `FK_Action_AccountID` FOREIGN KEY (`AccountID`) REFERENCES `account` (`AccountID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `component`
--

DROP TABLE IF EXISTS `component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `component` (
  `ComponentID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Reference` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ComponentID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `field`
--

DROP TABLE IF EXISTS `field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `field` (
  `FieldID` int NOT NULL AUTO_INCREMENT,
  `AccountID` int DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Reference` varchar(255) DEFAULT NULL,
  `FieldTypeID` int DEFAULT NULL,
  `CreatedBy` varchar(255) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `LastModifiedBy` varchar(255) DEFAULT NULL,
  `LastModifiedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`FieldID`),
  KEY `FK_Field_FieldTypeID_idx` (`FieldTypeID`),
  KEY `FK_Field_AccountID_idx` (`AccountID`),
  CONSTRAINT `FK_Field_AccountID` FOREIGN KEY (`AccountID`) REFERENCES `account` (`AccountID`),
  CONSTRAINT `FK_Field_FieldTypeID` FOREIGN KEY (`FieldTypeID`) REFERENCES `fieldtype` (`FieldTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldtype`
--

DROP TABLE IF EXISTS `fieldtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldtype` (
  `FieldTypeID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `ComponentID` int DEFAULT NULL,
  `CreatedBy` varchar(255) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `LastModifiedBy` varchar(255) DEFAULT NULL,
  `LastModifiedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`FieldTypeID`),
  KEY `FK_FieldType_ComponentID_idx` (`ComponentID`),
  CONSTRAINT `FK_FieldType_ComponentID` FOREIGN KEY (`ComponentID`) REFERENCES `component` (`ComponentID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `ProjectID` int NOT NULL AUTO_INCREMENT,
  `AccountID` int DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Code` varchar(45) DEFAULT NULL,
  `CreatedBy` varchar(255) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `LastModifiedBy` varchar(255) DEFAULT NULL,
  `LastModifiedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`ProjectID`),
  KEY `FK_Project_AccountID_idx` (`AccountID`),
  CONSTRAINT `FK_Project_AccountID` FOREIGN KEY (`AccountID`) REFERENCES `account` (`AccountID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectfield`
--

DROP TABLE IF EXISTS `projectfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectfield` (
  `ProjectFieldID` int NOT NULL AUTO_INCREMENT,
  `ProjectID` int DEFAULT NULL,
  `FieldID` int DEFAULT NULL,
  `AccountID` int DEFAULT NULL,
  `IsActive` tinyint DEFAULT NULL,
  `CreatedBy` varchar(255) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `LastModifiedBy` varchar(255) DEFAULT NULL,
  `LastModifiedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`ProjectFieldID`),
  KEY `FK_ProjectField_FieldID_idx` (`FieldID`),
  KEY `FK_ProjectField_ProjectID_idx` (`ProjectID`),
  KEY `FK_ProjectField_AccountID_idx` (`AccountID`),
  CONSTRAINT `FK_ProjectField_AccountID` FOREIGN KEY (`AccountID`) REFERENCES `account` (`AccountID`),
  CONSTRAINT `FK_ProjectField_FieldID` FOREIGN KEY (`FieldID`) REFERENCES `field` (`FieldID`),
  CONSTRAINT `FK_ProjectField_ProjectID` FOREIGN KEY (`ProjectID`) REFERENCES `project` (`ProjectID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `StatusID` int NOT NULL AUTO_INCREMENT,
  `AccountID` int DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `IsActive` tinyint DEFAULT NULL,
  `CreatedBy` varchar(255) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `LastModifiedBy` varchar(255) DEFAULT NULL,
  `LastModifiedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`StatusID`),
  KEY `FK_Status_AccountID_idx` (`AccountID`),
  CONSTRAINT `FK_Status_AccountID` FOREIGN KEY (`AccountID`) REFERENCES `account` (`AccountID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transition`
--

DROP TABLE IF EXISTS `transition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transition` (
  `TransitionID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `ProjectID` int DEFAULT NULL,
  `AccountID` int DEFAULT NULL,
  `InboundStatusID` int DEFAULT NULL,
  `OutboundStatusID` int DEFAULT NULL,
  `IsActive` tinyint DEFAULT NULL,
  `OrderID` int DEFAULT NULL,
  `CreatedBy` varchar(255) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `LastModifiedBy` varchar(255) DEFAULT NULL,
  `LastModifiedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`TransitionID`),
  KEY `FK_Transition_InboundStatusID_idx` (`InboundStatusID`),
  KEY `FK_Transition_OutboundStatusID_idx` (`OutboundStatusID`),
  KEY `FK_Transition_ProjectID_idx` (`ProjectID`),
  KEY `FK_Transition_AccountID_idx` (`AccountID`),
  CONSTRAINT `FK_Transition_AccountID` FOREIGN KEY (`AccountID`) REFERENCES `account` (`AccountID`),
  CONSTRAINT `FK_Transition_InboundStatusID` FOREIGN KEY (`InboundStatusID`) REFERENCES `status` (`StatusID`),
  CONSTRAINT `FK_Transition_OutboundStatusID` FOREIGN KEY (`OutboundStatusID`) REFERENCES `status` (`StatusID`),
  CONSTRAINT `FK_Transition_ProjectID` FOREIGN KEY (`ProjectID`) REFERENCES `project` (`ProjectID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transitionaction`
--

DROP TABLE IF EXISTS `transitionaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transitionaction` (
  `TransitionActionID` int NOT NULL AUTO_INCREMENT,
  `TransitionID` int DEFAULT NULL,
  `ActionID` int DEFAULT NULL,
  `IsActive` tinyint DEFAULT NULL,
  `CreatedBy` varchar(255) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `LastModifiedBy` varchar(255) DEFAULT NULL,
  `LastModifiedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`TransitionActionID`),
  KEY `FK_TransitionAction_ActionID_idx` (`ActionID`),
  KEY `FK_TransitionAction_TransitionID_idx` (`TransitionID`),
  CONSTRAINT `FK_TransitionAction_ActionID` FOREIGN KEY (`ActionID`) REFERENCES `action` (`ActionID`),
  CONSTRAINT `FK_TransitionAction_TransitionID` FOREIGN KEY (`TransitionID`) REFERENCES `transition` (`TransitionID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transitionfield`
--

DROP TABLE IF EXISTS `transitionfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transitionfield` (
  `TransitionFieldID` int NOT NULL AUTO_INCREMENT,
  `TransitionID` int DEFAULT NULL,
  `FieldID` int DEFAULT NULL,
  `OrderID` int DEFAULT NULL,
  `IsActive` tinyint DEFAULT NULL,
  `CreatedBy` varchar(255) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `LastModifiedBy` varchar(255) DEFAULT NULL,
  `LastModifiedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`TransitionFieldID`),
  KEY `FK_TransitionField_FieldID_idx` (`FieldID`),
  KEY `FK_TransitionField_TransitionID_idx` (`TransitionID`),
  CONSTRAINT `FK_TransitionField_FieldID` FOREIGN KEY (`FieldID`) REFERENCES `field` (`FieldID`),
  CONSTRAINT `FK_TransitionField_TransitionID` FOREIGN KEY (`TransitionID`) REFERENCES `transition` (`TransitionID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'workflowconfig'
--
/*!50003 DROP FUNCTION IF EXISTS `getActionWrappedJson` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getActionWrappedJson`(`name` varchar(255)
) RETURNS json
    READS SQL DATA
BEGIN
RETURN 
    
    JSON_OBJECT('name', `name`)
	
    
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getDateWrappedJson` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getDateWrappedJson`(`IsCreated` tinyint, `by` varchar(255), `when` datetime) RETURNS json
    READS SQL DATA
BEGIN
RETURN JSON_OBJECT(CASE WHEN `IsCreated` = 1 THEN 'created' ELSE 'updated' END, 
JSON_MERGE(JSON_OBJECT('by',`by`),JSON_OBJECT('when', `when`)));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getFieldWrappedJson` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getFieldWrappedJson`(`name` varchar(255), `reference` varchar(255), 
`type` varchar(255), createdBy varchar(255), createdDate datetime, modifiedBy varchar(255), modifiedDate datetime, orderId int) RETURNS json
    READS SQL DATA
BEGIN
RETURN CASE WHEN orderId IS NULL THEN JSON_MERGE(JSON_OBJECT('name', `name`), 
	JSON_OBJECT('reference',`reference`),
    JSON_OBJECT('type',`type`),
    getDateWrappedJson(1,createdBy,createdDate),
    getDateWrappedJson(0,modifiedBy,modifiedDate)
    )
    ELSE
    JSON_MERGE(JSON_OBJECT('name', `name`), 
	JSON_OBJECT('reference',`reference`),
    JSON_OBJECT('type',`type`),
    JSON_OBJECT('orderId',`orderId`),
    getDateWrappedJson(1,createdBy,createdDate),
    getDateWrappedJson(0,modifiedBy,modifiedDate))
    END
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getTransitionWrappedJson` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getTransitionWrappedJson`(`name` varchar(255), `inboundStatus` varchar(255),
`outboundStatus` varchar(255), orderId int, actions json, `fields` json,createdBy varchar(255), createdDate datetime, 
modifiedBy varchar(255), modifiedDate datetime
) RETURNS json
    READS SQL DATA
BEGIN
RETURN 
    
    JSON_MERGE(JSON_OBJECT('name', `name`), 
	JSON_OBJECT('inboundStatus',`inboundStatus`),
    JSON_OBJECT('outboundStatus',`outboundStatus`),
    JSON_OBJECT('orderId',`orderId`),
    actions, `fields`,
    getDateWrappedJson(1,createdBy,createdDate),
    getDateWrappedJson(0,modifiedBy,modifiedDate))
    
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getprojects` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getprojects`(projectcode_IN varchar(255), accountid_IN int)
BEGIN

SET SESSION group_concat_max_len = 1000000;

/*HANDLE NULLS / BLANK DATA!!*/
SELECT JSON_OBJECT('projects', CAST(
CONCAT('[',GROUP_CONCAT(jsonString),']') AS json) ) AS projectJson
FROM (
SELECT DISTINCT p.ProjectID, JSON_MERGE_PRESERVE(JSON_OBJECT('name',p.`Name`),
	JSON_OBJECT('code',p.`Code`) ,
    getDateWrappedJson(1, p.`CreatedBy`,p.`CreatedDate`),
    getDateWrappedJson(0, p.`LastModifiedBy`,p.`LastModifiedDate`),
    JSON_OBJECT('fields',
		CAST(CONCAT('[',
		GROUP_CONCAT(getFieldWrappedJson(f.`name`, f.`reference`, ft.`Name`, f.createdBy, 
		f.createdDate, f.lastModifiedBy, f.lastModifiedDate,null)),']') AS JSON)
		),
        JSON_OBJECT('transitions', CAST(CONCAT('[',
		GROUP_CONCAT(DISTINCT getTransitionWrappedJson(t.`name`,s_in.`name`,s_out.`name`,t.orderId, 
        td.TransitionActions,
        td.TransitionFields,
        t.createdBy,
        t.createdDate, t.lastModifiedBy, t.lastModifiedDate))
        ,']') AS JSON))
    ) AS jsonString
FROM project p 
	LEFT JOIN projectfield pf ON pf.ProjectID = p.ProjectID
	LEFT JOIN field f ON f.FieldID = pf.FieldID 
    LEFT JOIN fieldtype ft ON ft.FieldTypeID = f.FieldTypeID
    LEFT JOIN transition t ON t.ProjectID = p.ProjectID
    LEFT JOIN `status` s_in ON s_in.StatusID = t.InboundStatusID
    LEFT JOIN `status` s_out ON s_out.StatusID = t.OutboundStatusID
    LEFT JOIN (
		SELECT t.TransitionID, JSON_OBJECT('actions',CAST(CONCAT('[',GROUP_CONCAT(DISTINCT getActionWrappedJson(a.`name`)),']') AS JSON)) AS TransitionActions,
	JSON_OBJECT('fields',CAST(CONCAT('[',GROUP_CONCAT(DISTINCT getFieldWrappedJson(fit.`name`, fit.`reference`, 
			ftt.`Name`, fit.createdBy, 
			fit.createdDate, fit.lastModifiedBy, fit.lastModifiedDate,null)),']') AS JSON)) AS TransitionFields
	FROM transition t 
		LEFT JOIN transitionaction ta ON ta.TransitionID = t.TransitionID
		LEFT JOIN transitionfield tf ON tf.TransitionID = t.TransitionID
		LEFT JOIN `action` a ON a.ActionID = ta.ActionID
		LEFT JOIN field fit ON fit.FieldID = tf.FieldID
		LEFT JOIN fieldtype ftt ON ftt.FieldTypeID = fit.FieldTypeID
		GROUP BY t.TransitionID ) AS td ON td.TransitionID = t.TransitionID
WHERE p.Code = projectcode_IN OR IFNULL(projectcode_IN, '') = '' 
	AND p.AccountID = accountid_IN
GROUP BY p.ProjectID, t.TransitionID) a;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `gettransitions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `gettransitions`(projectcode_IN varchar(255), transitionuuid_IN varchar(255), accountid_IN int)
BEGIN
SET SESSION group_concat_max_len = 1000000;

SELECT JSON_OBJECT('transitions', CAST(
CONCAT('[',GROUP_CONCAT(jsonString),']') AS json) ) AS transitionJson
FROM (
SELECT  DISTINCT CAST(
CONCAT('[',
		GROUP_CONCAT(DISTINCT getTransitionWrappedJson(t.`name`,s_in.`name`,s_out.`name`,t.orderId, 
        td.TransitionActions,
        td.TransitionFields,
        t.createdBy,
        t.createdDate, t.lastModifiedBy, t.lastModifiedDate))
        ,']')
       AS JSON) 
     AS jsonString
FROM transition t
    LEFT JOIN `status` s_in ON s_in.StatusID = t.InboundStatusID
    LEFT JOIN `status` s_out ON s_out.StatusID = t.OutboundStatusID
    LEFT JOIN (
		SELECT t.TransitionID, JSON_OBJECT('actions',CAST(CONCAT('[',GROUP_CONCAT(DISTINCT getActionWrappedJson(a.`name`)),']') AS JSON)) AS TransitionActions,
	JSON_OBJECT('fields',CAST(CONCAT('[',GROUP_CONCAT(DISTINCT getFieldWrappedJson(fit.`name`, fit.`reference`, 
			ftt.`Name`, fit.createdBy, 
			fit.createdDate, fit.lastModifiedBy, fit.lastModifiedDate,null)),']') AS JSON)) AS TransitionFields
	FROM transition t 
		LEFT JOIN transitionaction ta ON ta.TransitionID = t.TransitionID
		LEFT JOIN transitionfield tf ON tf.TransitionID = t.TransitionID
		LEFT JOIN `action` a ON a.ActionID = ta.ActionID
		LEFT JOIN field fit ON fit.FieldID = tf.FieldID
		LEFT JOIN fieldtype ftt ON ftt.FieldTypeID = fit.FieldTypeID
		GROUP BY t.TransitionID ) AS td ON td.TransitionID = t.TransitionID
	LEFT JOIN project p ON p.ProjectID = t.ProjectID
	WHERE (p.Code = projectcode_IN OR IFNULL(projectcode_IN, '') = '') 
		##AND (t.UUID = transitionuuid_IN OR IFNULL(transitionuuid_IN, '') = '') blocked by AVO-21
        AND p.AccountID = accountid_IN
	GROUP BY t.TransitionID ) a;
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

-- Dump completed on 2020-11-18 17:44:06
