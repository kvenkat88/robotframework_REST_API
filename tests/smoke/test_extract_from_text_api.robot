*** Settings ***
Documentation    Test Suite/Test Case Script for interacting with /insurance_card/extract/from_image API
resource    ../../resources/helpers/insurance_card.resource
Variables    ../../configs/environment.yaml

*** Test Cases ***
Post Request and Valid Response for Extract From Insurance Card Text API Validation
    Insurance Card - Extract From Text API Validation    HMSA
    Insurance Card - Extract From Text API Validation    PREMIER_HEALTH
