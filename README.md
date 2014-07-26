Identity Verification
=========

Using [BlockScore API](https://blockscore.com) to validate the user’s identity. A user must be able to sign up and verify their identity through a number of steps before being granted access to a portion of the site.

Requirements
----

- Use Devise for user registration
- Create a “success” page that’s only accessible to fully confirmed users
- A fully confirmed user has:
  - Registered
  - Successfully completed identity verification with BlockScore
  - Successfully completed knowledge based authentication (questions)
  - Verified email
- Rspec test suite

Notes
----

- Sign up for BlockScore to get a test API key
- Use SendGrid (free account) to send email
- Use Twitter bootstrap for the frontend
- Consider response time to end user
- Pretend you are writing production code with all the implications

Deliverable
----

- Github source
- Link to Heroku app