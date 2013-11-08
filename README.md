# ka_mod_users

This is the users module for the public API. Its data source is provided by ka_ext_users to which it communicates via REST.

#### Config file
```yml
facebook:
  app_id: 'your_app_id'
  app_secret: 'your_app_secret'

user_extension_api_endpoint: 'http://api.hostname.com:8080/extusers/'

# http_proxy: 'http://your_http_proxy:3128'
```
- *facebook:* - Facebook application settings for authentication
- *user_extension_api_endpoint:* - the location where the user extension API can be reached
- *http_proxy* - used for external HTTP requests (like the Facebook API). Set if needed.

#### Routes
**Users**

| Method        | Path                  | Action                           |
|:--------------|:----------------------|:---------------------------------|
| GET           |/mount-base/users      | gets the current loggedin user
| PATCH         |/mount-base/users/:id  | edits the current loggedin user 
| PUT           |/mount-base/users/:id  | edits the current loggedin user 

**Session**

| Method        | Path                  | Action                           |
|:--------------|:----------------------|:---------------------------------|
| POST          | /mount-base/sessions  | creates a session providing an access token
| DELETE        | /mount-base/sessions/:id  | deletes the session for the given id or token



-----
  
This module adds some **administration** routes as well:  
  
**Users**

| Method        | Path                  | Action                           |
|:--------------|:----------------------|:---------------------------------|
|GET | /mount-base/admin/users | gets the list of users
|GET | /mount-base/admin/users/:id | gets the specified user
|PATCH | /mount-base/admin/users/:id | modifies an user
|PUT | /mount-base/admin/users/:id | modifies an user

It allows HTTP method override via the "_method" parameter in POST calls.
