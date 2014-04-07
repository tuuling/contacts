contacts
========

#### Workin app visible at [http://tuuling.github.io/contacts](http://tuuling.github.io/contacts)

### Working on application locally

**prerequisites**
* have [node.js](http://nodejs.org) with npm installed  
* have [grunt-cli](http://gruntjs.com/getting-started) installed

#### Step 1
Download the project from github

#### Step 1
Install npm modules in the project directory with
``npm install``

#### Step 2
The app comes with a basic webserver that can serve the files. You can run the app with
``node app.js``
And access it from localhost:3000

#### Step 3
Start the watcher that compiles .coffee script files to .js files with ``grunt watch``

#### Step 4
Run unit tests with the ``grunt test`` command

### Tools and frameworks used

* [AngularJS](http://angularjs.org) as the main framework for the webapp
* [Bootstrap](http://getbootstrap.com) for css styles and layout
* [Angular UI $modal service](http://angular-ui.github.io/bootstrap/#/modal) for displaying overlays
* [Express](http://expressjs.com) to serve static files
* [Grunt](http://gruntjs.com) as the JS task runner for compiling coffeescript files and running tests
* [Karma](http://karma-runner.github.io/0.12/index.html) as the test runner
* [Jasmine](http://jasmine.github.io/2.0/introduction.html) JS test framework

### File structure

* ``/public`` includes the all the static files needed to run the app in the browser
* ``/src`` includes the coffeescript source file(s)
* ``/test/unit`` includes the unit tests
* ``/app.js`` basic express app to serve static files 
* ``/Gruntfile.js`` Config file for Grunt task runner
* ``/karma.conf.js`` Config file for Karma test runner
* ``/package.conf.js`` NPM conf file that lists the node.js depencies for the app
