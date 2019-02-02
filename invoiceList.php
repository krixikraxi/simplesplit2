<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8"> 
	<title>Splitwise 2</title>  
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/custom.css">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>  
</head>  
<body>

<div class="container">
    <div class="page-header">
		<h1>
			Splitwise 2
			<small class="text-muted">Manage your assets with a smile.</small>
		</h1>
		<p class="lead">List all your past invoices in a neat place.</p> 
		<hr>
    </div>

	    <div ng-app="sa_app" ng-controller="controller" ng-init="show_data()">
		<div class="row">
			<div class="col-sm mb-3">
				A comprehensive list of past invoices. <a href="index.php" >Back to main view.</a>
			</div>
		</div>
			<div class="row">
				<div class="col-sm">
					<table class="table table-bordered">
						<tr>
							<th>Id</th>
							<th>Date</th>
							<th>Alex</th>
							<th>Manu</th>
							<th>Difference</th>
							<th>Amount paid</th>
						</tr>
						<tr ng-repeat="x in invoices">
							<td>{{x.id}}</td>
							<td>{{x.date | dateToISO | date:'dd.MM.yyyy, H:mm'}}</td>
							<td>{{x.alex}}</td>
							<td>{{x.manu}}</td>
							<td>{{Math.round(Math.abs(x.manu - x.alex) * 100) / 100}}</td>
							<td> {{x.alex > x.manu ? "Manu -> Alex: " : "Alex -> Manu: "}} {{((Math.round(Math.abs(x.manu - x.alex) * 100) / 100) / 2)}}</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
</div>

<script>  
	var app = angular.module("sa_app", []);
	app.controller("controller", function($scope, $http) {
		$scope.Math = window.Math;
		$scope.show_data = function() {
			$http.get("invoiceSummaryList.php")
				.success(function(data) {
					$scope.invoices = data;
				});
		}
	});
	app.filter('dateToISO', function() {
		 return function(input) {
			 input = new Date(input).toISOString();
			 return input;
	    };
	});
	
</script>  
</body>  
</html>
