var mysql = require("mysql");
var inquirer = require("inquirer")

var connection = mysql.createConnection({
  host: "localhost",

  // Your port; if not 3306
  port: 3306,

  // Your username
  user: "root",

  // Your password
  password: "password",
  database: "employee_tracker_db"
});

// connect to the mysql server and sql database
connection.connect(function (err) {
  if (err) throw err;
  // run the start function after the connection is made to prompt the user
  mainMenu();
});

function mainMenu() {
  inquirer
    .prompt({
      name: "userAction",
      type: "list",
      message: "What would you like to do?",
      choices: ["View the database", "Add to the database", "Update the database", "Exit"]
    })
    .then(function (answer) {
      // based on their answer, call the appropriate function
      if (answer.userAction === "View the database") {
        viewDatabase();
      }
      else if (answer.userAction === "Add to the database") {
        addtoDatabase();
      }
      else if (answer.userAction === "Update the database") {
        updateData();
      }
      else {
        connection.end();
      }
    });
}

// * View departments, roles, employees
function viewDatabase() {
  inquirer
    .prompt({
      name: "viewChoice",
      type: "list",
      message: "What would you like to view?",
      choices: ["department", "role", "employee", "Exit"]
    })
    .then(function (answer) {
      // based on their answer, display the corresponding table
      let viewChoice = answer.viewChoice;
      if (viewChoice === "Exit") {
        mainMenu()
      } else (
        viewData(viewChoice)
      )
    });
}

function viewData(viewChoice) {
  connection.query(`SELECT * FROM ${viewChoice}`, function (err, res) {
    if (err) throw err;
    console.table(res);
    mainMenu()
  });
}

// * Add departments, roles, employees
function addtoDatabase() {
  inquirer
    .prompt({
      name: "addChoice",
      type: "list",
      message: "What would you like to add?",
      choices: ["department", "role", "employee", "Exit"]
    })
    .then(function (answer) {
      // based on their answer, add to the corresponding table
      if (answer.addChoice === "department") {
        addDepartment();
      }
      else if (answer.addChoice === "role") {
        addRole();
      }
      else if (answer.addChoice === "employee") {
        addEmployee();
      } 
      else {
        mainMenu();
      }
    }

    );
}

function addDepartment() {
  inquirer
    .prompt({
      name: "addDept",
      type: "input",
      message: "Enter the name of the department you want to add",
    })
    .then(function (answer) {
      connection.query(
        "INSERT INTO department SET?",
        {
          name: answer.addDept,
        },
        function (err) {
          if (err) throw err;
          console.log("Your department as been added!");
          mainMenu();
        }
      );
    });
}

function addRole() {
  inquirer
    .prompt(
      [{
        name: "roleTitle",
        type: "input",
        message: "Enter the name of the role you want to add",
      },
      {
        name: "salary",
        type: "number",
        message: "Enter the salary",
      },
      {
        name: "departmentId",
        type: "number",
        message: "Enter the department id",
      },
      ])
    .then(function (answer) {
      connection.query(
        "INSERT INTO role SET?",
        {
          title: answer.roleTitle,
          salary: answer.salary,
          department_id: answer.departmentId
        },
        function (err) {
          if (err) throw err;
          console.log("Your role as been added!");
          mainMenu();
        }
      );
    });
}

function addEmployee() {
  inquirer
    .prompt(
      [{
        name: "first_name",
        type: "input",
        message: "Enter the employee's first name",
      },
      {
        name: "last_name",
        type: "input",
        message: "Enter the employee's last name",
      },
      {
        name: "role_id",
        type: "number",
        message: "Enter the role id",
      },
      {
        name: "manager_id",
        type: "number",
        message: "Enter the manager id",
      }
      ])
    .then(function (answer) {
      connection.query(
        "INSERT INTO employee SET?",
        {
          first_name: answer.first_name,
          last_name: answer.last_name,
          role_id: answer.role_id,
          manager_id: answer.manager_id
        },
        function (err) {
          if (err) throw err;
          console.log("Your employee as been added!");
          mainMenu();
        }
      );
    });
}

// // * Update employee roles
function updateData() {
  // query the database for all employees
  connection.query("SELECT * FROM employee", function(err, results) {
    if (err) throw err;
    // once you have the employees, prompt the user for which employee they would like to update
    inquirer
      .prompt([
        {
          name: "employee",
          type: "rawlist",
          choices: function() {
            //employees are pushed into an array to display all employees
            var employeeArray = [];
            for (var i = 0; i < results.length; i++) {
              employeeArray.push(results[i].first_name);
            }
            return employeeArray;
          },
          message: "Which employee would you like to update?"
        },
        {
          name: "employeeRole",
          type: "number",
          message: "Please update the employee role"
        }
      ])
      .then(function(answer) {
        // get the information of the chosen employee
        var newRole;
        for (var i = 0; i < results.length; i++) {
          if (results[i].first_name === answer.employee) {
            newRole = results[i];
          }
        }
          connection.query(
            "UPDATE employee SET ? WHERE ?",
            [
              {
                role_id: parseInt(answer.employeeRole)
              },
              {
                id: newRole.id
              }
            ],
            function(error) {
              if (error) throw err;
              console.log("Employee updated successfully!");
              mainMenu();
            }
          );
      });
  });
}