SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `wdab_redlight_warning_sig_91512` ;
CREATE SCHEMA IF NOT EXISTS `wdab_redlight_warning_sig_91512` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `wdab_redlight_warning_sig_91512` ;

-- -----------------------------------------------------
-- Table `wdab_redlight_warning_sig_91512`.`Languages`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wdab_redlight_warning_sig_91512`.`Languages` ;

CREATE  TABLE IF NOT EXISTS `wdab_redlight_warning_sig_91512`.`Languages` (
  `LangID` INT NOT NULL AUTO_INCREMENT ,
  `LangCode` VARCHAR(5) NOT NULL ,
  `DisplayName` VARCHAR(45) NULL ,
  PRIMARY KEY (`LangID`) ,
  UNIQUE INDEX `LangID_UNIQUE` (`LangID` ASC) ,
  UNIQUE INDEX `LangCode_UNIQUE` (`LangCode` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wdab_redlight_warning_sig_91512`.`Region`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wdab_redlight_warning_sig_91512`.`Region` ;

CREATE  TABLE IF NOT EXISTS `wdab_redlight_warning_sig_91512`.`Region` (
  `RegionID` INT NOT NULL AUTO_INCREMENT ,
  `WorkingName` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`RegionID`) ,
  UNIQUE INDEX `WorkingName_UNIQUE` (`WorkingName` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wdab_redlight_warning_sig_91512`.`Symptom_Category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wdab_redlight_warning_sig_91512`.`Symptom_Category` ;

