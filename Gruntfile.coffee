module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.initConfig
    clean :
      foo: 'html/**'
    jade:
      foo:
        files: [
          expand : true,
          src : [
            'jade/**/*.jade'
          ],
          dest : 'html/'
          ext : '.html'
          filter : (filepath) =>
            basename = require('path').basename(filepath)
            !basename.match(/^_/)
        ]
        options : {
          pretty : true
        }
    watch :
      foo:
        files: 'jade/**/*.jade'
        tasks: ["setup"]

  grunt.registerTask 'setup', ['clean','jade']
  grunt.registerTask 'default', ['setup', 'watch']