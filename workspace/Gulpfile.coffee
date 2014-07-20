"use strict"
gulp = require("gulp")
compass = require("gulp-compass")
path = require("path")
sass = require("gulp-sass")
csso = require("gulp-csso")
uglify = require("gulp-uglify")
concat = require("gulp-concat")
plumber = require("gulp-plumber")
exec = require("child_process").exec
gulpExec = require("gulp-exec")
open = require("gulp-open")
jshint = require("gulp-jshint")
stylish = require("jshint-stylish")
runSequence = require("run-sequence")
tap = require("gulp-tap")
gutil = require('gulp-util')

gulp.task "examples-x", ->
  # Do something with the file name
  gulp.src("./views/**/*.handlebars").pipe(tap((file, t) ->
    gutil.log gutil.colors.cyan(path.basename(file.path))
    return
  )).pipe gulp.dest("./gulp-example-output")


gulp.task "examples-y", ->
  gulp.src("./views/**/*.handlebars").pipe(tap((file) ->
    gutil.log gutil.colors.cyan(path.basename(file.path))
    file.contents = Buffer.concat([
      new Buffer("HEADER")
      file.contents
    ])
    return
  )).pipe gulp.dest("./gulp-example-output")


# run jshint on our javascripts
gulp.task "lint", ->
  gulp.src([
    "meadowlark.js"
    "lib/**/*.js"
    "public/qa/**/*.js"
    "qa/**/*.js"
    "gulpfile.js"
  ]).pipe(jshint()).pipe jshint.reporter(stylish)


# run our unit & headless browser tests
gulp.task "tdd", ->
  options =
    continueOnError: true # default = false, true means don't emit error event
    pipeStdout: false # default = false, true means stdout is written to
    # file.contents content passed to gutil.template() - not used because 
    # reportOptions stderr: false prevent err output
    customTemplatingThing: "2>/dev/null"

  reportOptions =
    err: true # default = true, false means don't write err
    stderr: false # default = true, false means don't write stderr
    stdout: true # default = true, false means don't write stdout

  gulp.src("./qa/*.js").pipe(gulpExec("mocha -u tdd -R spec <%= file.path %> <%= options.customTemplatingThing %>", options)).pipe gulpExec.reporter(reportOptions)


# run linkchecker on our URLS
gulp.task "linkchecker", ->
  options =
    continueOnError: true # default = false, true means don't emit error event
    pipeStdout: false # default = false, true means stdout is written to file.contents
    url: "http://localhost:3000/" # our base url

  reportOptions =
    err: true # default = true, false means don't write err
    stderr: true # default = true, false means don't write stderr
    stdout: true # default = true, false means don't write stdout

  
  # iterate through our list of templates and call linkchecker on the slice'd
  # out file name without the .handlebars extension or the base path (eg: 'about')
  # so url to check becomes http://localhost:3000/about
  gulp.src([
    "./views/home.handlebars"
    "./views/about.handlebars"
  ]).pipe(gulpExec("/home/codio/./.parts/packages/python2/2.7.6-2/bin/linkchecker <%= options.url %><%= file.path.substring(0, file.path.lastIndexOf('.')).slice(file.base.length) %>", options)).pipe gulpExec.reporter(reportOptions)


# another way to run linchecker
gulp.task "linkcheck", (cb) ->
  exec "/home/codio/./.parts/packages/python2/2.7.6-2/bin/linkchecker http://localhost:3000/home http://localhost:3000/about", (err, stdout, stderr) ->
    console.log stdout
    console.log stderr
    cb err
    return



# alternative & non functioning version of linkcheck/linkchecker
gulp.task "url", ->
  options =
    url: [
      "http://localhost:3000/home"
      "http://localhost:3000/about"
    ]
    app: "/home/codio/./.parts/packages/python2/2.7.6-2/bin/linkchecker"

  gulp.src([
    "./views/home.handlebars"
    "./views/about.handlebars"
  ]).pipe open("", options), (err, stdout, stderr) ->
    console.log stdout
    return



# compile .scss (sass) files to .css
gulp.task "sass", ->
  gulp.src("public/css/style.scss").pipe(plumber()).pipe(sass()).pipe(csso()).pipe gulp.dest("public/css")


# compass - unused because currently using sass
gulp.task "compass", ->
  gulp.src("./css/*.scss").pipe(compass(
    project: path.join(__dirname, "assets")
    css: "css"
    sass: "sass"
  )).pipe gulp.dest("app/assets/temp")


# compress - minify js files
gulp.task "compress", ->
  gulp.src([
    "public/vendor/*.js"
    "public/js/*.js"
    "public/qa/*.js"
  ]).pipe(concat("app.min.js")).pipe(uglify()).pipe gulp.dest("public/js")

gulp.task "watch", ->
  gulp.watch "public/css/*.scss", ["sass"]
  gulp.watch [
    "public/**/*.js"
    "!public/javascripts/app.min.js"
    "!public/vendor"
  ], ["compress"]
  return

gulp.task "default", [
  "lint"
  "linkchecker"
  "tdd"
  "sass"
  "compress"
]
gulp.task "in-sequence", (callback) ->
  runSequence "lint", 
              "linkchecker", 
              "tdd", 
              "sass", 
              "compress", 
              callback
  return
