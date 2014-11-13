angular.module("dgalarza").
  controller "GithubProjectsCtrl", ($scope, githubProjects) ->
    setProjects = (response) ->
      $scope.projects = response.data

    githubProjects.getProjects("dgalarza").success(setProjects)
