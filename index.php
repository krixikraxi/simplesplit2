<!doctype html>
<html>
<head>
<meta charset="UTF-8"> 
<title>Splitwise 2</title>  
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>  
</head>  
<body>  
<div class="col-md-12">
	<h3 align="center">Splitwise 2</h3>
	<div ng-app="sa_app" ng-controller="controller" ng-init="show_data()">
		<div class="col-md-6">
		   	<label>Amount</label>
            <input type="text" name="amount" ng-model="amount" class="form-control">
            <br/>
            <label>Notes</label>
            <input type="text" name="notes" ng-model="notes" class="form-control">
            <br/>
            <label>User</label>
            <input type="text" name="user" ng-model="user" class="form-control">
            <br/>
            <input type="hidden" ng-model="id">
            <input type="submit" name="insert" class="btn btn-primary" ng-click="insert()" value="{{btnName}}">
		</div>
        <div class="col-md-6">
            <table class="table table-bordered">
                <tr>
                    <th>Id</th>
                    <th>Amount</th>
                    <th>Date</th>
                    <th>Notes</th>
					<th>UserName</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                <tr ng-repeat="x in names">
                    <td>{{x.id}}</td>
                    <td>{{x.amount}}</td>
                    <td>{{x.date}}</td>
                    <td>{{x.notes}}</td>
					<td>{{x.name}}</td>
                    <td>
                        <button class="btn btn-success btn-xs" ng-click="update_data(x.id, x.amount, x.notes, x.user)">
                            <span class="glyphicon glyphicon-edit"></span> Edit
                        </button>
                    </td>
                    <td>
                        <button class="btn btn-danger btn-xs" ng-click="delete_data(x.id)">
                            <span class="glyphicon glyphicon-trash"></span> Delete
                        </button>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<script>  
var app = angular.module("sa_app", []);
app.controller("controller", function($scope, $http) {
    $scope.btnName = "Insert";
    $scope.insert = function() {
        if ($scope.amount == null) {
            alert("Enter Your Amount");
        } else if ($scope.notes == null) {
            alert("Enter Your Notes");
        } else if ($scope.user == null) {
            alert("Enter Your User");
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
                alert(data);
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
                    alert(data);
                    $scope.show_data();
                });
        } else {
            return false;
        }
    }
});
</script>  
</body>  
</html>  
 