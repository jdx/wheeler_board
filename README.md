#WheelerBoard

## Setting up Google API
1) Apply for [**Google API Access**](https://code.google.com/apis/console/b/0/)

![google api access](http://i.imgur.com/nsMMw.jpg)

2) Point your redirect URL to some fake domain, and don't forget to set up the port numbers, if applicable.

![fake domain](http://i.imgur.com/S8oxx.jpg)

## Setting up the Environment
1) In order to test locally, put `wheeler.com` (or whatever domain you chose in the previous step) in your `etc/hosts` file:

```
127.0.0.1 wheeler.com
```

2) copy over the default yaml file and edit:

```
$ cp ./config/dev-defaults.yml ./config/dev.yml
$ vi ./config/dev.yml
```

3) Replace the Google credentials with yours from previous steps.

4) If you haven't already done this, run `bundle install` and create your database:

```
$ bundle install
$ rake db:create
$ rake db:migrate
```

## Starting the server
Be sure to start the rails server with the correct port number from above.

```
$ rails s -p 3003
```
