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

add your js to `app/javascript/packs/albums.js`


add a controller action to serve up your app from:

```
rails g controller welcome home
```

Add a pack tag to your home.html.erb file:

```
<%= javascript_pack_tag 'albums' %>
<nav class="ph4 pv2">
  <a href="#/home" class="albumsIndex link">Home</a>
</nav>
<input type="hidden" id="signed_in" value="<%= user_signed_in? %>"/>
<div class="ph4" id="root"></div>
```

Set your root route to welcome/home
```
root 'welcome#home'
```

To tell users to log in, you can add a link to users/sign_in
```
<a href="/users/sign_in">Sign in</a>
```

to pass info from the server about whether a user is currently logged in, you can use a hidden input like this:

```
<input type="hidden" id="signed_in" value="<%= user_signed_in? %>"/>
```

You can then read the value from the input from your JS to see whether you have a user logged in or not.

When you make fetch requests to the server, you'll be able to access `current_user` in order to see data associated with the currently logged in user.

When you make fetch requests that are not GET requests, you'll need to include the CSRF-token that comes from the meta tags in your head (delivered via application layout).

This line of code gives you the token you'll need:
```
document.querySelector('meta[name="csrf-token"]').content
```

You'll need to include it as an `'X-CSRF-Token'` header in the request. Here's an example:

```
static createAlbum(albumAttributes) {
    return fetch(`${AlbumAPI.base_url}/albums`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
      },
      body: JSON.stringify(albumAttributes)
    })
      .then(res => res.json())
  }
```