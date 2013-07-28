app = angular.module 'angular-highcharts.services', []

hc = Highcharts

app.provider 'HighchartsGlobalConfig' , [() ->
	lang = {}
	global = {}
	@$get = () ->
		getLang: () ->
			lang
		getGlobal: () ->
			global
	@setLang = (options) ->
		angular.copy options, lang
		hc.setOptions
			lang: options
	@setGlobal = (options) ->
		angular.copy options, global
		hc.setOptions
			global: options
	return
]

app.provider 'IdGenerator' , [() ->
	id = 0
	@$get = () ->
		getID: () ->
			"hc-#{id++}"
	@setStart = (start) ->
		id = start
	return
]