CREATE  TABLE IF NOT EXISTS `wdab_redlight_warning_sig_91512`.`Symptom_Category` (
  `CategoryID` INT NOT NULL AUTO_INCREMENT ,
  `RegionID` INT NOT NULL ,
  `WorkingName` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`CategoryID`, `RegionID`) ,
  UNIQUE INDEX `WorkingName_UNIQUE` (`WorkingName` ASC) ,
  CONSTRAINT `fk_Symptom_Category_Body_Region`
    FOREIGN KEY (`RegionID` )
    REFERENCES `wdab_redlight_warning_sig_91512`.`Region` (`RegionID` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wdab_redlight_warning_sig_91512`.`Symptom`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wdab_redlight_warning_sig_91512`.`Symptom` ;

CREATE  TABLE IF NOT EXISTS `wdab_redlight_warning_sig_91512`.`Symptom` (
  `SymptomID` INT NOT NULL ,
  `CategoryID` INT NOT NULL ,
  PRIMARY KEY (`SymptomID`, `CategoryID`) ,
  INDEX `fk_Symptom_Symptom_Category1_idx` (`CategoryID` ASC) ,
  CONSTRAINT `fk_Symptom_Symptom_Category1`
    FOREIGN KEY (`CategoryID` )
    REFERENCES `wdab_redlight_warning_sig_91512`.`Symptom_Category` (`CategoryID` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wdab_redlight_warning_sig_91512`.`Symptom_Translation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wdab_redlight_warning_sig_91512`.`Symptom_Translation` ;

CREATE  TABLE IF NOT EXISTS `wdab_redlight_warning_sig_91512`.`Symptom_Translation` (
  `LangID` INT NOT NULL ,
  `SymptomID` INT NOT NULL ,
  `ShortDesc` VARCHAR(100) NULL ,
  `LongDesc` TEXT NULL ,
  PRIMARY KEY (`LangID`, `SymptomID`) ,
  INDEX `fk_Symptom_Translation_Languages1_idx` (`LangID` ASC) ,
  INDEX `fk_Symptom_Translation_Symptom1_idx` (`SymptomID` ASC) ,
  CONSTRAINT `fk_Symptom_Translation_Languages1`
    FOREIGN KEY (`LangID` )
    REFERENCES `wdab_redlight_warning_sig_91512`.`Languages` (`LangID` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Symptom_Translation_Symptom1`
    FOREIGN KEY (`SymptomID` )
    REFERENCES `wdab_redlight_warning_sig_91512`.`Symptom` (`SymptomID` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wdab_redlight_warning_sig_91512`.`Region_Translation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wdab_redlight_warning_sig_91512`.`Region_Translation` ;

CREATE  TABLE IF NOT EXISTS `wdab_redlight_warning_sig_91512`.`Region_Translation` (
  `LangID` INT NOT NULL ,
  `RegionID` INT NOT NULL ,
  `DisplayName` VARCHAR(45) NULL ,
  `Description` VARCHAR(45) NULL ,
  PRIMARY KEY (`LangID`, `RegionID`) ,
  INDEX `fk_Region_Translation_Body_Region1_idx` (`RegionID` ASC) ,
  CONSTRAINT `fk_Region_Translation_Languages1`
    FOREIGN KEY (`LangID` )
    REFERENCES `wdab_redlight_warning_sig_91512`.`Languages` (`LangID` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Region_Translation_Body_Region1`
    FOREIGN KEY (`RegionID` )
    REFERENCES `wdab_redlight_warning_sig_91512`.`Region` (`RegionID` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wdab_redlight_warning_sig_91512`.`Category_Translation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wdab_redlight_warning_sig_91512`.`Category_Translation` ;

CREATE  TABLE IF NOT EXISTS `wdab_redlight_warning_sig_91512`.`Category_Translation` (
  `LangID` INT NOT NULL ,
  `CategoryID` INT NOT NULL ,
  `DisplayName` VARCHAR(45) NULL ,
  `Description` VARCHAR(45) NULL ,
  PRIMARY KEY (`LangID`, `CategoryID`) ,
  INDEX `fk_Category_Translation_Symptom_Category1_idx` (`CategoryID` ASC) ,
  CONSTRAINT `fk_Category_Translation_Languages1`
    FOREIGN KEY (`LangID` )
    REFERENCES `wdab_redlight_warning_sig_91512`.`Languages` (`LangID` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Category_Translation_Symptom_Category1`
    FOREIGN KEY (`CategoryID` )
    REFERENCES `wdab_redlight_warning_sig_91512`.`Symptom_Category` (`CategoryID` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wdab_redlight_warning_sig_91512`.`Testimonials`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wdab_redlight_warning_sig_91512`.`Testimonials` ;

CREATE  TABLE IF NOT EXISTS `wdab_redlight_warning_sig_91512`.`Testimonials` (
  `TestimonialID` INT NOT NULL AUTO_INCREMENT ,
  `LangID` INT NOT NULL ,
  `User_Name` VARCHAR(100) NOT NULL ,
  `Testimonial` TEXT NOT NULL ,
  `Email_Address` VARCHAR(100) NULL ,
  `Date_Time` DATETIME NOT NULL ,
  `Tip_Number` INT NULL ,
  `Thumbs_Up` INT NOT NULL DEFAULT 0 ,
  `Thumbs_Down` INT NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`TestimonialID`, `LangID`) ,
  INDEX `fk_Testimonials_Languages1_idx` (`LangID` ASC) ,
  CONSTRAINT `fk_Testimonials_Languages1`
    FOREIGN KEY (`LangID` )
    REFERENCES `wdab_redlight_warning_sig_91512`.`Languages` (`LangID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- procedure addRegion
-- -----------------------------------------------------

USE `wdab_redlight_warning_sig_91512`;
DROP procedure IF EXISTS `wdab_redlight_warning_sig_91512`.`addRegion`;

DELIMITER $$
USE `wdab_redlight_warning_sig_91512`$$
CREATE PROCEDURE `wdab_redlight_warning_sig_91512`.`addRegion` (IN regionName varchar(25))
BEGIN
	INSERT INTO Region (WorkingName) VALUES (regionName);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure addCategory
-- -----------------------------------------------------

USE `wdab_redlight_warning_sig_91512`;
DROP procedure IF EXISTS `wdab_redlight_warning_sig_91512`.`addCategory`;

DELIMITER $$
USE `wdab_redlight_warning_sig_91512`$$
CREATE PROCEDURE `wdab_redlight_warning_sig_91512`.`addCategory` (IN catName varchar(25), IN regionName varchar(25))
BEGIN
	DECLARE region_id INT;
	SELECT RegionID INTO region_id FROM Region R WHERE R.WorkingName = regionName;

	INSERT INTO Symptom_Category (RegionID, WorkingName) VALUES (region_id, catName);	
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure addSymptom
-- -----------------------------------------------------

USE `wdab_redlight_warning_sig_91512`;
DROP procedure IF EXISTS `wdab_redlight_warning_sig_91512`.`addSymptom`;

DELIMITER $$
USE `wdab_redlight_warning_sig_91512`$$
CREATE PROCEDURE `wdab_redlight_warning_sig_91512`.`addSymptom` (IN sympName varchar(25), IN catName varchar(25))
BEGIN
	DECLARE category_id INT;
	SELECT CategoryID INTO category_id FROM Symptom_Category WHERE WorkingName = catName;
	
	INSERT INTO Symptom (CategoryID, WorkingName) VALUES (category_id, sympName);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure addRegionTranslation
-- -----------------------------------------------------

USE `wdab_redlight_warning_sig_91512`;
DROP procedure IF EXISTS `wdab_redlight_warning_sig_91512`.`addRegionTranslation`;

DELIMITER $$
USE `wdab_redlight_warning_sig_91512`$$
CREATE PROCEDURE `wdab_redlight_warning_sig_91512`.`addRegionTranslation` (IN langCode varchar(5), IN regionName varchar(25), IN translatedName varchar(25), IN translatedDescription varchar(45))
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

USE `wdab_redlight_warning_sig_91512`;
DROP procedure IF EXISTS `wdab_redlight_warning_sig_91512`.`addSymptomTranslation`;

DELIMITER $$
USE `wdab_redlight_warning_sig_91512`$$
CREATE PROCEDURE `wdab_redlight_warning_sig_91512`.`addSymptomTranslation` (IN langCode varchar(5), IN sympName varchar(25), IN translatedShortDesc varchar(100), IN translatedLongDesc varchar(250))
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

USE `wdab_redlight_warning_sig_91512`;
DROP procedure IF EXISTS `wdab_redlight_warning_sig_91512`.`addCategoryTranslation`;

DELIMITER $$
USE `wdab_redlight_warning_sig_91512`$$
CREATE PROCEDURE `wdab_redlight_warning_sig_91512`.`addCategoryTranslation` (IN langCode varchar(5), IN catName varchar(25), IN translatedName varchar(25), IN translatedDescription varchar(45))
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

USE `wdab_redlight_warning_sig_91512`;
DROP procedure IF EXISTS `wdab_redlight_warning_sig_91512`.`getRegion`;

DELIMITER $$
USE `wdab_redlight_warning_sig_91512`$$
CREATE PROCEDURE `wdab_redlight_warning_sig_91512`.`getRegion` (IN langCode varchar(5), IN regionName varchar(25))
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

USE `wdab_redlight_warning_sig_91512`;
DROP function IF EXISTS `wdab_redlight_warning_sig_91512`.`getLangID`;

DELIMITER $$
USE `wdab_redlight_warning_sig_91512`$$
CREATE FUNCTION `wdab_redlight_warning_sig_91512`.`getLangID`(langCode varchar(5))
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

USE `wdab_redlight_warning_sig_91512`;
DROP procedure IF EXISTS `wdab_redlight_warning_sig_91512`.`getAllRegions`;

DELIMITER $$
USE `wdab_redlight_warning_sig_91512`$$
CREATE PROCEDURE `wdab_redlight_warning_sig_91512`.`getAllRegions` (IN langCode varchar(5))
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

USE `wdab_redlight_warning_sig_91512`;
DROP procedure IF EXISTS `wdab_redlight_warning_sig_91512`.`getCategory`;

DELIMITER $$
USE `wdab_redlight_warning_sig_91512`$$
CREATE PROCEDURE `wdab_redlight_warning_sig_91512`.`getCategory` (IN langCode varchar(5), IN catName varchar(25))
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

USE `wdab_redlight_warning_sig_91512`;
DROP procedure IF EXISTS `wdab_redlight_warning_sig_91512`.`getCategoriesByRegion`;

DELIMITER $$
USE `wdab_redlight_warning_sig_91512`$$
CREATE PROCEDURE `wdab_redlight_warning_sig_91512`.`getCategoriesByRegion` (IN langCode varchar(5), IN regionName varchar(25))
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

USE `wdab_redlight_warning_sig_91512`;
DROP procedure IF EXISTS `wdab_redlight_warning_sig_91512`.`getAllCategories`;

DELIMITER $$
USE `wdab_redlight_warning_sig_91512`$$
CREATE PROCEDURE `wdab_redlight_warning_sig_91512`.`getAllCategories` (IN langCode varchar(5))
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

USE `wdab_redlight_warning_sig_91512`;
DROP procedure IF EXISTS `wdab_redlight_warning_sig_91512`.`getSymptom`;

DELIMITER $$
USE `wdab_redlight_warning_sig_91512`$$
CREATE PROCEDURE `wdab_redlight_warning_sig_91512`.`getSymptom` (IN langCode varchar(5), IN sympName varchar(25))
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

USE `wdab_redlight_warning_sig_91512`;
DROP procedure IF EXISTS `wdab_redlight_warning_sig_91512`.`getSymptomsByRegion`;

DELIMITER $$
USE `wdab_redlight_warning_sig_91512`$$
CREATE PROCEDURE `wdab_redlight_warning_sig_91512`.`getSymptomsByRegion` (IN langCode varchar(5), IN regionName varchar(25))
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

USE `wdab_redlight_warning_sig_91512`;
DROP procedure IF EXISTS `wdab_redlight_warning_sig_91512`.`getSymptomsByCategory`;

DELIMITER $$
USE `wdab_redlight_warning_sig_91512`$$
CREATE PROCEDURE `wdab_redlight_warning_sig_91512`.`getSymptomsByCategory` (IN langCode varchar(5), IN catName varchar(25))
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

USE `wdab_redlight_warning_sig_91512`;
DROP procedure IF EXISTS `wdab_redlight_warning_sig_91512`.`getAllSymptoms`;

DELIMITER $$
USE `wdab_redlight_warning_sig_91512`$$
CREATE PROCEDURE `wdab_redlight_warning_sig_91512`.`getAllSymptoms` (IN langCode varchar(5))
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

USE `wdab_redlight_warning_sig_91512`;
DROP procedure IF EXISTS `wdab_redlight_warning_sig_91512`.`addLanguage`;

DELIMITER $$
USE `wdab_redlight_warning_sig_91512`$$
CREATE PROCEDURE `wdab_redlight_warning_sig_91512`.`addLanguage` (IN langCode varchar(5), IN langName varchar(45))
BEGIN
	INSERT INTO Languages (LangCode, DisplayName) VALUES (langCode, langName);
END$$

DELIMITER ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
