module.exports = function(config) {
	config.set({
		frameworks: ['jasmine'],
		files: [
			'public/js/angular.js',
			'public/js/ui-bootstrap.min.js',
			'test/lib/**/*.js',
			'test/unit/**/*.coffee',
			'src/**/*.coffee'
		],
		singleRun: true,
		browsers: ['Chrome', 'PhantomJS'],
		preprocessors: {
			'**/*.coffee': 'coffee'
		},
		logLevel: config.LOG_INFO
	});
};