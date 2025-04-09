# User Management Portal <!-- omit in toc -->

This application serves three main purposes:

1. Facilitate the management of users across multiple Stadium applications
2. Enable the bulk management of users
3. Provide users with a dashboard containing all their Stadium applications

## TOC <!-- omit in toc -->

- [Version](#version)
- [Portal Setup](#portal-setup)
- [Adding Applications](#adding-applications)
- [Authentication Methods](#authentication-methods)

## Version 
2.0 - made for Stadium version 6.12+ (go [here](/pre6.12/) for previous versions)

2.1 Changed database table names & queries; updated modules from various repos; updated stylesheet css from px to rem

## Portal Setup

1. Clone this repo
2. Create the SQL Server Database
   1. Add a database called "StadiumPortal"
   2. Run the script in the [database](/database/) directory of this repo to create the database tables
3. Preview the application
   1. Open the application in a Stadium Designer v6.12 or higher
   2. Open 'Settings' in the Application Explorer and provide the connection string to the "StadiumPortal" database
   3. Select 'Preview'
4. Publish the application
   1. Configure the connection info to the "StadiumPortal" database
   2. Configure other application details
5. Access the Portal application
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
   3. Enter the application name
   4. Add the base URL of the application (excluding the page name) to the Url field (e.g https://stadium.server.url/StadiumAppName)
   4. Copy the API key generated in SAM to the "ApiKey" field
   5. For Email Authenticated applications, check the "Generate Password" checkbox

3. Users Import
   1. Select "Import" on the "Users" page to fetch all users of Linked Applications

## Authentication Methods

**Email & Password**

When assigning users to Stadium applications in the Portal, an initial password is generated for each user. 

For security reasons, the Portal database does not store generated passwords. Instead, passwords are added to text files and downloaded for manual distribution. 

When applications that are configured to use "Email & Password" authentication, it is advisable to configure the "Email Settings" in the "Server -> Configuration" section of SAM. This will allow users to define their own passwords using the "Forgot Password" facility. 

![SAM-Email-Config](images/SAM-Email-Config.png)

**Single Sign-on (SSO)**

If your application access is controlled via an SSO server, it is advisable to also add the Portal to the SSO server.
