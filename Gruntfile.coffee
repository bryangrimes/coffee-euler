module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    coffee:
      compile:
        expand: true
        flatten: true
        cwd: '.'
        src: ['src/*.coffee']
        dest: 'dist/'
        ext: '.js'
    coffeelint:
      app: ['src/*.coffee', 'Gruntfile.coffee']
      options:
        indentation:
          value: 2
    watch:
      scripts:
        files: ['src/*.coffee']
        tasks: ['coffeelint', 'coffee']
        options:
          event: ['added', 'deleted', 'modified']
    jasmine_node:
      projectRoot: '.'
      requirejs: false
      forceExit: true
      extensions: 'coffee'
    concat:
      options:
        stripBanners: true
        banner: '#!/usr/bin/env node\n'
      dist:
        src: ['dist/prob_1.js']
        dest: 'dist/euler.js'

  # Load the plugin that provides the "uglify" task.
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-jasmine-node'
  grunt.loadNpmTasks 'grunt-contrib-concat'

  # Default
  grunt.registerTask 'default', ['coffeelint', 'coffee', 'concat']
  grunt.registerTask 'spec', ['jasmine_node']