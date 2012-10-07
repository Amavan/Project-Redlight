CALL addLanguage('en_us', 'English');
CALL addLanguage('fa_me', 'Fake language, yo');
SELECT * FROM Languages;

CALL addRegion('head');
CALL addRegion('torso');
SELECT * FROM Region;

CALL addRegionTranslation('en_us', 'head', 'Head', 'The head');
CALL addRegionTranslation('fa_me', 'head', 'Da Head', 'Yo dome');
CALL addRegionTranslation('en_us', 'torso', 'Torso', 'The torso');
CALL addRegionTranslation('fa_me', 'torso', 'Da Torso', 'The chest yo');
SELECT * FROM Region_Translation;

CALL addCategory('headache', 'head');
CALL addCategory('earache', 'head');
CALL addCategory('chestpain', 'torso');
CALL addCategory('arms', 'torso');
SELECT * FROM Symptom_Category;

CALL addCategoryTranslation('en_us', 'headache', 'Headaches', 'Dull aching pains in the head');
CALL addCategoryTranslation('fa_me', 'headache', 'Headaches', 'Aww man, my head be hurtin');
CALL addCategoryTranslation('en_us', 'earache', 'Earaches', 'Aching pains in the ear');
CALL addCategoryTranslation('fa_me', 'earache', 'Earaches', 'Aww man, my ear be hurtin');
CALL addCategoryTranslation('en_us', 'chestpain', 'Chest Pains', 'A variety of pains in the chest');
CALL addCategoryTranslation('fa_me', 'chestpain', 'CP', 'My chest hurts man');
CALL addCategoryTranslation('en_us', 'arms', 'Arms', 'Ailments relating to the arms');
CALL addCategoryTranslation('fa_me', 'arms', 'Arms', 'What be up with my arms?');
SELECT * FROM Category_Translation;

CALL addSymptom('badheadache', 'headache');
CALL addSymptom('badearache', 'earache');
CALL addSymptom('stabbingchestpain', 'chestpain');
CALL addSymptom('brokenarm', 'arms');
SELECT * FROM Symptom;

CALL addSymptomTranslation('en_us', 'badheadache', 'A really bad headache', 'A really bad headache that persists');
CALL addSymptomTranslation('fa_me', 'badheadache', 'My head really hurts', 'It keeps on hurting man');
CALL addSymptomTranslation('en_us', 'badearache', 'A really bad earache', 'A really bad earache that persists');
CALL addSymptomTranslation('fa_me', 'badearache', 'My ear really hurts', 'It keeps on hurting man');
CALL addSymptomTranslation('en_us', 'stabbingchestpain', 'A sharp pain in the chest', 'A sharp, sudden pain in the chest area');
CALL addSymptomTranslation('fa_me', 'stabbingchestpain', 'My chest\'s been stabbed', 'Feels like someone stabbed me man');
CALL addSymptomTranslation('en_us', 'brokenarm', 'A sore arm accompanied by sharp pain', 'Sharp pain in the arm accompanied by a loss of motion');
CALL addSymptomTranslation('fa_me', 'brokenarm', 'My arm is broken man!', 'I can\'t move my arm. It done broke');
SELECT * FROM Symptom_Translation;