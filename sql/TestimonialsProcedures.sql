-- -----------------------------------------------------
-- procedure insertTestimonial
-- -----------------------------------------------------

USE `wdab_redlight_warning_sig_91512`;
DROP procedure IF EXISTS `wdab_redlight_warning_sig_91512`.`insertTestimonial`;

DELIMITER $$
USE `wdab_redlight_warning_sig_91512`$$
CREATE PROCEDURE `wdab_redlight_warning_sig_91512`.`insertTestimonial` (IN langCode Varchar(5), userName Varchar(100), testimonial TEXT, emailAddress Varchar(100), tipNumber INT)
BEGIN
	DECLARE language_id INT;
	SET language_id = getLangID(langCode);
	INSERT INTO Testimonials (LangID, User_Name, Testimonial, Email_Address, Date_Time, Tip_Number) VALUES (language_id, userName, testimonial, emailAddress, tipNumber);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure thumbsUpTestimonial
-- -----------------------------------------------------

USE `wdab_redlight_warning_sig_91512`;
DROP procedure IF EXISTS `wdab_redlight_warning_sig_91512`.`thumbsUpTestimonial`;

DELIMETER $$
USE `wdab_redlight_warning_sig_91512`$$
CREATE PROCEDURE `wdab_redlight_warning_sig_91512`.`thumbsUpTestimonial` (IN testimonialID INT)

BEGIN
	UPDATE Testimonial
	SET Thumbs_Up = Thumbs_Up + 1
	WHERE TestimonialID = testimonialID;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure thumbsDownTestimonial
-- -----------------------------------------------------

USE `wdab_redlight_warning_sig_91512`;
DROP procedure IF EXISTS `wdab_redlight_warning_sig_91512`.`thumbsDownTestimonial`;

DELIMETER $$
USE `wdab_redlight_warning_sig_91512`$$
CREATE PROCEDURE `wdab_redlight_warning_sig_91512`.`thumbsDownTestimonial` (IN testimonialID INT)

BEGIN
	UPDATE Testimonial
	SET Thumbs_Down = Thumbs_Down + 1
	WHERE TestimonialID = testimonialID;
END$$

DELIMITER ;