---
title: "Distelli API"
excerpt: ""
---
[block:callout]
{
  "type": "warning",
  "body": "The Distelli API is currently in Beta. 2015/09/17"
}
[/block]
This describes the resources that make up the official Distelli API. If you have any problems or requests, please contact [support](https://www.distelli.com/support).
[block:api-header]
{
  "type": "basic",
  "title": "Schema"
}
[/block]
All API access is over HTTPS, and accessed from the api.distelli.com domain. All data is sent and received as JSON. For more information on the JSON format, see <a href="http://json.org/" target="_blank">json.org</a>.
[block:code]
{
  "codes": [
    {
      "code": "$ curl -i \"https://api.distelli.com/jdoe/apps?apiToken=abcdefghijklmnopqrstuvwxyz0123456789z\"\n\nHTTP/1.1 200 OK\nContent-Type: application/json\nServer: DistelliWS\nx-dstli-rid: etow4x4rngn007nsn65yq8b08\nContent-Length: 2290\nConnection: keep-alive\n",
      "language": "text"
    }
  ]
}
[/block]
Blank fields are included as `null` instead of being omitted.

All timestamps are returned in ISO 8601 format:
[block:code]
{
  "codes": [
    {
      "code": "YYYY-MM-DDTHH:MM:SSZ",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "HTTP Verbs"
}
[/block]

[block:parameters]
{
  "data": {
    "h-0": "Verb",
    "h-1": "Description",
    "0-0": "GET",
    "1-0": "POST",
    "2-0": "PATCH",
    "3-0": "PUT",
    "4-0": "DELETE",
    "0-1": "Used for retrieving resources.",
    "1-1": "Used for creating resources.",
    "2-1": "Used for updating resources with partial JSON data.",
    "3-1": "Used for replacing resources or collections.",
    "4-1": "Used for deleting resources."
  },
  "cols": 2,
  "rows": 5
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Authentication"
}
[/block]
You must use a Distelli supplied API token to authenticate API calls.

**Example**
[block:code]
{
  "codes": [
    {
      "code": "curl -i -X GET \"https://api.distelli.com/jdoe/apps?apiToken=abcdefghijklmnopqrstuvwxyz0123456789z\"",
      "language": "text"
    }
  ]
}
[/block]
**To retrieve your Distelli API token**

Before beginning these steps ensure you are using the correct team or account. For more information on Distelli teams see [Using an Organization Team Account](doc:using-an-organization-team-account).  To see if you are using a team or not see [Using a Team](doc:using-a-team).

1. In the Distelli WebUI click the **gear** icon on the top right.
2. Click the **API** link on the left.
3. Click the **Create API Token** button.
4. Give the token a meaningful **Description**.
5. Click the **Create Token** button.

You have created an API token. You can now test the token with the following ListApps call.
[block:code]
{
  "codes": [
    {
      "code": "curl -i \"https://api.distelli.com/USERNAME/apps?apiToken=TOKEN\"",
      "language": "text"
    }
  ]
}
[/block]
Replace **USERNAME** with your Distelli user name or team user name.
Replace **TOKEN** with the Distelli API token.

You should be returned a list of applications. If you do not get a **200 OK** ensure you are using the correct user name with the correct token.
[block:api-header]
{
  "type": "basic",
  "title": "Hypermedia"
}
[/block]
Resources may have one or more __*_url__ properties linking to other resources. These are meant to provide explicit URLs so that proper API clients don’t need to construct URLs on their own. It is highly recommended that API clients use these. Doing so will make future upgrades of the API easier for developers.
[block:api-header]
{
  "type": "basic",
  "title": "Pagination"
}
[/block]
List requests that return multiple items will be paginated to 10 items by default. You can specify further pages with the `marker` query string parameter. For some resources, you can also set a custom page size up to 100 with the `max_results` parameter.

**Example**

In this example we will ListApps and set the max_results to 3.
[block:code]
{
  "codes": [
    {
      "code": "curl -i \"https://api.distelli.com/USERNAME/apps?apiToken=TOKEN&max_results=3\"",
      "language": "text"
    }
  ]
}
[/block]
Below is an example response to the above call.
[block:code]
{
  "codes": [
    {
      "code": "{\n  \"apps\": [\n    {\n      \"api_url\": \"https://api.distelli.com/jdoe/apps/AdvancedGoApp\",\n      \"created\": \"2015-04-24T00:13:08Z\",\n      \"description\": null,\n      \"html_url\": \"https://www.distelli.com/jdoe/apps/AdvancedGoApp\",\n      \"name\": \"AdvancedGoApp\",\n      \"owner\": \"jdoe\"\n    },\n    {\n      \"api_url\": \"https://api.distelli.com/jdoe/apps/AdvancedNodeApp\",\n      \"created\": \"2015-04-24T16:50:40Z\",\n      \"description\": \"Advanced Node App 12:25\",\n      \"html_url\": \"https://www.distelli.com/jdoe/apps/AdvancedNodeApp\",\n      \"name\": \"AdvancedNodeApp\",\n      \"owner\": \"jdoe\"\n    },\n    {\n      \"api_url\": \"https://api.distelli.com/jdoe/apps/ApachePHPApp\",\n      \"created\": \"2015-05-08T00:00:36Z\",\n      \"description\": null,\n      \"html_url\": \"https://www.distelli.com/jdoe/apps/ApachePHPApp\",\n      \"name\": \"ApachePHPApp\",\n      \"owner\": \"jdoe\"\n    }\n  ],\n  \"marker\": \"HsPj41f5DiOwHxnm88gZog==\"\n}",
      "language": "text"
    }
  ]
}
[/block]
To list the subsequent 3 applications the call would look like this.
[block:code]
{
  "codes": [
    {
      "code": "curl -i \"https://api.distelli.com/USERNAME/apps?apiToken=TOKEN&max_results=3&marker=HsPj41f5DiOwHxnm88gZog==\"",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Sorting"
}
[/block]
List requests that return multiple items can be sorted alphabetically **asc**ending (use **asc**) or **desc**ending (use **desc**) with the `order` query string parameter.

**Example**

In this example we will ListApps in descending order.
[block:code]
{
  "codes": [
    {
      "code": "curl -i \"https://api.distelli.com/USERNAME/apps?apiToken=TOKEN&order=desc\"",
      "language": "text"
    }
  ]
}
[/block]