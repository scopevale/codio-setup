// Note the new way of requesting CoffeeScript since 1.7.x
require('coffee-script/register');
var gutil = require('gulp-util');
// This bootstraps your Gulp's main file
var gulpfile = 'Gulpfile.coffee';
gutil.log('Using file', gutil.colors.magenta(gulpfile));
// Execute CoffeeScript Gulpfile.
require('./' + gulpfile);
