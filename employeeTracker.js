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
        addtoDatabase();
      }
      // else if (answer.userAction === "Update the database") {
      //   updateData();
      // } 
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
      viewData(viewChoice)
    });
}

function viewData(viewChoice) {
  connection.query(`SELECT * FROM ${viewChoice}`, function (err, res) {
    if (err) throw err;
    console.table(res);
    connection.end();
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
      // else if (answer.addChoice === "role") {
      //   bidAuction();
      // }
      // else if (answer.addChoice === "employee") {
      //   bidAuction();
      // } 
      else {
        connection.end();
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
        "INSERT INTO department SET ?",
        {
          name: answer.name,
        },
        function (err) {
          if (err) throw err;
          console.log("Your department as been added!");
          connection.end();
          mainMenu();
        }
      );
    });
}

// // * Update employee roles
// function updateData() {

// }