# Welcome to My Api
***

## Task
My API is designed to provide a RESTful interface for managing and retrieving data about animals\abalone. The main challenge was handling large datasets efficiently while ensuring secure authentication and smooth data access.

## Description
This project is a Ruby on Rails-based API that supports CRUD operations on a large dataset. It includes user authentication via Devise and OAuth token-based authentication using Doorkeeper for optimized performance. Pagination is implemented to handle large datasets, ensuring efficient data retrieval.

## Installation
To install and set up My API, follow these steps:
1. Clone the repository: git clone https://github.com/your-username/my_api.git
cd my_api

2. Install dependencies: bundle install

3. Set up the database: rails db:create db:migrate db:seed

4. Start the Rails server: rails s

## Usage

To use the API, you need to authenticate and make HTTP requests.

Authentication

Obtain an OAuth token:
curl -X POST http://localhost:3000/oauth/token \
  -d "grant_type=password&email=user@example.com&password=yourpassword"

  Fetching Paginated Data
 curl -H "Authorization: Bearer YOUR_ACCESS_TOKEN" http://localhost:3000/abalones?page=1

 Creating a Record
 curl -X POST http://localhost:3000/api/v1/animals \
  -H "Authorization: Bearer YOUR_ACCESS_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"name": "Lion", "category": "Mammal"}'

  Updating a Record
  curl -X PUT http://localhost:3000/api/v1/animals/1 \
  -H "Authorization: Bearer YOUR_ACCESS_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"name": "Updated Name"}'

  Deleting a Record
  curl -X DELETE http://localhost:3000/api/v1/animals/1 \
  -H "Authorization: Bearer YOUR_ACCESS_TOKEN"

  API Documentation

You can access the API documentation via Postman:
http://localhost:3000/api-docs

Deployment

To deploy on Render, ensure the following environment variables are set:
. RAILS_ENV=production
. DATABASE_URL=your_render_database_url
. SECRET_KEY_BASE=your_secret_key
. PORT=10000

Then, follow the deployment steps outlined in the Render setup.


### The Core Team


<span><i>Made at <a href='https://qwasar.io'>Qwasar SV -- Software Engineering School</a></i></span>
<span><img alt='Qwasar SV -- Software Engineering School's Logo' src='https://storage.googleapis.com/qwasar-public/qwasar-logo_50x50.png' width='20px' /></span>
