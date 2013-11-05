# Ka::Module::Users
This adds the following routes:
- GET /users - users listing
- POST /users - create user
- GET /users/:id - get user profile
- DELETE /users/:id - remove user
- PUT or PATCH /users/:id - edit user
- POST /sessions - create new session (login)
- DELETE /sessions/:id - delete a session (logout)

(use the _method parameter for JSONP calls)