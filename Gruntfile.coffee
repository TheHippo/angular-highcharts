
tasks = ['contrib-coffee', 'contrib-watch', 'devserver']

module.exports = (grunt) ->

	grunt.initConfig
		pkg: grunt.file.readJSON 'package.json'
		coffee:
			testScript:
				options:
					sourceMap: yes
				src: './test/scripts/*.coffee'
				dest: './test/scripts/test.js'
			lib:
				options: 
					sourceMap: yes
					join: yes
				src: './lib/*.coffee'
				dest: './test/<%= pkg.name %>.js'
		watch:
			testScript:
				files: ['./test/scripts/*.coffee']
				tasks: ['coffee:testScript']
			lib:
				files: ['./lib/*.coffee']
				tasks: ['coffee:lib']
		devserver:
			options:
				port: 8000
				base: './test'

	grunt.loadNpmTasks "grunt-#{task}" for task in tasks
	grunt.registerTask 'server', ['devserver']
	grunt.registerTask 'testScript', ['coffee:testScript']
	grunt.registerTask 'lib', ['coffee:lib']
	grunt.registerTask 'default', ['coffee']