module.exports = (grunt) ->
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json')
    coffee:
      compileWithMaps:
        options:
          sourceMap: true,
          join: true
        files:
          "public/js/app.js": ['public/app/**/*.coffee']
    watch:
      scripts:
        files: "public/app/**/*.coffee",
        tasks: ['coffee']
    nodemon:
      dev:
        options:
          file: "app.coffee",
          debug: true
    concurrent:
      target:
        tasks: ['nodemon', 'watch'],
        options:
          logConcurrentOutput: true
  })

  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-nodemon')
  grunt.loadNpmTasks('grunt-concurrent')

  grunt.registerTask('default', ['concurrent:target'])
