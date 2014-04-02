module.exports = function(config) {
	config.set({
		frameworks: ['jasmine'],
		files: ['test/**/*.coffee'],
		singleRun: true,
		browsers: ['Chrome', 'PhantomJS'],
		preprocessors: {
			'**/*.coffee': 'coffee'
		}
	});
};