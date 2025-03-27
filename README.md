Welcome to My API


## Task
My API is a backend service designed to provide access to a large dataset of animals (Abalone dataset) through a RESTful API. The challenge was to build a scalable, secure, and efficient API that allows users to interact with the dataset using authentication, pagination, caching, and proper documentation.

## Description
This project was built using Ruby on Rails as a backend API, with PostgreSQL as the database. The main features include:

User Authentication: Implemented using Devise and Doorkeeper for OAuth token-based authentication.
CRUD Operations: Users can create, read, update, and delete animal records.
Public Access to GET Requests: Anyone can fetch animal data without authentication.
Pagination: Limited to a maximum of 20 records per page.
Caching: Redis is used for caching responses to enhance performance.
Postman Collection: A Postman collection is available for testing.
Deployment: The API is deployed on Render for public access.


## Installation
To install and run My API locally, follow these steps:

Clone the repository:
git clone https://github.com/yourusername/my_api.git
cd my_api
Install dependencies:
bundle install
Set up the database:
rails db:create db:migrate db:seed
Start the server:
rails server
The API will be available at http://localhost:3000

## Usage
The API provides the following endpoints:

Public Endpoints
GET /api/v1/animals - Fetch all animals with pagination.
GET /api/v1/animals/:id - Fetch details of a specific animal.
Protected Endpoints (Requires Authentication)
POST /api/v1/animals - Create a new animal record.
PATCH /api/v1/animals/:id - Update an existing animal record.
DELETE /api/v1/animals/:id - Delete an animal record.
Authentication
To access protected routes, obtain an OAuth token:

curl -X POST http://localhost:3000/oauth/token \
  -d "grant_type=password&username=user@example.com&password=password123&client_id=YOUR_CLIENT_ID&client_secret=YOUR_CLIENT_SECRET"
Use the returned access_token in requests:

curl -H "Authorization: Bearer YOUR_ACCESS_TOKEN" http://localhost:3000/api/v1/animals

Documentation
Postman Collection:
Link: https://documenter.getpostman.com/view/42435242/2sAYkKHcsr

Deployment
My API is deployed on Render and can be accessed here: https://my-api-zepr.onrender.com


The Core Team
Avong Haruna
Mathew Prince Emmanuel
Noah Ezekiel
