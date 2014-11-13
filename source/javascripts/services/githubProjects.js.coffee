angular.module("dgalarza").service "githubProjects", ($http) ->
  BASE_URL = "https://api.github.com/users/{{USERNAME}}/repos?callback=JSON_CALLBACK"

  getProjects: (username) ->
    $http.jsonp BASE_URL.replace("{{USERNAME}}", username)
