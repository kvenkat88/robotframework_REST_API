import yaml
import json

def parse_yaml_file(file_name,key):
    """
        Utility function to parse the yaml file to fetch the config options

        Args:
            file_name (file object): yaml file for loading the data
            key (String): For fetching the details
                        
        Returns:
            Return the loaded yaml file or with necessary data parsed
    """
    yaml_file = None
    req = None
    with open(file_name, 'r') as stream:
        try:
            yaml_file = yaml.load(stream)
        except yaml.YAMLError as exc:
            print(exc)
                        
        for a in range(len(yaml_file['ENV'])):
            if key in yaml_file['ENV'][a]:
                req = yaml_file['ENV'][a]
        
    return req
        
#print(parse_yaml_file(r'C:\Venkatesh\TestingMetrics&TestCases\InsuranceCardAPITesting\Aug14\hps_insurance_card_api\configs\environment.yaml',"LOCAL"))

def parse_json_file(file_name,card_name):
    """
        Utility function to parse the json file

        Args:
            file_name (file object): json file for loading the data
            card_name: For fetching the card related information like Subscriber Name and identify the image name
        Returns:
            Return the loaded json file or with necessary data parsed
    """
    json_file = None
    req = None
    
    with open(file_name, 'r') as stream:
        try:
            json_file = json.load(stream)
        except Exception as exc:
            print(exc)
            
    for index in range(len(json_file['CARD_DETAILS'])):
        if card_name in json_file['CARD_DETAILS'][index]:
            req = json_file['CARD_DETAILS'][index]
        
    return req

#print(parse_json_file(r'C:\Venkatesh\TestingMetrics&TestCases\InsuranceCardAPITesting\Aug14\hps_insurance_card_api\resources\data\details.json',"HMSA"))

def parse_response_json_file(file_name,card_name):
    """
        Utility function to parse the json file

        Args:
            file_name (file object): json file for loading the data
			card_name: For fetching the card related response information
        Returns:
            Return the loaded json file or with necessary data parsed
    """
    json_file = None
    req = None
    
    with open(file_name, 'r') as stream:
        try:
            json_file = json.load(stream)
        except Exception as exc:
            print(exc)
            
    for index in range(len(json_file['CARD_ACTUAL_RESPONSE'])):
        if card_name in json_file['CARD_ACTUAL_RESPONSE'][index]:
            req = json_file['CARD_ACTUAL_RESPONSE'][index][card_name]
    return req

#print(parse_response_json_file(r'C:\Venkatesh\TestingMetrics&TestCases\InsuranceCardAPITesting\Aug14\hps_insurance_card_api\resources\data\response_validator.json',"HMSA"))	