# iris-medbot-guide


Automatically generate patient education content and personalized medication reminders by parsing FHIR resources through OpenAI API.

## Describe 



IRIS-MedBot-Guide is an intelligent medical assistant based on FHIR (Fast Healthcare Interoperability Resources) standard, designed specifically for healthcare institutions, developers, and patients. By integrating patient medication records (such as' MedicationRequest ') in FHIR servers and utilizing OpenAI's natural language generation capabilities, the following content can be automatically created:

- Patient education materials (medication instructions, side effect tips)

-  Dynamic medication reminder  (dose, frequency, contraindication reminder)

-  Interactive Q&A   (Personalized answers based on patient historical data)


## How to use it

### Prerequisites
Make sure you have git and Docker desktop installed,And possess OpenAI API keys.
### Installation
#### 1.Clone/git pull the repo into any local directory
```
git clone https://github.com/yueshan239/iris-medbot-guide.git
```  
#### Open the terminal in this directory and run

```
docker-compose build
```
#### Run the IRIS container 

```
docker-compose up -d
```
