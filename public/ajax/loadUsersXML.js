// Set up a dummy function so we don't pollute the global namespace
(function () {
    "use strict";
  
    var insertUsersXML = function(users) {
      var list = document.getElementById("userListXML");
      list.getElementsByClassName("noneMarker")[0].hidden = true;
      users.forEach(function(user){
        var newLI = document.createElement("li");
        var newText = document.createTextNode(user.lastName + ", " + user.firstName + ": " + user.email);
        newLI.appendChild(newText);
        list.appendChild(newLI);
      });
    };
  
  
    var xmlToUsers = function (userResponseXML) {
  
      var users = [];
      var userListXML = userResponseXML.getElementsByTagName("object");
  
      for (var i = 0; i < userListXML.length; i++) {
        var userXML = userListXML[i];
        var user = {
          firstName: userXML.getElementsByTagName("fname")[0].textContent,
          lastName: userXML.getElementsByTagName("lname")[0].textContent,
          email: userXML.getElementsByTagName("email")[0].textContent
        };
        users.push(user);
  
      }
      return users;
    };
  
    var loadUsersXML = function () {
      var ajax = new XMLHttpRequest();
      console.log("Click!");
  
      // Replace URL below with the URL for your server.
      //ajax.open("GET", 'http://localhost:3000/users.xml');
      ajax.open("GET", 'https://cis-658-bug-tracker-v2.herokuapp.com/users.xml');
      ajax.onreadystatechange = function () {
        console.log("Ajax state: " + ajax.readyState);
        if (ajax.readyState === 4 && ajax.status === 200) {
          console.log("Complete AJAX object:");
          console.log(ajax);
          var users = xmlToUsers(ajax.responseXML);
          insertUsersXML(users);
        } else if (ajax.readyState === 4 && ajax.status !== 200) {
          console.log("There was a problem.  Status returned was " + ajax.status);
        }
      };
  
      ajax.onerror = function () {
        console.log("There was an error!");
      };
  
      // Notice that send is asynchronous.  This method does not block,
      // instead, the code in onreadystatechange above runs when the call
      // is complete.
      ajax.send();
    };
  
  // Don't apply the event listeners until the document has loaded.
    document.addEventListener("readystatechange", function () {
      console.log("Ready:  " + document.readyState);
      if (document.readyState === "interactive") {
        var loadButton = document.getElementById("loadButtonXML");
        loadButton.addEventListener("click", loadUsersXML);
      }
    });
  })();