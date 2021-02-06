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
      // based on their answer, either call the bid or the post functions
      if (answer.userAction === "View the database") {
        viewDatabase();
      }
      else if (answer.userAction === "Add to the database") {
        addData();
      }
      else if (answer.userAction === "Update the database") {
        updateData();
      } else {
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
    choices: ["departments", "roles", "employees", "Exit"]
  })
  .then(function (answer) {
    // based on their answer, either call the bid or the post functions
    if (answer.viewChoice === "departments") {
      viewDepartments();
    }
    else if (answer.viewChoice === "roles") {
      viewRoles();
    }
    else if (answer.viewChoice === "employees") {
      viewEmployees();
    } else {
      connection.end();
    }
  });
}

// * Add departments, roles, employees
function addData() {

}
// * Update employee roles
function updateData() {

}