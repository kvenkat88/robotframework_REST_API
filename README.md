#### Framework Overview
 1.  Framework is developed to test REST APIs available. 
 2. This framework uses two of the most common framework available in python called Robot Framework and robotframework-requests(to test RESTFul APIs).

#### Requested Libraries for this framework
 1. robotframework(latest version)
 2. robotframework-requests(latest version)
 3. PyYAML>=5.1.2
 4. requests(latest version)

#### Testing Types Covered
 1. Regression
 2. Smoke
 3. Misc(This is generic test case to test one card at a time using command line arguments)
 
#### Points to Remember
 1. Include or remove any environment or test related artifacts info in configs/environment.yaml.
 2. Whenever if there is any card available for test, add the card name under "CARD_PROVIDER_INFO" dict in configs/environment.yaml file.
 3. Add the expected response for Card Response validation in the resources/data/response_validator.json file. Info available in this is the source of truth for card response validation.
 4. Always add the respective card information like SUBSCRIBER_NAME,CARD_IMAGE_INFO(either in jpg/JPG/png or any other format supported by our API) and CARD_TEXT_INFO(for proving input
    to text API) under the resources/data/details.json file. This file is referred to provide the request data on while making the API request calls during runtime.
 5. Add the card images under the resources/images directory. The card file name available in this directory would be mentioned in resources/data/details.json file.
 6. Card name provider under "CARD_PROVIDER_INFO" dict in configs/environment.yaml file should be aligned/matched with the keys created in both resources/data/response_validator.json and resources/data/details.json file.
 7. If any python utility function needs to be added, then add it under resources/helpers/helper_utility.py.
 8. If there is any Robot Framework based utility file/keywords file/resources file have to be added, then add it under the resources/helpers/insurance_card.resource.
 9. HTML Reports for Smoke and Regression tests are available under reports directory.This framework have well structured HTML report file for detailed test cases coverage.
 10. Mention the tests under tests/.* directory for creating the regression and smoke tests.
 11. In this framework, card name is the keyword for executing the tests. In regression card name would be automatically passed in the runtime.
 12. This framework also have the capability to pass the configuration/environment variables/card name variables in the command line also.  
        
#### Robot Framework CLI(Command Line Interface) Commands For Test Execution
   
  ##### Smoke Tests Bulk Execution Command
     
		robot --name Smoke_Test_API --timestampoutputs -d reports/smoke ./tests/smoke

  ##### Regression Tests Bulk Execution Command
     
		robot --name Regression_Test_API --timestampoutputs -d reports/regression ./tests/regression

  ##### Regression Tests Bulk Execution Command - Only Specific folder(Positive or Negative Tests)
     
		robot --name Regression_Test_API --timestampoutputs -d reports/regression ./tests/regression/positve
		
		robot --name Regression_Test_API --timestampoutputs -d reports/regression ./tests/regression/negative
		
  ##### Demo Tests Execution Command
     
		robot --name Demo_Test_API --variable CARD_NAME:<card_name_available_in_environment.yaml> --timestampoutputs -d reports/demo ./tests/demo
		
		Where ENV_TO_TEST value is LOCAL,API_GATEWAY,etc
		
  ##### Demo Tests Execution Command with Server and Card Name passed in CommandLine Arguments
     
		robot --name Demo_Test_API --variable ENV_TO_TEST:<ENV_key_name_available_in_environment.yaml> --variable CARD_NAME:<card_name_available_in_environment.yaml> --timestampoutputs -d reports/demo ./tests/demo
		
		Where ENV_TO_TEST value is LOCAL,API_GATEWAY,etc
		Where CARD_NAME value is HM2SA,CDS,etc
				
  ##### Smoke Tests Bulk Execution Command with Configurable Environment Info
     
		robot --name Smoke_Test_API --variable ENV_TO_TEST:<ENV_key_name_available_in_environment.yaml> --timestampoutputs -d reports/smoke ./tests/smoke
		
		Where ENV_TO_TEST value is LOCAL,API_GATEWAY,etc
		
  ##### Regression Tests Bulk Execution Command with Configurable Environment Info
     
		robot --name Regression_Test_API --variable ENV_TO_TEST:<ENV_key_name_available_in_environment.yaml> --timestampoutputs -d reports/regression ./tests/regression
        
		Where ENV_TO_TEST value is LOCAL,API_GATEWAY,etc

  ##### Execute tests by specifying test_name from tests*.robot file(Only for specific test inside the script file)
     
		robot --name Smoke_Test_API --timestampoutputs -d reports/smoke -t "Post Request and Valid Response for Extract From Insurance Card Image API Validation" ./tests/regression/positive/test_extract_from_image_api.robot
		
#### TODO
1. Any new card arrived, have to add it.

#### Important Links Referred

 1. https://github.com/andrei-pavel/robot-framework-boilerplate
 2. https://github.com/ThomasJaspers/robotframework-webproject-template
 3. https://medium.com/tieto-developers/robot-framework-101-fb12d1d6954c
 4. https://github.com/robotframework/robotframework/blob/master/atest/testdata/standard_libraries/builtin
 5. https://stackoverflow.com/questions/34667980/get-a-key-from-a-dictionary-safely-in-robot-framework




