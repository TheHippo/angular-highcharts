app = angular.module 'angular-highcharts', ['angular-highcharts.directives', 'angular-highcharts.services']

app.config ['IdGeneratorProvider', (idGeneratorProvider) ->
	idGeneratorProvider.setStart 1
]