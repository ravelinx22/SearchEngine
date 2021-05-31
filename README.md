# Engine search

## Technologies used

- Ruby 2.6.5
- Rails 6.1.3.2

## Instructions to execute

1. Set Google and Bing credentials

    For this project I worked with Rails credentials so in order to use my generated Google and Bing credentials you should set the **master.key** in the path **config/master.key**

    If you dont have the **master.key** file then you should modify the files **app/services/google_search.rb** and **app/services/bing_search.rb** with your credentials.

2. Install gems

    ```bash
    bundle install
    ```

3. Run server

    ```bash
    rails server
    ```

4. Make request

    ```
    GET http://localhost:3000/engine/search?q=<QUERY>&engine=<ENGINE>
    ```

## Query parameters

| Parameter name |    Possible values   |
|:--------------:|:--------------------:|
| engine         | google, bing or both |
| q              | Any string           |
