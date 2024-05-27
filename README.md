# User Management Portal

An facility for the management of users across multiple Stadium applications

- [User Management Portal](#user-management-portal)
  - [Version](#version)
  - [Setup](#setup)
  - [Adding Applications](#adding-applications)
  - [Application Authentication Methods](#application-authentication-methods)
  - [Known Issues](#known-issues)

## Version 
1.0 - initial

## Setup

1. Clone this repo
2. Create the SQL Server Database
   1. Add a database called "StadiumPortal"
   2. Run the script in the /database directory of this repo to create the database tables
3. Upload the application in your Stadium Application Manager (SAM) and configure
   1. Connection info
   2. Remaining application configurations
4. Log into the Portal application
   1. Open the "Users & Roles" module
   2. Create a Role called "PortalAdmin"
   3. Assign all application pages to the role
   4. Assign the "PortalAdmin" role to the admin user

![Portal Create Admin Role](images/portal-create-role.png)

## Adding Applications

1. Stadium Application Manager (SAM)
   1. Open the application you wish to add to the portal
   2. Go to the "User API" section
   3. Generate an API key

![SAM-UserAPIKey-Generation](images/SAM-UserAPIKey-Generation.png)

2. Portal
   1. Open the "Applications" page
   2. Select "Add Application"
   3. Give the application a name
   4. Add the base URL of the application (excluding the page name) to the Url field (e.g https://stadium.server.url/StadiumAppName/)
   4. Copy the API key generated in SAM to the "ApiKey" field
   5. Select the Authentication method of the application (more on [authentication methods](#application-authentication-methods))
   6. Open the "Manage" page of the application
   7. Select the "Fetch" button above the "Users" DataGrid to retrieve the application users and roles
   8. NOTE: At present only roles assigned to users can be fetched using the "User API", so make sure all roles are assigned to at least one user

![Portal-Fetch-Users-Button](images/Portal-Fetch-Users-Button.png)

## Application Authentication Methods

**Email & Password**

When assigning users to Stadium applications in the Portal, a temporary password is generated for each user. However, for security reasons, the Portal database does not store these passwords and does not display them when assigning users in bulk. 

If some applications are set up to use "Email & Password" authentication and you wish to assign users to them in bulk, it is necessary to configure the "Email Settings" in the "Server -> Configuration" section of SAM. This will allow users to securely set up their own password using the "Forgot Password" facility on the application. 

![SAM-Email-Config](images/SAM-Email-Config.png)

Alternatively, when users are added individually in the Portal, the temporary password is displayed in the Portal UI and can manually be sent to the respective user. 

![password-generation](images/password-generation.png)

**Single Sign-on (SSO)**

If your application access is controlled via an SSO server, it is advisable to also set up the Portal on the SSO server. 

## Known Issues
None as yet