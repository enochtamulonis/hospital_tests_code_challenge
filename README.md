##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [2.7.1]
- Rails [6.0.3.4]
- Postgresql

##### 1. Check out the repository

```bash
git clone https://github.com/yunggindigo/hospital_tests_code_challenge.git
```
##### 2. Install Yarn files for tailwindcss

```bash
yarn install --check-files
```
##### 3. Create the database

Run the following commands to create and setup the database.

```ruby
rails db:create
```

##### 4. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can visit the site with the URL http://localhost:3000
