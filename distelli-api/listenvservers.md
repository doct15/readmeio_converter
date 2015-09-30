---
title: "ListEnvServers"
excerpt: "List Environment Servers"
---
### username

Your Distelli user name can be found:
* In the Distelli webUI [Finding Your Distelli Username](doc:finding-your-distelli-username).
* If you are using a Team [Finding a Teams Username](doc:finding-a-teams-distelli-username).

### apiToken

Your Distelli API token can be found:
* In the Distelli webUI [Distelli API](doc:distelli-api).

### env_name

Environment name can be found:
* In the Distelli webUI [Viewing an Environments Deployments](doc:viewing-an-environments-deployments).
* In the Distelli API [ListEnvs](doc:listenvs).
* In the Distelli API [ListAppEnvs](doc:listappenvs).

### Pagination

This API command supports pagination and sorting. The following query string parameters can be included:

`max_results` - The number of results to return. The default is 10.
`marker` - Continue pagination from this **marker**.
`order` - Provide sorting values include: **asc** | **desc** for ascending | descending respectively.

For more information on pagination see [Distelli API](doc:distelli-api#pagination).