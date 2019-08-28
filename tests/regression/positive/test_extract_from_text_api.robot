*** Settings ***
Documentation    Test Suite/Test Case Script for interacting with /insurance_card/extract/from_Text API
resource    ../../../resources/helpers/insurance_card.resource
Variables    ../../../configs/environment.yaml

*** Test Cases ***
Post Request and Valid Response for Extract From Insurance Card Text API Validation
	FOR    ${index}    ${CARD_PROVIDER_NAME}    IN ENUMERATE    @{CARD_PROVIDER_INFO}
        Insurance Card - Extract From Text API Validation    ${CARD_PROVIDER_NAME}
	END

Extract From Insurance Card Text API Validation - With One Character Missing In Subscriber's Last Name
	Insurance Card - Extract From Text API Validation For Edge Tests    HMSA    KIMO M ALOH
	
Extract From Insurance Card Text API Validation - With Character Missing In Subscriber's MIDDLE Name
	Insurance Card - Extract From Text API Validation For Edge Tests    HMSA    KIMO ALOHA

Extract From Insurance Card Text API Validation - With Subscriber's First Name Missing
	Insurance Card - Extract From Text API Validation For Edge Tests    HMSA    M ALOHA

Extract From Insurance Card Text API Validation - With only Subscriber's First Name
	Insurance Card - Extract From Text API Validation For Edge Tests    HMSA    KIMO

Extract From Insurance Card Text API Validation - With only Subscriber's Last Name
	Insurance Card - Extract From Text API Validation For Edge Tests    HMSA    ALOHA

Extract From Insurance Card Text API Validation - With Subscriber's Last Name Missing
	Insurance Card - Extract From Text API Validation For Edge Tests    HMSA    KIMO M

Extract From Insurance Card Text API Validation - With More than One Characters Missing In Subscriber's Name - Combination1
	Insurance Card - Extract From Text API Validation For Edge Tests    HMSA    KIO M ALOA

Extract From Insurance Card Text API Validation - With More than One Characters Missing In Subscriber's Name - Combination2
	Insurance Card - Extract From Text API Validation For Edge Tests    HMSA    KIMO M AL

Extract From Insurance Card Text API Validation - With More than One Characters Missing In Subscriber's Name - Combination1
	Insurance Card - Extract From Text API Validation For Edge Tests    HMSA    K M ALOHA