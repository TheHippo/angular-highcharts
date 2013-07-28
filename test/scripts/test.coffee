app = angular.module 'test-angular-highcharts', ['angular-highcharts']

app.config ['HighchartsGlobalConfigProvider', (highchartsGlobalConfigProvider) ->
	highchartsGlobalConfigProvider.setGlobal
		useUTC: yes
	highchartsGlobalConfigProvider.setLang
		decimalPoint: ','
]

app.controller 'Chart1', ['$scope', '$http', (scope, http) ->
	console.log "Chart1"
	scope.type = "bar"
	scope.title = "Charttitle"
	scope.chartReady = no
	http.get('data.json').success (data) ->
		scope.series = data
		scope.chartReady = yes
	scope.xconfig =
		categories: ['Apples', 'Bananas', 'Oranges']
	
]

app.controller 'Chart2', ['$scope', (scope) ->
	console.log "Chart2"
	scope.chartData = [['Section 1',1],['Section 2', 2],['Large Section', 4]]
]

app.controller 'Chart3', ['$http', '$scope', (http, scope) ->
	scope.chartReady = no
	http.jsonp('http://www.highcharts.com/samples/data/jsonp.php?filename=aapl-c.json&callback=JSON_CALLBACK').success (data) ->
		scope.series = [
			name: "Apple"
			data: data
		]
		scope.chartReady = yes

]