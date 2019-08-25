// This is a closure function https://medium.com/javascript-scene/master-the-javascript-interview-what-is-a-closure-b2f0d2152b36
(function() {

    var name = document.getElementById('name');
    var phno = document.getElementById('phno');
    var email = document.getElementById('email');
    var department1 = document.getElementById('department1');
    var department2 = document.getElementById('department2');
    var submit = document.getElementById('btn');
    var em = /[ !#$%^&*()_+\-=\[\]{};':"\\|,<>\/?]/;
    
    var initialize = function() {
    /*
      1. Add all your event bindings here. Please avoid binding events inline and add your event listeners here.

      onSubmit callback
      disableDuplicateSecondaryDepartment callback,...
    */
    
    department1.addEventListener("change",disableDuplicateSecondaryDepartment);
    submit.addEventListener("click",onSubmit);
  };

  var disableDuplicateSecondaryDepartment = function(event) {
    // 2. in department2, Should disable the option selected in department1
    var n;
    function unlockothers(n)
    {
      for(var i=0;i<=3;i++)
      {
        if(i != n)
          department2.options[i].disabled = false;
      }
    }
    switch(department1.value)
    {
      case 'EEE' :  department2.options[0].disabled = true;
                    unlockothers(0);
                    break;
      case 'MECH' : department2.options[1].disabled = true;
                    unlockothers(1);
                    break;
      case 'CSE' :  department2.options[2].disabled = true;
                    unlockothers(2);
                    break;
      case 'CIVIL' :  department2.options[3].disabled = true;
                    unlockothers(3);
                    break;
    }
  }

  var constructData = function() {
    var data = {};

    data[name.name] = name.value;
    data[phno.name] =phno.value;
    data[email.name] = email.value;
    data[department1.name] = department1.value;
    data[department2.name] = department2.value;
    // 3. Construct data from the form here. Please ensure that the keys are the names of input elements
    
    return data;
  }

  var validateResults = function(data) {
    var isValid = true;
    // 4. Check if the data passes all the validations here
    if(data.name.length > 100)
      isValid = false;
    else if(data.phno.length > 10)
      isValid = false;
    else if((!data[email.name].endsWith('@college.edu')) || em.test(data[email.name]))
      isValid = false;
    else if(data.department1 == data.department2)
      isValid = false;

    return isValid;
  };

  var onSubmit = function(event) {
    // 5. Figure out how to avoid the redirection on form submit

    var data = constructData();
    if (validateResults(data)) {
      printResults(data);
    } else {
      var resultsDiv = document.getElementById("results");
      resultsDiv.innerHTML = '';
      resultsDiv.classList.add("hide");
    }
  };

  var printResults = function(data) {
    var constructElement = function([key, value]) {
      return `<p class='result-item'>${key}: ${value}</p>`;
    };

    var resultHtml = (Object.entries(data) || []).reduce(function(innerHtml, keyValuePair) {
      debugger
      return innerHtml + constructElement(keyValuePair);
    }, '');
    var resultsDiv = document.getElementById("results");
    resultsDiv.innerHTML = resultHtml;
    resultsDiv.classList.remove("hide");
  };

  /*
    Initialize the javascript functions only after the html DOM content has loaded.
    This is to ensure that the elements are present in the DOM before binding any event listeners to them.
  */
  document.addEventListener('DOMContentLoaded', initialize);
})();
