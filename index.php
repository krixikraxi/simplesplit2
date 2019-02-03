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
		<p class="lead">This system enables you to split your bills with ease.</p>
		<hr>
    </div>
	
	<div id="success_alert" class="alert alert-success collapse">
		<a id="linkClose" href="#" class="close">&times;</a>
		<strong>Success! </strong><a id="alert_text"></a>
	</div>

	    <div ng-app="sa_app" ng-controller="controller" ng-init="show_data()">
			<div class="row">
				<div class="col-sm mb-4">
				
					<div class="input-group input-group-sm mb-3">
					  <div class="input-group-prepend">
						<span class="input-group-text">Amount</span>
					  </div>
					  <input type="text" class="form-control" ng-model="amount">
					</div>
					
					<div class="input-group input-group-sm mb-3">
					  <div class="input-group-prepend">
						<span class="input-group-text">User</span>
					  </div>
						<select class="form-control form-control-sm" ng-model="user">
							 <option ng-repeat="user in users" value='{{ user.id }}' >{{ user.name }}</option>
						</select>
					</div>
					
					<div class="input-group input-group-sm mb-3">
					  <div class="input-group-prepend">
						<span class="input-group-text">Notes</span>
					  </div>
					  <input type="text" class="form-control" ng-model="notes">
					</div>

					<input type="hidden" ng-model="id">
					<input type="submit" name="insert" class="btn btn-primary btn-sm" ng-click="insert()" value="{{btnName}}">
				</div>
				<div class="col-sm">
				
					<h5>Results of the current billing iteration:</h5>
					<div class="row" ng-hide="sumOfUsers[0] === undefined">
					  <div class="col-sm-6 col-lg-4">Sum for {{sumOfUsers[0].name}}:</div>
					  <div class="col">{{sumOfUsers[0].userSum}}</div>
					</div>
					<div class="row" ng-hide="sumOfUsers[1] === undefined">
					  <div class="col-sm-6 col-lg-4">Sum for {{sumOfUsers[1].name}}:</div>
					  <div class="col">{{sumOfUsers[1].userSum}}</div>
					</div>
					<div class="row" ng-hide="sumOfUsers[0] === undefined || sumOfUsers[1] === undefined">
					  <div class="col-sm-6 col-lg-4">Difference:</div>
					  <div class="col">{{differenceOfSums | number:2}}</div>
					</div>
					<div class="row" ng-hide="sumOfUsers[0] === undefined && sumOfUsers[1] === undefined">
					  <div class="col-sm-6 col-lg-4">{{fromToDisplay}}:</div>
					  <div class="col"><strong>{{finalDebt | number:2}}</strong></div>
					</div>
					
					<div class="row">
						<div class="col-sm mb-3">
							View past <a href="invoiceList.php">invoices.</a>
						</div>
					</div>
					
				</div>
			</div>
			<div class="row">
				<div class="col-sm">
					<table class="table table-bordered">
						<tr>
							<th>Id</th>
							<th>Date</th>
							<th>Amount</th>
							<th>Notes</th>
							<th>UserName</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
						<tr ng-repeat="x in names">
							<td>{{x.id}}</td>
							<td>{{x.date | dateToISO | date:'dd.MM.yyyy, H:mm'}}</td>
							<td>{{x.amount | number:2}}</td>
							<td>{{x.notes}}</td>
							<td>{{x.name}}</td>
							<td>
								<button class="btn btn-success btn-sm" ng-click="update_data(x.id, x.amount, x.notes, x.user)">
									<span class="glyphicon glyphicon-edit"></span> Edit
								</button>
							</td>
							<td>
								<button class="btn btn-danger btn-sm" ng-click="delete_data(x.id)">
									<span class="glyphicon glyphicon-trash"></span> Delete
								</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="row" ng-hide="sumOfUsers[0] === undefined && sumOfUsers[1] === undefined">
				<div class="col-sm mb-3">
					<input type="submit" name="createInvoice" class="btn btn-primary btn-sm" ng-click="create_invoice()" value="Create Invoice">
				</div>
			</div>
		</div>

