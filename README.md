# RESTAURANT-API
A basic API for an Asian restaurant built with Rails.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Luiz-Hen-Reis/restaurant-api-rails.git
   ```

2. Install dependencies:
   ```bash
   bundle install
   ```

3. Create a `.env` file in the root of the project.

4. Add the following variables to the `.env` file:
   ```bash
   DATABASE_URL=PLACE_HERE_YOUR_POSTGRESQL_DATABASE_URL
   SECRET=HERE_CREATE_A_SECRET_KEY
   ```

5. Run database migrations:
   ```bash
   rails db:migrate
   ```

## Endpoints

- **POST /auth/register**: Register a new user.
  Permitted params: name, email, password, and password_confirmation.

- **POST /auth/login**: Sign in a user.
  Permitted params: email and password.

- **GET /api/v1/categories**: Get all categories.

- **GET /api/v1/categories/:id**: Get a specific category.

- **GET /api/v1/products**: Get all products. Accepted URL params: page and limit.

- **GET /api/v1/products/:id**: Get a specific product.

- **AUTHENTICATION REQUIRED**
  - **GET, POST /api/v1/user_addresses**: Get current user addresses and create new addresses.

  - **GET, POST /api/v1/orders**: Get current user orders and create new orders.
