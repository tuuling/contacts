module.exports = function(grunt) {

	// Project configuration.
	grunt.initConfig({
		watch: {
			files: ['src/*.coffee'],
			tasks: 'coffee'
		},
		coffee: {
			compile: {
				files: {
					'public/js/app.js': ['src/*.coffee']
				}
			}
		},
		karma:{
			unit: {
				configFile: 'karma.conf.js'
			}
		}
	});

	grunt.loadNpmTasks('grunt-contrib-watch');
	grunt.loadNpmTasks('grunt-contrib-coffee');
	grunt.loadNpmTasks('grunt-karma');

	// Default task(s).
	grunt.registerTask('default', ['coffee']);

};