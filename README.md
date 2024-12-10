<<<<<<< HEAD
# CapstoneProjectDB

# Little Lemon data model
A data model provides a visual representation of data elements and illustrates the way they relate together. This helps you to understand how data is stored, accessed, updated and queried in the database. This will ensure consistency in data structure and help you to achieve a good level of data quality.

# Create a logical data model for Little Lemon you should:
* Identify the attributes of each entity.
* Define the primary keys to identify unique records of data in each table.
* Specify the foreign keys to create relevant relationships between tables.

# Deploying the Data Model in MySQL 
To deploy your data model in MySQL server, i develop the logical data model further. In other words, i create a physical data model with data types and constraints. Since the Little Lemon physical data model has been created, i can now synchronize it to MySQL server using the forward-engineer method. 
This can be done by launching the Forward Engineer to Database wizard from the Select Database tab. This creates the internal SQL schema to be executed in MySQL Workbench. 

# Creating SQL Queries to summarize and manage data
You have used MySQL Workbench SQL editor to write different queries including subqueries, virtual tables and join statements. Here are few examples with suggested solutions. Of course, you may have different database structure the requires different SQL queries.

# Tasks
1) Little Lemon asked you to create a virtual table called OrdersView that focuses on OrderID, Quantity and Cost with orders quantity of more than 2.
2) Little Lemon needed information from four tables on all customers with orders that cost more than $150. Your task was to extract the required information from each of the following tables by using the relevant JOIN clause: 
* Customers table: The customer id and full name.
* Orders table: The order id and cost.
* Menus table: The menus name.
* MenusItems table: Course name and starter name.
3) Little Lemon asked you to create a procedure called GetMaxQuantity() that displays the maximum ordered quantity in the orders table.
4) Little Lemon asked you to create few procedures to complete the following tasks:
* Make a booking using a procedure called MakeBooking(), 
* Check a booking using a procedure called CheckBooking(), 
* Cancel booking using a procedure called CancelBooking(),
* and update booking using a procedure called UpdateBooking().


# Data Analytics with Tableau

# Tasks
1) Create a bar chart that shows customers sales and filter data based on sales with at least $70.
2) You should create a line chart to show the sales trend from 2019 to 2022. Your chart should show the trend of sales as shown below.
3) You need to create a Bubble chart of sales for all customers. The chart should show the names of all customers. Once you roll over a bubble, the chart should show the name, profit.
4) Little Lemon need to create a bar chart to compare the sales of the three different cuisines. Help them out by creating a Bar chart that shows the sales of the Turkish, Italian and Greek cuisines.
You need to display sales data for 2020, 2021, and 2022 only. 
Each bar should also display the profit of each cuisine.
5) In this task, you are required to create an interactive dashboard that combines the Bar chart and the Bubble chart. Once you click a bar, and roll over the related bubble, the name, sales and profit figures should be displayed in the Bubble chart as shown below.

# Set up the client project with Python
Create Python, Jupyter, Connector/python and version control to set up the client project.

# Steps
1) Step 1: Import the mysql connector class to connect with the database:

import mysql.connector as connector

Step 2: Use the connect class and provide the appropriate credentials:

connection = connector.connect(user="mario", password="cuisine")

Step 3: Instantiate an instance of the cursor class:

cursor = connection.cursor()

Step 4: Point the cursor at the Little Lemon database:

cursor.execute("USE little_lemon")

Step 5: Create an SQL query that identifies the target data from the bookings and orders table and filter it on the billamount variable

Step 6: Call the cursor.execute method to run the statement:

cursor.execute(join_query)

Step 7: Fetch the results and store them in a variable called results:

results = cursor.fetchall()

Step 8: Print the column names and results returned:

print(cursor.column_names)
print(results)






=======
# Getting Started with Create React App

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

## Available Scripts

In the project directory, you can run:

### `npm start`

Runs the app in the development mode.\
Open [http://localhost:3000](http://localhost:3000) to view it in your browser.

The page will reload when you make changes.\
You may also see any lint errors in the console.

### `npm test`

Launches the test runner in the interactive watch mode.\
See the section about [running tests](https://facebook.github.io/create-react-app/docs/running-tests) for more information.

### `npm run build`

Builds the app for production to the `build` folder.\
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.\
Your app is ready to be deployed!

See the section about [deployment](https://facebook.github.io/create-react-app/docs/deployment) for more information.

### `npm run eject`

**Note: this is a one-way operation. Once you `eject`, you can't go back!**

If you aren't satisfied with the build tool and configuration choices, you can `eject` at any time. This command will remove the single build dependency from your project.

Instead, it will copy all the configuration files and the transitive dependencies (webpack, Babel, ESLint, etc) right into your project so you have full control over them. All of the commands except `eject` will still work, but they will point to the copied scripts so you can tweak them. At this point you're on your own.

You don't have to ever use `eject`. The curated feature set is suitable for small and middle deployments, and you shouldn't feel obligated to use this feature. However we understand that this tool wouldn't be useful if you couldn't customize it when you are ready for it.

## Learn More

You can learn more in the [Create React App documentation](https://facebook.github.io/create-react-app/docs/getting-started).

To learn React, check out the [React documentation](https://reactjs.org/).

### Code Splitting

This section has moved here: [https://facebook.github.io/create-react-app/docs/code-splitting](https://facebook.github.io/create-react-app/docs/code-splitting)

### Analyzing the Bundle Size

This section has moved here: [https://facebook.github.io/create-react-app/docs/analyzing-the-bundle-size](https://facebook.github.io/create-react-app/docs/analyzing-the-bundle-size)

### Making a Progressive Web App

This section has moved here: [https://facebook.github.io/create-react-app/docs/making-a-progressive-web-app](https://facebook.github.io/create-react-app/docs/making-a-progressive-web-app)

### Advanced Configuration

This section has moved here: [https://facebook.github.io/create-react-app/docs/advanced-configuration](https://facebook.github.io/create-react-app/docs/advanced-configuration)

### Deployment

This section has moved here: [https://facebook.github.io/create-react-app/docs/deployment](https://facebook.github.io/create-react-app/docs/deployment)

### `npm run build` fails to minify

This section has moved here: [https://facebook.github.io/create-react-app/docs/troubleshooting#npm-run-build-fails-to-minify](https://facebook.github.io/create-react-app/docs/troubleshooting#npm-run-build-fails-to-minify)
>>>>>>> 6b76d15c37f9478f394b1a8eb02f9a3f9a25e9d2
