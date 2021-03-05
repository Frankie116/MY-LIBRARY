----------------------------------------------------------------------------

Project: MobileApp1 - [Incomplete and updates currently on hold]

Overall Purpose: To create an iPhone mobile app that can register a hair model for an agency.
The agency should be able to browse models and select various models for upcoming hair
shows.  Once a model is chosen, the agency can request the model to attend if she is available.
Hair shows and models are international.  Models will have the app installed on their iPhone 
and agency can view the nearest models to the shows based on gps location.

This project is primarily focused on regisetering and viewing models.  Further functionality 
will be added at a later date.

Author:  Frank Effrim-Botchey

----------------------------------------------------------------------------

- User/agency creates a user profile and user can then login using AWS Cognito. [done]
- User's statistics & personal details can be uploaded to dynamoDB via the mobile app. [done]
- User's ZCards (photo portfolio) & catwalk videos are stored securely on S3 [done]
- Agency can view all/indivdual models details & S3 media. [done]
- Agency can register a show.
- Agency can execute a query to list 'nearest users to show' based on location (user permission to view loaction required).
- Agency can select models for shows.
- User receives an invite to casting via SNS notification.
- User accepts invite and receives a QR code.
- User is registered for show and will receive/acknowledge reminders leading up to show date.
- QR code used to permit entry to the user on show date.
- Agency registers user completed show.
- Agency pays user via online bank transaction.







