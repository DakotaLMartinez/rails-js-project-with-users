# Rails/JS Project with Users
After running `rails new` and making our first commit, we'll add devise.
```
bundle add devise
```

read the Devise docs on github for more info.
```
rails g devise:install
```

Follow the instructions that are printed in the terminal after that command completes.

``` 
rails g devise User
```

```
rails db:migrate
```
Then we'll boot up a server and try to log in at http://localhost:3000/users/sign_in