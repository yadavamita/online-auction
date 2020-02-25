# Online Auction Project

This is a mini demo project for online auction with basic functionality given below. There are three modules in this project.

`Module name: Registration and Login` 
1. A user can register with name (that must be unique), email_id(unique) and password.
2. A user can login with email and password.

`Module name: Admin operation `  

If user is admin(user_id =1, public_name=admin, password=Abc111) then he can do the following:

a. Delete an order from trade list.  
b. List all registered users.

`Module name: Enter transactions`
 
After successful login, user enters the following info, via a form, to the "trading"  table: 
 
a.Quantity (from 1 to 100,000)  
b.Price (from $0.01 to $1000,000.00)  

User can display trading table, with highest price showing on top.

## Running the application

Prerequisites should installed on your system:
1. Java 1.8
2. Mysql 5.7
3. Apache Tomcat 8.5
4. Any suitable IDE (I mostly prefer IntelliJ but you can go with Netbeans also)

##### Note: Create a database in your mysql named `online_auction` before executing the application.

### IntelliJ

1. Go to the Run -> Edit Configurations -> click on `+` icon and 
2. select Maven -> Give any name you want to this configuration
3. In parameters, write `tomcat7:run` in command line
4. scroll down to before launch and set run maven goal and write `clean`
5. apply -> ok
6. run the application with this named configuration and can check with `Localhost:8080`