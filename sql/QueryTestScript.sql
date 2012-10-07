CALL getAllRegions('en_us');
CALL getRegion('en_us', 'head');

CALL getAllCategories('en_us');
CALL getCategoriesByRegion('en_us', 'head');
CALL getCategory('en_us', 'headache');

CALL getAllSymptoms('en_us');
CALL getSymptomsByRegion('en_us', 'head');
CALL getSymptomByCategory('en_us', 'headache');
CALL getSymptom('en_us', 'brokenarm');
