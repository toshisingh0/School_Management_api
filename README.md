# School Management System (Rails)

A web application and API to manage schools, courses, batches, and students with multiple user roles.

---

## User Roles

**Admin**  
- Create schools and SchoolAdmins.  

**SchoolAdmin**  
- Update school info, create courses & batches.  
- Add students and approve/deny enrolment requests.  

**Student**  
- Request enrolment in a batch.  
- View classmates and batch progress.  

---

## Tech Stack

- Ruby on Rails 7  
- PostgreSQL
- Authentication: Custom token-based login using `bcrypt` and `jwt`  
- Authorization: Role-based access using `enum` in User model + `pundit`  
- API Testing: Postman (Tests tab)

---

## Installation

```bash
git clone <repo-url>
cd school-management-system
bundle install
rails db:create db:migrate db:seed
rails server
