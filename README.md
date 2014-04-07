contacts
========

### Working on application locally

**prerequisites**
* have [node.js](http://nodejs.org) with npm installed  
* have [grunt-cli](http://gruntjs.com/getting-started) installed

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

* [http://expressjs.com](http://expressjs.com) to serve statsta
