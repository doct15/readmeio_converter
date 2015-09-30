---
title: "ListAppBuilds"
excerpt: "List Application Builds"
---
### username

Your Distelli user name can be found:
* In the Distelli webUI [Finding Your Distelli Username](doc:finding-your-distelli-username).
* If you are using a Team [Finding a Teams Username](doc:finding-a-teams-distelli-username).

### apiToken

Your Distelli API token can be found:
* In the Distelli webUI [Distelli API](doc:distelli-api).
 
### app_name

Application name can be found:
* In the Distelli webUI [Viewing an Application](doc:viewing-an-application).
* In the Distelli API [ListApps](doc:listapps).

### Pagination

This API command supports pagination and sorting. The following query string parameters can be included:

`max_results` - The number of results to return. The default is 10.
`marker` - Continue pagination from this **marker**.
`order` - Provide sorting values include: **asc** | **desc** for ascending | descending respectively.

For more information on pagination see [Distelli API](doc:distelli-api#pagination).