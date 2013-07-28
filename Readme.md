# Angular.js Highcharts / Highstock

Angular.js bindings for Hightcharts / Highstock


## Usage

*Heads up:* Due to the similarities in Highcharts and Highstock this library works with both, but
it is your task to make sure you have included all requirements for the library you want to use. (E.g.:
if you load the the Highchart library the Highstock diretives will be available and execute but fail.)  
This rule also applies to various settings and function that may differ between the two libraries. (E.g.:
`Highcharts.setOptions` takes different parameters depending on which library is loaded, 
so does `HighchartsGlobalConfig`.)

### Global configuration

	app.config(['HighchartsGlobalConfigProvider', function(highchartsGlobalConfigProvider) {
	    highchartsGlobalConfigProvider.setGlobal({
	      useUTC: true
	    });
	    highchartsGlobalConfigProvider.setLang({
	      decimalPoint: ','
	    });
	}]);

*Note*: If you have two Angular.js apps on a single page both of their Highcarts configurations will be merged.

### Simple chart Example


HTML:

	<div chart type="{{type}}" title="{{title}}" style="width:100%; height: 400px;" active="chartReady">
		<ul>
			<li ng-repeat="serie in series" serie name="serie.name" data="serie.data"></li>
		</ul>
		<div axis-y title="Fruit eaten"></div>
		<div axis-x config="xconfig"></div>
	</div>

JavaScript:

	$scope.type = "bar";

	$scope.title = "Charttitle";

	$scope.chartReady = false;

	$http.get('data.json').success(function(data) {
	  $scope.series = data;
	  $scope.chartReady = true;
	});

	$scope.xconfig = {
	  categories: ['Apples', 'Bananas', 'Oranges']
	};

*Note:* If data if not available during the directives linking process you need to provide and `active` attribute, which will
trigger the render process after all data is loaded.


## TODO

* support all Highchart / Highstock options
* support for dynamic data changes