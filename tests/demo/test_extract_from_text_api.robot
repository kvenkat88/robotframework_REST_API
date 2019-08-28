*** Settings ***
Documentation    Test Suite/Test Case Script for interacting with /insurance_card/extract/from_image API
resource    ../../resources/helpers/insurance_card.resource

*** Variables ***
${CARD_NAME}    HMSA

*** Test Cases ***
Post Request and Valid Response for Extract From Insurance Card Text API Validation
	Insurance Card - Extract From Text API Validation    ${CARD_NAME}

