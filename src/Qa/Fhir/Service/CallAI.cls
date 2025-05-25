Class Qa.Fhir.Service.CallAI Extends %RegisteredObject
{

/// Description
Method Call(API, APIKey, Model, Messages) As %String [ Language = python ]
{
from openai import OpenAI

client = OpenAI(api_key=APIKey, base_url=API)

response = client.chat.completions.create(
    model=Model,
    messages=eval(Messages),
    max_tokens=1024,
    temperature=0.7,
    stream=False
)

return response.choices[0].message.content
}

ClassMethod AiRequest(message) As %String
{
    Set messages =[]
    Set sys = {
                "role": "system",
                "content": "You are a FHIR expert in the medical industry."
              }
    Set user = {
                "role": "user",
                "content": ""
                }

    Set content =message
                _"Based on the above fhir resources, generate patient education content and medication reminders."
    d messages.%Push(sys)    
    Set user.content = content
    d messages.%Push(user)    

    Return messages.%ToJSON()
}

}
