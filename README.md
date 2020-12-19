# OIVAN
Oivan Assignment
## Usage

Go to: https://iwa-tech.herokuapp.com/
- Database: PostgreSql
- Rails version: 6.0.3
- Ruby version: 2.6.6
- Default User:
- Email: teacher@example.com
- Password: 12345678
- Role: Teacher

## Feature
1. Admin page
  - [X] Create User
  - [X] Have 2 roles includes teacher and student. Teachers can manages all users and manages all Tests.
  - [X] Update Password
  - [X] Sign in with session
  - [X] Sign up
  - [X] Sign out

2. Tests
  - [X] CURD Tests
  - [X] Authorize Tests

3. API

| Feature       | API           | Method        | Params        | Headers       |
| ------------- | ------------- | ------------- | ------------- | ------------- |
| Login         | /api/v1/authen_tokens  | POST  | email, password |   |
| Refresh Token  | /api/v1/authen_tokens/refresh_token  | POST  | refresh_token |   |
| Logout  | /api/v1/authen_tokens  | DELETE  |  | AUTHORIZATION  | 
| Get Quiz  | /api/v1/quizzes  | GET  |  | AUTHORIZATION  | 
| Get Questions  | /api/v1/quizzes/:id/questions  | GET  |  | AUTHORIZATION  |
| Get Take Quiz  | /api/v1/take_quizzes/:id  | GET  |  | AUTHORIZATION  | 
| Save Take Quiz  | /api/v1/take_quizzes  | POST  |  | AUTHORIZATION  | 

## Unit Test
  - [X] Operations
  - [X] API

## Best practices
  - [X] Rubocop
  - [X] Unit Test
  - [X] Authentication users with JWT
## Devops
  - [X] Auto run Rubocop after create PR on Github Action
  - [X] Auto run Unit Test after create PR on Github Action
  - [X] Go live application to Heroku
