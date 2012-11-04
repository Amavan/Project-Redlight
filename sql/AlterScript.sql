SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


USE `willifor_redlight`;
DROP procedure IF EXISTS `willifor_redlight`.`getTestimonialsByDate`;

DELIMITER $$
USE `willifor_redlight`$$
CREATE PROCEDURE `willifor_redlight`.`getTestimonialsByDate` (IN langCode VARCHAR(5), IN lowerLimit INT, IN upperLimit INT)
BEGIN	
   DECLARE language_id INT;
   SET @language_id = getLangID(langCode);
   SET @lower_limit = lowerLimit;
   SET @upper_limit = upperLimit;
   
   PREPARE STMT FROM 'SELECT T.TestimonialID AS ID, T.User_Name AS Name, T.Testimonial AS Testimonial, T.Date_Time AS Timestamp, T.Tip_Number AS TipNo, T.Thumbs_Up AS ThumbsUp, T.Thumbs_Down AS ThumbsDown, Location As Location
   FROM Testimonials T WHERE T.LangID = ? ORDER BY T.Date_Time DESC LIMIT ?, ?';
   EXECUTE STMT USING @language_id, @lower_limit, @upper_limit;

END$$

DELIMITER ;

USE `willifor_redlight`;
DROP procedure IF EXISTS `willifor_redlight`.`getTestimonialsByRating`;

DELIMITER $$
USE `willifor_redlight`$$
CREATE PROCEDURE `willifor_redlight`.`getTestimonialsByRating` (IN langCode VARCHAR(5), IN lowerLimit INT, IN upperLimit INT)
BEGIN	
   DECLARE language_id INT;
   SET @language_id = getLangID(langCode);
   SET @lower_limit = lowerLimit;
   SET @upper_limit = upperLimit;

   PREPARE STMT FROM 'SELECT T.TestimonialID AS ID, T.User_Name AS Name, T.Testimonial AS Testimonial, T.Date_Time AS Timestamp, T.Tip_Number AS TipNo, T.Thumbs_Up AS ThumbsUp, T.Thumbs_Down AS ThumbsDown, Location As Location
   FROM Testimonials T WHERE T.LangID = ? ORDER BY T.Thumbs_Up-T.Thumbs_Down DESC LIMIT ?, ?';
   EXECUTE STMT USING @language_id, @lower_limit, @upper_limit;
END$$

DELIMITER ;

USE `willifor_redlight`;
DROP procedure IF EXISTS `willifor_redlight`.`getNTestimonialsByTip`;

DELIMITER $$
USE `willifor_redlight`$$
CREATE PROCEDURE `willifor_redlight`.`getNTestimonialsByTip` (IN langCode VARCHAR(5), IN tipNumber INT, IN lowerLimit INT, IN upperLimit INT)
BEGIN	
   DECLARE language_id INT;
   SET @language_id = getLangID(langCode);
   SET @tip_number = tipNumber;
   SET @lower_limit = lowerLimit;
   SET @upper_limit = upperLimit;

   PREPARE STMT FROM 'SELECT T.TestimonialID AS ID, T.User_Name AS Name, T.Testimonial AS Testimonial, T.Date_Time AS Timestamp, T.Tip_Number AS TipNo, T.Thumbs_Up AS ThumbsUp, T.Thumbs_Down AS ThumbsDown, Location As Location
   FROM Testimonials T WHERE T.LangID = ? AND T.Tip_Number = ? ORDER BY T.Thumbs_Up-T.Thumbs_Down DESC LIMIT ?, ?';
   EXECUTE STMT USING @language_id, @tip_number, @lower_limit, @upper_limit;
END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
