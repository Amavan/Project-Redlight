SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Table `willifor_redlight`.`Languages`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `willifor_redlight`.`Languages` ;

CREATE  TABLE IF NOT EXISTS `willifor_redlight`.`Languages` (
  `LangID` INT NOT NULL AUTO_INCREMENT ,
  `LangCode` VARCHAR(5) NOT NULL ,
  `DisplayName` VARCHAR(45) NULL ,
  PRIMARY KEY (`LangID`) ,
  UNIQUE INDEX `LangID_UNIQUE` (`LangID` ASC) ,
  UNIQUE INDEX `LangCode_UNIQUE` (`LangCode` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `willifor_redlight`.`Region`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `willifor_redlight`.`Region` ;

CREATE  TABLE IF NOT EXISTS `willifor_redlight`.`Region` (
  `RegionID` INT NOT NULL AUTO_INCREMENT ,
  `WorkingName` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`RegionID`) ,
  UNIQUE INDEX `WorkingName_UNIQUE` (`WorkingName` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `willifor_redlight`.`Symptom_Category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `willifor_redlight`.`Symptom_Category` ;

CREATE  TABLE IF NOT EXISTS `willifor_redlight`.`Symptom_Category` (
  `CategoryID` INT NOT NULL AUTO_INCREMENT ,
  `RegionID` INT NOT NULL ,
  `WorkingName` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`CategoryID`, `RegionID`) ,
  UNIQUE INDEX `WorkingName_UNIQUE` (`WorkingName` ASC) ,
  CONSTRAINT `fk_Symptom_Category_Body_Region`
    FOREIGN KEY (`RegionID` )
    REFERENCES `willifor_redlight`.`Region` (`RegionID` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `willifor_redlight`.`Symptom`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `willifor_redlight`.`Symptom` ;

CREATE  TABLE IF NOT EXISTS `willifor_redlight`.`Symptom` (
  `SymptomID` INT NOT NULL ,
  `CategoryID` INT NOT NULL ,
  PRIMARY KEY (`SymptomID`, `CategoryID`) ,
  INDEX `fk_Symptom_Symptom_Category1_idx` (`CategoryID` ASC) ,
  CONSTRAINT `fk_Symptom_Symptom_Category1`
    FOREIGN KEY (`CategoryID` )
    REFERENCES `willifor_redlight`.`Symptom_Category` (`CategoryID` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `willifor_redlight`.`Symptom_Translation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `willifor_redlight`.`Symptom_Translation` ;

CREATE  TABLE IF NOT EXISTS `willifor_redlight`.`Symptom_Translation` (
  `LangID` INT NOT NULL ,
  `SymptomID` INT NOT NULL ,
  `ShortDesc` VARCHAR(100) NULL ,
  `LongDesc` TEXT NULL ,
  PRIMARY KEY (`LangID`, `SymptomID`) ,
  INDEX `fk_Symptom_Translation_Languages1_idx` (`LangID` ASC) ,
  INDEX `fk_Symptom_Translation_Symptom1_idx` (`SymptomID` ASC) ,
  CONSTRAINT `fk_Symptom_Translation_Languages1`
    FOREIGN KEY (`LangID` )
    REFERENCES `willifor_redlight`.`Languages` (`LangID` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Symptom_Translation_Symptom1`
    FOREIGN KEY (`SymptomID` )
    REFERENCES `willifor_redlight`.`Symptom` (`SymptomID` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `willifor_redlight`.`Region_Translation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `willifor_redlight`.`Region_Translation` ;

CREATE  TABLE IF NOT EXISTS `willifor_redlight`.`Region_Translation` (
  `LangID` INT NOT NULL ,
  `RegionID` INT NOT NULL ,
  `DisplayName` VARCHAR(45) NULL ,
  `Description` VARCHAR(45) NULL ,
  PRIMARY KEY (`LangID`, `RegionID`) ,
  INDEX `fk_Region_Translation_Body_Region1_idx` (`RegionID` ASC) ,
  CONSTRAINT `fk_Region_Translation_Languages1`
    FOREIGN KEY (`LangID` )
    REFERENCES `willifor_redlight`.`Languages` (`LangID` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Region_Translation_Body_Region1`
    FOREIGN KEY (`RegionID` )
    REFERENCES `willifor_redlight`.`Region` (`RegionID` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `willifor_redlight`.`Category_Translation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `willifor_redlight`.`Category_Translation` ;

CREATE  TABLE IF NOT EXISTS `willifor_redlight`.`Category_Translation` (
  `LangID` INT NOT NULL ,
  `CategoryID` INT NOT NULL ,
  `DisplayName` VARCHAR(45) NULL ,
  `Description` VARCHAR(45) NULL ,
  PRIMARY KEY (`LangID`, `CategoryID`) ,
  INDEX `fk_Category_Translation_Symptom_Category1_idx` (`CategoryID` ASC) ,
  CONSTRAINT `fk_Category_Translation_Languages1`
    FOREIGN KEY (`LangID` )
    REFERENCES `willifor_redlight`.`Languages` (`LangID` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Category_Translation_Symptom_Category1`
    FOREIGN KEY (`CategoryID` )
    REFERENCES `willifor_redlight`.`Symptom_Category` (`CategoryID` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `willifor_redlight`.`Testimonials`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `willifor_redlight`.`Testimonials` ;

CREATE  TABLE IF NOT EXISTS `willifor_redlight`.`Testimonials` (
  `TestimonialID` INT NOT NULL AUTO_INCREMENT ,
  `LangID` INT NOT NULL ,
  `User_Name` VARCHAR(100) NOT NULL ,
  `Testimonial` TEXT NOT NULL ,
  `Email_Address` VARCHAR(100) NULL ,
  `Date_Time` TIMESTAMP NOT NULL ,
  `Tip_Number` INT NULL ,
  `Thumbs_Up` INT NOT NULL DEFAULT 0 ,
  `Thumbs_Down` INT NOT NULL DEFAULT 0 ,
  `Location` VARCHAR(255) NULL ,
  PRIMARY KEY (`TestimonialID`, `LangID`) ,
  INDEX `fk_Testimonials_Languages1_idx` (`LangID` ASC) ,
  CONSTRAINT `fk_Testimonials_Languages1`
    FOREIGN KEY (`LangID` )
    REFERENCES `willifor_redlight`.`Languages` (`LangID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- procedure addRegion
-- -----------------------------------------------------

USE `willifor_redlight`;
DROP procedure IF EXISTS `willifor_redlight`.`addRegion`;

DELIMITER $$
USE `willifor_redlight`$$
CREATE PROCEDURE `willifor_redlight`.`addRegion` (IN regionName varchar(25))
BEGIN
	INSERT INTO Region (WorkingName) VALUES (regionName);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure addCategory
-- -----------------------------------------------------

USE `willifor_redlight`;
DROP procedure IF EXISTS `willifor_redlight`.`addCategory`;

DELIMITER $$
USE `willifor_redlight`$$
CREATE PROCEDURE `willifor_redlight`.`addCategory` (IN catName varchar(25), IN regionName varchar(25))
BEGIN
	DECLARE region_id INT;
	SELECT RegionID INTO region_id FROM Region R WHERE R.WorkingName = regionName;

	INSERT INTO Symptom_Category (RegionID, WorkingName) VALUES (region_id, catName);	
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure addSymptom
-- -----------------------------------------------------

USE `willifor_redlight`;
DROP procedure IF EXISTS `willifor_redlight`.`addSymptom`;

DELIMITER $$
USE `willifor_redlight`$$
CREATE PROCEDURE `willifor_redlight`.`addSymptom` (IN sympName varchar(25), IN catName varchar(25))
BEGIN
	DECLARE category_id INT;
	SELECT CategoryID INTO category_id FROM Symptom_Category WHERE WorkingName = catName;
	
	INSERT INTO Symptom (CategoryID, WorkingName) VALUES (category_id, sympName);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure addRegionTranslation
-- -----------------------------------------------------

USE `willifor_redlight`;
DROP procedure IF EXISTS `willifor_redlight`.`addRegionTranslation`;

DELIMITER $$
USE `willifor_redlight`$$
CREATE PROCEDURE `willifor_redlight`.`addRegionTranslation` (IN langCode varchar(5), IN regionName varchar(25), IN translatedName varchar(25), IN translatedDescription varchar(45))
BEGIN
	DECLARE language_id, region_id INT;
	SET language_id = getLangID(langCode);
	SELECT RegionID INTO region_id FROM Region WHERE WorkingName = regionName;

	INSERT INTO Region_Translation VALUES (language_id, region_id, translatedName, translatedDescription);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure addSymptomTranslation
-- -----------------------------------------------------

USE `willifor_redlight`;
DROP procedure IF EXISTS `willifor_redlight`.`addSymptomTranslation`;

DELIMITER $$
USE `willifor_redlight`$$
CREATE PROCEDURE `willifor_redlight`.`addSymptomTranslation` (IN langCode varchar(5), IN sympName varchar(25), IN translatedShortDesc varchar(100), IN translatedLongDesc varchar(250))
BEGIN
	DECLARE language_id, symptom_id INT;
	SET language_id = getLangID(langCode);
	SELECT SymptomID INTO symptom_id FROM Symptom S WHERE S.WorkingName = sympName;

	INSERT INTO Symptom_Translation VALUES (language_id, symptom_id, translatedShortDesc, translatedLongDesc);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure addCategoryTranslation
-- -----------------------------------------------------

USE `willifor_redlight`;
DROP procedure IF EXISTS `willifor_redlight`.`addCategoryTranslation`;

DELIMITER $$
USE `willifor_redlight`$$
CREATE PROCEDURE `willifor_redlight`.`addCategoryTranslation` (IN langCode varchar(5), IN catName varchar(25), IN translatedName varchar(25), IN translatedDescription varchar(45))
BEGIN
	DECLARE language_id, cat_id INT;
	SET language_id = getLangID(langCode);
	SELECT CategoryID INTO cat_id FROM Symptom_Category S WHERE S.WorkingName = catName;

	INSERT INTO Category_Translation VALUES (language_id, cat_id, translatedName, translatedDescription);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getRegion
-- -----------------------------------------------------

USE `willifor_redlight`;
DROP procedure IF EXISTS `willifor_redlight`.`getRegion`;

DELIMITER $$
USE `willifor_redlight`$$
CREATE PROCEDURE `willifor_redlight`.`getRegion` (IN langCode varchar(5), IN regionName varchar(25))
BEGIN
	DECLARE language_id INT;
	SET language_id = getLangID(langCode);
	
	SELECT RL.DisplayName, RL.Description FROM Region R
		INNER JOIN Region_Translation RL ON R.RegionID = RL.RegionID AND RL.LangID = language_id
	WHERE R.WorkingName = regionName;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function getLangID
-- -----------------------------------------------------

USE `willifor_redlight`;
DROP function IF EXISTS `willifor_redlight`.`getLangID`;

DELIMITER $$
USE `willifor_redlight`$$
CREATE FUNCTION `willifor_redlight`.`getLangID`(langCode varchar(5))
RETURNS INT
BEGIN
	DECLARE id INT;
	SELECT LangID INTO id FROM Languages L WHERE L.LangCode = langCode AND L.LangCode IS NOT NULL;
	RETURN id;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getAllRegions
-- -----------------------------------------------------

USE `willifor_redlight`;
DROP procedure IF EXISTS `willifor_redlight`.`getAllRegions`;

DELIMITER $$
USE `willifor_redlight`$$
CREATE PROCEDURE `willifor_redlight`.`getAllRegions` (IN langCode varchar(5))
BEGIN
	DECLARE language_id INT;
	SET language_id = getLangID(langCode);

	SELECT RL.DisplayName, RL.Description FROM Region R
		INNER JOIN Region_Translation RL ON R.RegionID = RL.RegionID AND RL.LangID = language_id;
		
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getCategory
-- -----------------------------------------------------

USE `willifor_redlight`;
DROP procedure IF EXISTS `willifor_redlight`.`getCategory`;

DELIMITER $$
USE `willifor_redlight`$$
CREATE PROCEDURE `willifor_redlight`.`getCategory` (IN langCode varchar(5), IN catName varchar(25))
BEGIN
	DECLARE language_id INT;
	SET language_id = getLangID(langCode);

	SELECT CL.DisplayName, CL.Description FROM Symptom_Category C
		INNER JOIN Category_Translation CL ON C.CategoryID = CL.CategoryID AND CL.LangID = language_id
		WHERE C.WorkingName = catName;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getCategoriesByRegion
-- -----------------------------------------------------

USE `willifor_redlight`;
DROP procedure IF EXISTS `willifor_redlight`.`getCategoriesByRegion`;

DELIMITER $$
USE `willifor_redlight`$$
CREATE PROCEDURE `willifor_redlight`.`getCategoriesByRegion` (IN langCode varchar(5), IN regionName varchar(25))
BEGIN
	DECLARE language_id INT;
	SET language_id = getLangID(langCode);

	SELECT CL.DisplayName, CL.Description FROM Region R
		INNER JOIN Symptom_Category C ON C.RegionID = R.RegionID
		INNER JOIN Category_Translation CL ON CL.CategoryID = C.CategoryID AND CL.LangID = language_id
	WHERE R.WorkingName = regionName;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getAllCategories
-- -----------------------------------------------------

USE `willifor_redlight`;
DROP procedure IF EXISTS `willifor_redlight`.`getAllCategories`;

DELIMITER $$
USE `willifor_redlight`$$
CREATE PROCEDURE `willifor_redlight`.`getAllCategories` (IN langCode varchar(5))
BEGIN
	DECLARE language_id INT;
	SET language_id = getLangID(langCode);

	SELECT CL.DisplayName, CL.Description, RL.DisplayName AS Region FROM Region R
		INNER JOIN Symptom_Category C ON C.RegionID = R.RegionID
		INNER JOIN Category_Translation CL ON C.CategoryID = CL.CategoryID AND CL.LangID = language_id
		INNER JOIN Region_Translation RL ON R.RegionID = RL.RegionID AND RL.LangID = language_id;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getSymptom
-- -----------------------------------------------------

USE `willifor_redlight`;
DROP procedure IF EXISTS `willifor_redlight`.`getSymptom`;

DELIMITER $$
USE `willifor_redlight`$$
CREATE PROCEDURE `willifor_redlight`.`getSymptom` (IN langCode varchar(5), IN sympName varchar(25))
BEGIN
	DECLARE language_id INT;
	SET language_id = getLangID(langCode);

	SELECT SL.ShortDesc, SL.LongDesc from Symptom S
		INNER JOIN Symptom_Translation SL ON S.SymptomID = SL.SymptomID AND SL.LangID = language_id
	WHERE S.WorkingName = sympName;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getSymptomsByRegion
-- -----------------------------------------------------

USE `willifor_redlight`;
DROP procedure IF EXISTS `willifor_redlight`.`getSymptomsByRegion`;

DELIMITER $$
USE `willifor_redlight`$$
CREATE PROCEDURE `willifor_redlight`.`getSymptomsByRegion` (IN langCode varchar(5), IN regionName varchar(25))
BEGIN
	DECLARE language_id INT;
	SET language_id = getLangID(langCode);

	SELECT SL.ShortDesc, SL.LongDesc FROM Region R
		INNER JOIN Symptom_Category C ON R.RegionID = C.RegionID
		INNER JOIN Symptom S ON S.CategoryID = C.CategoryID
		INNER JOIN Symptom_Translation SL ON S.SymptomID = SL.SymptomID AND SL.LangID = language_ID
	WHERE R.WorkingName = regionName;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getSymptomsByCategory
-- -----------------------------------------------------

USE `willifor_redlight`;
DROP procedure IF EXISTS `willifor_redlight`.`getSymptomsByCategory`;

DELIMITER $$
USE `willifor_redlight`$$
CREATE PROCEDURE `willifor_redlight`.`getSymptomsByCategory` (IN langCode varchar(5), IN catName varchar(25))
BEGIN
	DECLARE language_id INT;
	SET language_id = getLangID(langCode);

	SELECT SL.ShortDesc, SL.LongDesc FROM Symptom_Category C
		INNER JOIN Symptom S ON S.CategoryID = C.CategoryID
		INNER JOIN Symptom_Translation SL ON S.SymptomID = SL.SymptomID AND SL.LangID = language_id
	WHERE C.WorkingName = catName;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getAllSymptoms
-- -----------------------------------------------------

USE `willifor_redlight`;
DROP procedure IF EXISTS `willifor_redlight`.`getAllSymptoms`;

DELIMITER $$
USE `willifor_redlight`$$
CREATE PROCEDURE `willifor_redlight`.`getAllSymptoms` (IN langCode varchar(5))
BEGIN
	DECLARE language_id INT;
	SET language_id = getLangID(langCode);

	SELECT SL.ShortDesc, SL.LongDesc, CL.DisplayName AS Category, RL.DisplayName AS Region FROM Symptom S
		INNER JOIN Symptom_Translation SL ON S.SymptomID = SL.SymptomID AND SL.LangID = language_id
		INNER JOIN Symptom_Category C ON C.CategoryID = S.CategoryID
		INNER JOIN Category_Translation CL ON C.CategoryID = CL.CategoryID AND CL.LangID = language_id
		INNER JOIN Region R ON R.RegionID = C.RegionID
		INNER JOIN Region_Translation RL ON R.RegionID = RL.RegionID AND RL.LangID = language_id;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure addLanguage
-- -----------------------------------------------------

USE `willifor_redlight`;
DROP procedure IF EXISTS `willifor_redlight`.`addLanguage`;

DELIMITER $$
USE `willifor_redlight`$$
CREATE PROCEDURE `willifor_redlight`.`addLanguage` (IN langCode varchar(5), IN langName varchar(45))
BEGIN
	INSERT INTO Languages (LangCode, DisplayName) VALUES (langCode, langName);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getTestimonialsByDate
-- -----------------------------------------------------

USE `willifor_redlight`;
DROP procedure IF EXISTS `willifor_redlight`.`getTestimonialsByDate`;

DELIMITER $$
USE `willifor_redlight`$$
CREATE PROCEDURE `willifor_redlight`.`getTestimonialsByDate` (IN langCode VARCHAR(5))
BEGIN	
   DECLARE language_id INT;
   SET language_id = getLangID(langCode);
   
   SELECT T.TestimonialID AS ID, T.User_Name AS Name, T.Testimonial AS Testimonial, T.Date_Time AS 'Timestamp', T.Tip_Number AS TipNo, T.Thumbs_Up AS ThumbsUp, T.Thumbs_Down AS ThumbsDown, Location As Location
   FROM Testimonials T WHERE T.LangID = language_id ORDER BY T.Date_Time DESC;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getTestimonialsByRating
-- -----------------------------------------------------

USE `willifor_redlight`;
DROP procedure IF EXISTS `willifor_redlight`.`getTestimonialsByRating`;

DELIMITER $$
USE `willifor_redlight`$$
CREATE PROCEDURE `willifor_redlight`.`getTestimonialsByRating` (IN langCode VARCHAR(5))
BEGIN	
   DECLARE language_id INT;
   SET language_id = getLangID(langCode);
   
   SELECT T.TestimonialID AS ID, T.User_Name AS Name, T.Testimonial AS Testimonial, T.Date_Time AS 'Timestamp', T.Tip_Number AS TipNo, T.Thumbs_Up AS ThumbsUp, T.Thumbs_Down AS ThumbsDown, Location As Location
   FROM Testimonials T WHERE T.LangID = language_id ORDER BY T.Thumbs_Up-T.Thumbs_Down DESC;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getTestimonialsByTip
-- -----------------------------------------------------

USE `willifor_redlight`;
DROP procedure IF EXISTS `willifor_redlight`.`getTestimonialsByTip`;

DELIMITER $$
USE `willifor_redlight`$$
CREATE PROCEDURE `willifor_redlight`.`getTestimonialsByTip` (IN langCode VARCHAR(5), IN tipNumber INT)
BEGIN	
   DECLARE language_id INT;
   SET language_id = getLangID(langCode);
   
   SELECT T.TestimonialID AS ID, T.User_Name AS Name, T.Testimonial AS Testimonial, T.Date_Time AS 'Timestamp', T.Tip_Number AS TipNo, T.Thumbs_Up AS ThumbsUp, T.Thumbs_Down AS ThumbsDown, Location As Location
   FROM Testimonials T WHERE T.LangID = language_id AND T.Tip_Number = tipNumber ORDER BY T.Thumbs_Up-T.Thumbs_Down DESC;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getNTestimonialsByTip
-- -----------------------------------------------------

USE `willifor_redlight`;
DROP procedure IF EXISTS `willifor_redlight`.`getNTestimonialsByTip`;

DELIMITER $$
USE `willifor_redlight`$$
CREATE PROCEDURE `willifor_redlight`.`getNTestimonialsByTip` (IN langCode VARCHAR(5), IN tipNumber INT, IN rowLimit INT)
BEGIN	
   DECLARE language_id INT;
   SET @language_id = getLangID(langCode);
   SET @tip_number = tipNumber;
   SET @row_limit = rowLimit;

   PREPARE STMT FROM 'SELECT T.TestimonialID AS ID, T.User_Name AS Name, T.Testimonial AS Testimonial, T.Date_Time AS Timestamp, T.Tip_Number AS TipNo, T.Thumbs_Up AS ThumbsUp, T.Thumbs_Down AS ThumbsDown, Location As Location
   FROM Testimonials T WHERE T.LangID = ? AND T.Tip_Number = ? ORDER BY T.Thumbs_Up-T.Thumbs_Down DESC LIMIT ?';
   EXECUTE STMT USING @language_id, @tip_number, @row_limit;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure insertTestimonial
-- -----------------------------------------------------

USE `willifor_redlight`;
DROP procedure IF EXISTS `willifor_redlight`.`insertTestimonial`;

DELIMITER $$
USE `willifor_redlight`$$

CREATE PROCEDURE `willifor_redlight`.`insertTestimonial` (IN langCode Varchar(5), IN userName Varchar(100), IN testimonial TEXT, IN emailAddress Varchar(100), IN tipNumber INT, IN location VARCHAR(255))
BEGIN
	DECLARE language_id INT;
	SET language_id = getLangID(langCode);
	INSERT INTO Testimonials (LangID, User_Name, Testimonial, Email_Address, Tip_Number, Date_Time, Location) VALUES (language_id, userName, testimonial, emailAddress, tipNumber, CURRENT_TIMESTAMP(), location);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure thumbsUpTestimonial
-- -----------------------------------------------------

USE `willifor_redlight`;
DROP procedure IF EXISTS `willifor_redlight`.`thumbsUpTestimonial`;

DELIMITER $$
USE `willifor_redlight`$$

CREATE PROCEDURE `willifor_redlight`.`thumbsUpTestimonial` (IN testimonialID INT)

BEGIN
	UPDATE Testimonials T
	SET T.Thumbs_Up = T.Thumbs_Up + 1, T.Date_Time = T.Date_Time
	WHERE T.TestimonialID = testimonialID;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure thumbsDownTestimonial
-- -----------------------------------------------------

USE `willifor_redlight`;
DROP procedure IF EXISTS `willifor_redlight`.`thumbsDownTestimonial`;

DELIMITER $$
USE `willifor_redlight`$$

CREATE PROCEDURE `willifor_redlight`.`thumbsDownTestimonial` (IN testimonialID INT)

BEGIN
	UPDATE Testimonials T
	SET T.Thumbs_Down = T.Thumbs_Down + 1, T.Date_Time = T.Date_Time
	WHERE T.TestimonialID = testimonialID;
END$$

DELIMITER ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
