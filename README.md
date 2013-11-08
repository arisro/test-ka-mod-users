# ka_mod_users

This is the users module for the public API. Its data source is provided by ka_ext_users to which it communicates via REST.

It adds the following routes:  
Users

| Method        | Path                  | Action                           |
|:--------------|:----------------------|:---------------------------------|
| GET           |/mount-base/users      | gets the current loggedin user
| PATCH         |/mount-base/users/:id  | edits the current loggedin user 
| PUT           |/mount-base/users/:id  | edits the current loggedin user 

Session

| Method        | Path                  | Action                           |
|:--------------|:----------------------|:---------------------------------|
| POST          | /mount-base/sessions  | creates a session providing an access token
| DELETE        | /mount-base/sessions/:id  | deletes the session for the given id or token

  
This module adds some administration routes as well:  
  
Users

| Method        | Path                  | Action                           |
|:--------------|:----------------------|:---------------------------------|
|GET | /mount-base/admin/users | gets the list of users
|GET | /mount-base/admin/users/:id | gets the specified user
|PATCH | /mount-base/admin/users/:id | modifies an user
|PUT | /mount-base/admin/users/:id | modifies an user

It allows HTTP method override via the "_method" parameter in POST calls.