</div>


<script>  
	var app = angular.module("sa_app", []);
	app.controller("controller", function($scope, $http) {
		$scope.btnName = "Insert";
		$scope.insert = function() {
			if($scope.amount != null) {
				$scope.amount = $scope.amount.replace(',', '.');
			}
			if ($scope.amount == null || $scope.amount <= 0 || isNaN($scope.amount)) {
				alert("Enter the (positive) amount");
			} else if ($scope.notes == null) {
				alert("Enter the notes");
			} else if ($scope.user == null) {
				alert("Enter the user");
			} else {
				$http.post(
					"insert.php", {
						'amount': $scope.amount,
						'notes': $scope.notes,
						'user': $scope.user,
						'btnName': $scope.btnName,
						'id': $scope.id
					}
				).success(function(data) {
					$('#success_alert').show('fade');
					$('#alert_text').text(data);
					setTimeout(function () {
						$('#success_alert').hide('fade');
					}, 5000);
					$scope.amount = null;
					$scope.notes = null;
					$scope.user = null;
					$scope.btnName = "Insert";
					$scope.show_data();
				});
			}
		}
		$scope.show_data = function() {
			$http.get("display.php")
				.success(function(data) {
					$scope.names = data;
				});
				
			$http.get('user.php').
				success(function(data) {
					$scope.users = data;
				});
			$scope.show_invoice_data();
		}
		$scope.create_invoice = function() {
			if (confirm("Are you sure you want to create a invoice?")) {
				$http.get("createInvoice.php")
				.success(function(data) {
					// TODO: create errormessage
					$('#success_alert').show('fade');
					$('#alert_text').text(data);
					setTimeout(function () {
						$('#success_alert').hide('fade');
					}, 5000);
					$scope.show_data();
				});
			}
		}
		$scope.show_invoice_data = function() {
			$http.get("showInvoice.php")
				.success(function(data) {
					//TODO: make this more readable.
					
					$scope.sumOfUsers = data;
					
					if (data === undefined || data.length == 0) {
						return; // no user entered a bill
					} else if (data.length < 2) {
						$scope.fromToDisplay = "only user gets";
						$scope.finalDebt = $scope.sumOfUsers[0].userSum/2;
					} else {
						$scope.differenceOfSums = Math.abs(Number($scope.sumOfUsers[0].userSum) - Number($scope.sumOfUsers[1].userSum));
						$scope.differenceOfSums = Math.round($scope.differenceOfSums * 100) / 100;
						$scope.finalDebt = $scope.differenceOfSums/2;
						$scope.finalDebt = Math.round($scope.finalDebt * 100) / 100;
						
						if (Number($scope.sumOfUsers[0].userSum) > Number($scope.sumOfUsers[1].userSum)) {
							$scope.fromToDisplay = $scope.sumOfUsers[1].name 
								+ " (pays) -> " 
								+ $scope.sumOfUsers[0].name
						} else if (Number($scope.sumOfUsers[0].userSum) < Number($scope.sumOfUsers[1].userSum)) {
							$scope.fromToDisplay = $scope.sumOfUsers[0].name 
								+ " (pays) -> " 
								+ $scope.sumOfUsers[1].name
						} else {
							$scope.fromToDisplay = "equal bills";
						}
					}
				});
		}
		$scope.update_data = function(id, amount, notes, user) {
			$scope.id = id;
			$scope.amount = amount;
			$scope.notes = notes;
			$scope.user = user;
			$scope.btnName = "Update";
		}
		$scope.delete_data = function(id) {
			if (confirm("Are you sure you want to delete?")) {
				$http.post("delete.php", {
						'id': id
					})
					.success(function(data) {
						// TODO: create errormessage
						$('#success_alert').show('fade');
						$('#alert_text').text(data);
						setTimeout(function () {
							$('#success_alert').hide('fade');
						}, 5000);
						$scope.show_data();
					});
			} else {
				return false;
			}
		}
	});
	
	$('#linkClose').click(function () {
        $('#success_alert').hide('fade');
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
