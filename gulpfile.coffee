browserify = require 'browserify'
chalk      = require 'chalk'
CSSmin     = require 'gulp-minify-css'
gulp       = require 'gulp'
gutil      = require 'gulp-util'
jade       = require 'gulp-jade'
livereload = require 'gulp-livereload'
nodemon    = require 'gulp-nodemon'
path       = require 'path'
prefix     = require 'gulp-autoprefixer'
prettyTime = require 'pretty-hrtime'
source     = require 'vinyl-source-stream'
streamify  = require 'gulp-streamify'
stylus     = require 'gulp-stylus'
uglify     = require 'gulp-uglify'
watchify   = require 'watchify'

production = process.env.NODE_ENV is 'production'

config =
  scripts:
    source: './src/js/main.js'
    extensions: ['.jsx']
    destination: './client/js/'
    filename: 'bundle.js'
  styles:
    source: './src/styles/style.styl'
    watch: './src/styles/*.styl'
    destination: './client/css/'
  assets:
    source: './src/assets/**/*.*'
    watch: './src/assets/**/*.*'
    destination: './client/'

handleError = (err) ->
  console.log err.name
  console.log err.message
  gutil.beep()
  this.emit 'end'

gulp.task 'scripts', ->

  bundle = browserify
    entries: [config.scripts.source]
    extensions: config.scripts.extensions
    debug: not production

  build = bundle.bundle()
    .on 'error', handleError
    .pipe source config.scripts.filename

  build.pipe(streamify(uglify())) if production

  build
    .pipe gulp.dest config.scripts.destination

gulp.task 'styles', ->
  styles = gulp
    .src config.styles.source
    .pipe stylus
      'include css': true

    .on 'error', handleError
    .pipe prefix 'last 2 versions', 'Chrome 34', 'Firefox 28', 'iOS 7'

  styles = styles.pipe(CSSmin()) if production
  styles = styles.pipe gulp.dest config.styles.destination
  styles = styles.pipe livereload(auto: false) unless production
  styles

gulp.task 'assets', ->
  gulp
    .src config.assets.source
    .pipe gulp.dest config.assets.destination

gulp.task 'server', ->
  nodemon
    script: 'src/server'
    ext: 'js jsx'
    watch: 'src/'
    nodeArgs: ['--harmony']
    ignore: []
gulp.task 'watch', ->
  livereload.listen()

  gulp.watch config.styles.watch, ['styles']
  gulp.watch config.assets.watch, ['assets']

  bundle = watchify browserify
    entries: [config.scripts.source]
    extensions: config.scripts.extensions
    debug: not production
    cache: {}
    packageCache: {}
    fullPaths: true

  bundle.on 'update', ->
    gutil.log "Starting '#{chalk.cyan 'rebundle'}'..."
    start = process.hrtime()
    build = bundle.bundle()
      .on 'error', handleError

      .pipe source config.scripts.filename

    build
      .pipe gulp.dest config.scripts.destination
      .pipe(livereload())
    gutil.log "Finished '#{chalk.cyan 'rebundle'}' after #{chalk.magenta prettyTime process.hrtime start}"

  .emit 'update'

gulp.task 'no-js', ['styles', 'assets']
gulp.task 'build', ['scripts', 'no-js']
gulp.task 'default', ['watch', 'no-js', 'server']
