---
title: "Product Update - Introducing the Distelli API"
excerpt: ""
---
In this blog I will discuss getting started with the new Distelli API. This will include examples using the curl command.

You can find full documentation for the Distelli API on the <a href="http://docs.distelli.com/docs" target="_blank">Distelli documentation site</a>.
[block:api-header]
{
  "type": "basic",
  "title": "The Distelli API"
}
[/block]
The Distelli API is a RESTful application program interface (API). The API provides an interface to the Distelli SaaS giving users with the ability to interact with objects in Distelli, including:
* Deploying applications
* Listing and inspecting builds
* Adding servers to environments
* Setting environment variables
* and much more...
[block:api-header]
{
  "type": "basic",
  "title": "Getting Started"
}
[/block]
Every call to the API requires 2 parameters. These are:
* Your Distelli username <a href="http://docs.distelli.com/docs/finding-your-distelli-username" target="_blank">Finding Your Distelli Username</a>.
* Your Distelli API token <a href="http://docs.distelli.com/docs/creating-an-api-token" target="_blank">Distelli API authentication</a>.

Follow the above steps to retrieve your username and API token.

Here is an example API call that will list the applications for username **jdoe**.
[block:code]
{
  "codes": [
    {
      "code": "curl \"https://api.distelli.com/**jdoe**/apps?apiToken=abcdefghijklmnopqrstuvwxyz0123456789z\"",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Using curl"
}
[/block]
Curl is a command-line tool for transferring data using various protocols. It is available <a href="http://curl.haxx.se/" target="_blank">here</a>. Curl is often installed by default on many OS's.

The various curl options that may be required for use with the Distelli API include:
<table>
<tr><td>-i</td><td>Include the HTTP header results. This may be handy to see the response code if there is no data returned.</td></tr>
<tr><td>-H "Content-Type: application/json"</td><td>When specifying json data in the body of the API request, this option is required for curl to interpret the data format.</td></tr>
<tr><td>-X *VERB*</td><td>Specify what type of query. The default is **GET**. Distelli API verbs include:
<ul>
<li>DELETE</li>
<li>GET</li>
<li>PATCH</li>
<li>POST</li>
<li>PUT</li>
</ul>
</td></tr></table>
**Typical syntax**
[block:code]
{
  "codes": [
    {
      "code": "curl OPTIONS \"URL\" -d JSON_DATA",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Making Distelli API Calls with curl"
}
[/block]
Different types of calls (GET, DELETE, POST, etc...) require differing options. Except GET, these query verbs require the -X option. Here are some examples.

Here is an example **GetEnv** API call. In this call user **jdoe** is getting information about environment **SA_Linux**.
[block:code]
{
  "codes": [
    {
      "code": "curl -i \"https://api.distelli.com/jdoe/envs/SA_Linux?apiToken=abcdefghijklmnopqrstuvwxyz0123456789z\"",
      "language": "text"
    }
  ]
}
[/block]
Here is an example **ListAppBuilds** API call. In this example user **jdoe** is listing builds for application **gobuilddeploy**.
[block:code]
{
  "codes": [
    {
      "code": "curl -i \"https://www.distelli.com/jdoe/apps/gobuilddeploy/builds?apiToken=abcdefghijklmnopqrstuvwxyz0123456789z\"",
      "language": "text"
    }
  ]
}
[/block]
Here is an example **ListEnvDeployments** API call. In this example user **jdoe** is listing deployments for environment **SA_Linux**. Also of note in this example is the use of pagination. The **max_results** option tells the API to only return 2 results and the **order=desc** option tells the API to sort the results descending.
[block:code]
{
  "codes": [
    {
      "code": "curl -i \"https://api.distelli.com/jdoe/envs/SA_Linux/deployments?apiToken=abcdefghijklmnopqrstuvwxyz0123456789z8&max_results=2&order=desc\"",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Including Data in the API Call"
}
[/block]
The Distelli API accepts and sends **json** formatted data. To send the data with curl you must include the **-d** option. The data must be JSON formatted. 

For more information on the JSON format, see <a href="http://json.org/" target="_blank">json.org</a>.

In the below example user **jdoe** is creating a new application called **NewApp1** and adding a description="This is a description".
[block:code]
{
  "codes": [
    {
      "code": "curl -i -X PUT -H \"Content-Type: application/json\" \"https://api.distelli.com/jdoe/apps/NewApp1?apiToken=abcdefghijklmnopqrstuvwxyz0123456789z\" -d '{\"description\": \"This is a description\"}'",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Language Specific Distelli API Client Examples"
}
[/block]
Below you can find several language specific references for client access to the Distelli API.

* [nodejs](#nodejs)
* [python](#python)
* [ruby](#ruby)

### nodejs

The below snippet of code requires that you:
1. export DISTELLI_USERNAME=**YOUR_DISTELLI_USERNAME**
2. export DISTELLI_APITOKEN=**YOUR_DISTELLI_TOKEN**

The below example will list applications and create an application NewApp001.
[block:code]
{
  "codes": [
    {
      "code": "var Client = require('node-rest-client').Client;\n\nvar apiToken = process.env.DISTELLI_APITOKEN;\nvar username = process.env.DISTELLI_USERNAME;\nvar apiurl = \"https://api.distelli.com\";\n\nclient = new Client();\n\n// Example Distelli ListApps GET\nclient.get(apiurl + '/' + username + '/apps?apiToken=' + apiToken, function(data, response){\n            // parsed response body as js object \n            console.log(data);\n            // raw response \n            //console.log(response);\n        });\n\n// Example Distelli CreateApp PUT with JSON body\nvar newappname = \"NewApp001\"\nvar jsonbody = {\n  description: \"This is the new application description\"\n};\n\nclient.put(apiurl + '/' + username + '/apps/' + newappname + '?apiToken=' + apiToken, jsonbody, function(data,response) {\n    // parsed response body as js object \n    console.log(data);\n    // raw response \n    //console.log(response);\n});",
      "language": "javascript"
    }
  ]
}
[/block]
You can clone the above example on [Distelli's public Github repository](https://github.com/Distelli/distelli_api_nodejs_example).

### python

The below snippet of code requires that you:
1. npm install node-rest-client
2. export DISTELLI_USERNAME=**YOUR_DISTELLI_USERNAME**
3. export DISTELLI_APITOKEN=**YOUR_DISTELLI_TOKEN**


The below example will list applications and create an application NewApp002.
[block:code]
{
  "codes": [
    {
      "code": "import requests\nimport json\nimport os\n\napiToken = os.environ['DISTELLI_APITOKEN']\nusername = os.environ['DISTELLI_USERNAME']\napiurl = \"https://api.distelli.com\"\n\n# Example Distelli ListApps call\nlistappsurl=apiurl + '/' + username + '/apps?apiToken=' + apiToken\nresponse = requests.get(listappsurl)\n\n#Careful, the will print your token\n#print(response.url)\nprint(response.text)\n\n# Example Distelli CreateApp call\nnewappname = \"NewApp002\"\njsonbody = json.dumps({'description': 'This is the new application description'})\ncreateappurl=apiurl + '/' + username + '/apps/' + newappname + '?apiToken=' + apiToken\nresponse = requests.put(createappurl, data=jsonbody)\n\n#Careful, the will print your token\n#print(response.url)\nprint(response.text)",
      "language": "python"
    }
  ]
}
[/block]
You can clone the above example on [Distelli's public Github repository](https://github.com/Distelli/distelli_api_python_example).

### ruby

The below snippet of code requires that you:
1. gem install mime-tyes
2. gem install netrc
3. gem install http-cookies
4. gem install json
5. gem install rest-client
6. export DISTELLI_USERNAME=**YOUR_DISTELLI_USERNAME**
7. export DISTELLI_APITOKEN=**YOUR_DISTELLI_TOKEN**

The below example will list applications and create an application NewApp003.
[block:code]
{
  "codes": [
    {
      "code": "require 'rest-client'\nrequire 'json'\n\napiToken = ENV[\"DISTELLI_APITOKEN\"]\nusername = ENV[\"DISTELLI_USERNAME\"]\napiurl = \"https://api.distelli.com\"\n\n# Example Distelli ListApps call\nlistappsurl=apiurl + \"/\" + username + '/apps?apiToken=' + apiToken\nresponse = RestClient.get listappsurl, {:accept => :json}\nprint response.code\nprint response.headers\nprint response.body\n\n# Example Distelli CreateApp call\nnewappname = \"NewApp003\"\njsonbody = {:description => \"This is the new application description\"}.to_json\ncreateappurl=apiurl + '/' + username + '/apps/' + newappname + '?apiToken=' + apiToken\nresponse = RestClient.put createappurl, jsonbody, :content_type => :json, :accept => :json\nprint response.code\nprint response.headers\nprint response.body\n",
      "language": "ruby"
    }
  ]
}
[/block]
You can clone the above example on [Distelli's public Github repository](https://github.com/Distelli/distelli_api_ruby_example).

If you see this, you have not set the environment variables (step 6 & 7 above).
[block:code]
{
  "codes": [
    {
      "code": "distelli_api_ruby_example.rb:9:in `+': can't convert nil into String (TypeError)\n\tfrom distelli_api_ruby_example.rb:9:in `<main>'",
      "language": "text"
    }
  ]
}
[/block]
If the application **NewApp003** already exists you will receive an error.