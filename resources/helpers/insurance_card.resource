*** Settings ***
Documentation     Resource File to handle the logic for Processing the Insurance Card APIs - Extract_from_Image and Extract_from_Text
Library    RequestsLibrary
Library    OperatingSystem
Library    Collections
Variables    ../../configs/environment.yaml
Library    ./helper_utility.py

*** Variables ***
${ENV_TO_TEST}    LOCAL
${CARD_NAME}    HMSA
	
*** Keywords ***
Validate Key Availability And Get Value From Dictionary
	[ARGUMENTS]    ${ENV_TO_TEST}
	${Value}=    Parse Yaml File    configs/environment.yaml    ${ENV_TO_TEST}
	Return From Keyword    ${Value}

Fetch Subscriber Name And Card Info
	[ARGUMENTS]    ${CARD_NAME}
	${Value}=    Parse Json File    resources/data/details.json    ${CARD_NAME}
	Return From Keyword    ${Value}

Fetch Card Response For Validation
	[ARGUMENTS]    ${CARD_NAME}
	${Value}=    Parse Response Json File    resources/data/response_validator.json    ${CARD_NAME}
	Return From Keyword    ${Value}

Validate Actual Card Response with Expected Card Response
	[ARGUMENTS]    ${EXPECTED_RESPONSE}    ${ACTUAL_RESPONSE}
	Run Keyword And Continue On Failure    Should Be Equal     ${EXPECTED_RESPONSE['BIN']}     ${ACTUAL_RESPONSE['BIN']}    Expected Value and Actual Value doesn't match
	Run Keyword And Continue On Failure    Should Be Equal     ${EXPECTED_RESPONSE['CARD_HOLDER_NAME']}     ${ACTUAL_RESPONSE['CARD_HOLDER_NAME']}    Expected Value and Actual Value doesn't match
	Run Keyword And Continue On Failure    Should Be Equal     ${EXPECTED_RESPONSE['GRP']}     ${ACTUAL_RESPONSE['GRP']}    Expected Value and Actual Value doesn't match
	Run Keyword And Continue On Failure    Should Be Equal     ${EXPECTED_RESPONSE['ID']}     ${ACTUAL_RESPONSE['ID']}    Expected Value and Actual Value doesn't match
	Run Keyword And Continue On Failure    Should Be Equal     ${EXPECTED_RESPONSE['PCN']}     ${ACTUAL_RESPONSE['PCN']}    Expected Value and Actual Value doesn't match
	
Insurance Card - Extract From Image API Validation
	[ARGUMENTS]    ${CARD_NAME}
	${fetched_value}=    Validate Key Availability And Get Value From Dictionary    ${ENV_TO_TEST}
	${card_details_info}=    Fetch Subscriber Name And Card Info    ${CARD_NAME}
	${expected_card_response}=    Fetch Card Response For Validation    ${CARD_NAME}
	
	Create Session	extract_from_image    ${fetched_value}[${ENV_TO_TEST}][SERVER_URL]
	${file}=    Get Binary File    resources/images/${card_details_info}[${CARD_NAME}][CARD_IMAGE_INFO]
	&{data}=	Create Dictionary	subscriber_name=${card_details_info}[${CARD_NAME}][SUBSCRIBER_NAME]
	&{file_data}=	Create Dictionary	card_image=${file}
	${resp}=    Post Request    extract_from_image    ${API_INFO}[EXTRACT_FROM_IMAGE_API]    data=${data}    files=${file_data}
	Should Be Equal As Strings    ${resp.status_code}    200
	#${output}=    To Json    ${resp.content}    pretty_print=True
	${output}=    To Json    ${resp.content}
	#Log    ${output}
	Validate Actual Card Response with Expected Card Response    ${expected_card_response}    ${output}
	Delete All Sessions

Insurance Card - Extract From Image API Validation For Edge Tests
	[ARGUMENTS]    ${CARD_NAME}    ${SUBSCRIBER_NAME}
	${fetched_value}=    Validate Key Availability And Get Value From Dictionary    ${ENV_TO_TEST}
	${card_details_info}=    Fetch Subscriber Name And Card Info    ${CARD_NAME}
	${expected_card_response}=    Fetch Card Response For Validation    ${CARD_NAME}
	
	Create Session	extract_from_image    ${fetched_value}[${ENV_TO_TEST}][SERVER_URL]
	${file}=    Get Binary File    resources/images/${card_details_info}[${CARD_NAME}][CARD_IMAGE_INFO]
	&{data}=	Create Dictionary	subscriber_name=${SUBSCRIBER_NAME}
	&{file_data}=	Create Dictionary	card_image=${file}
	${resp}=    Post Request    extract_from_image    ${API_INFO}[EXTRACT_FROM_IMAGE_API]    data=${data}    files=${file_data}
	Should Be Equal As Strings    ${resp.status_code}    200
	#${output}=    To Json    ${resp.content}    pretty_print=True
	${output}=    To Json    ${resp.content}
	#Log    ${output}
	Validate Actual Card Response with Expected Card Response    ${expected_card_response}    ${output}
	Delete All Sessions

Insurance Card - Extract From Text API Validation
	[ARGUMENTS]    ${CARD_NAME}
	${fetched_value}=    Validate Key Availability And Get Value From Dictionary    ${ENV_TO_TEST}
	${card_details_info}=    Fetch Subscriber Name And Card Info    ${CARD_NAME}
	${expected_card_response}=    Fetch Card Response For Validation    ${CARD_NAME}
	
	Create Session	extract_from_image    ${fetched_value}[${ENV_TO_TEST}][SERVER_URL]
	&{data}=	Create Dictionary	subscriber_name=${card_details_info}[${CARD_NAME}][SUBSCRIBER_NAME]    card_text=${card_details_info}[${CARD_NAME}][CARD_TEXT_INFO]
	${resp}=    Post Request    extract_from_image    ${API_INFO}[EXTRACT_FROM_TEXT_API]    files=${data}    data=${data} 
	Should Be Equal As Strings    ${resp.status_code}    200
	#${output}=    To Json    ${resp.content}    pretty_print=True
	${output}=    To Json    ${resp.content}
	#Log    ${output}
	Validate Actual Card Response with Expected Card Response    ${expected_card_response}    ${output}
	Delete All Sessions

Insurance Card - Extract From Text API Validation For Edge Tests
	[ARGUMENTS]    ${CARD_NAME}    ${SUBSCRIBER_NAME}
	${fetched_value}=    Validate Key Availability And Get Value From Dictionary    ${ENV_TO_TEST}
	${card_details_info}=    Fetch Subscriber Name And Card Info    ${CARD_NAME}
	${expected_card_response}=    Fetch Card Response For Validation    ${CARD_NAME}
	
	Create Session	extract_from_image    ${fetched_value}[${ENV_TO_TEST}][SERVER_URL]
	&{data}=	Create Dictionary	subscriber_name=${SUBSCRIBER_NAME}    card_text=${card_details_info}[${CARD_NAME}][CARD_TEXT_INFO]
	${resp}=    Post Request    extract_from_image    ${API_INFO}[EXTRACT_FROM_TEXT_API]    files=${data}    data=${data} 
	Should Be Equal As Strings    ${resp.status_code}    200
	#${output}=    To Json    ${resp.content}    pretty_print=True
	${output}=    To Json    ${resp.content}
	#Log    ${output}
	Validate Actual Card Response with Expected Card Response    ${expected_card_response}    ${output}
	Delete All Sessions