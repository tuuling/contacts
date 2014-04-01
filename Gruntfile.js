module.exports = function(grunt) {

	// Project configuration.
	grunt.initConfig({
		watch: {
			files: ['src/*.coffee'],
			tasks: 'coffee'
		},
		coffee: {
			compile: {
				options: {
					sourceMap: true
				},
				files: {
					'public/js/app.js': ['src/*.coffee']
				}
			}
		}
	});

	// Load the plugin that provides the "uglify" task.
	grunt.loadNpmTasks('grunt-contrib-coffee');

	// Default task(s).
	grunt.registerTask('default', ['coffee']);

};