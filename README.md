# Salon Appointment Scheduler

Welcome to **Ayanna's Salon Appointment Scheduler**, a project completed as part of freeCodeCamp's Relational Database Certification course. This Bash script and PostgreSQL-based application allows customers to book salon services easily.

## Table of Contents
- [Overview](#overview)
- [Technologies Used](#technologies-used)
- [Features](#features)
- [Project Structure](#project-structure)
- [Setup](#setup)
- [Usage](#usage)
- [Example Output](#example-output)
- [License](#license)

---

## Overview

The Salon Appointment Scheduler is a database-driven application that:
- Provides a menu of salon services.
- Collects customer information (name and phone number).
- Schedules appointments with the desired service and time.

The project implements PostgreSQL for the backend database and Bash scripting for the frontend interaction. 

---

## Technologies Used

- **PostgreSQL**: To manage the salon's database (services, customers, appointments).
- **Bash Scripting**: To create the interactive interface.
- **freeCodeCamp Relational Database Concepts**: Framework for database design and query implementation.

---

## Features

- Dynamic menu of services.
- Records new customer information into the database.
- Books appointments based on customer and service selection.
- Displays appropriate messages for invalid inputs or existing records.

---

## Project Structure

The repository contains the following files:
- `examples.txt`: Sample outputs for reference.
- `salon.sql`: SQL dump file for setting up the database.
- `salon.sh`: Bash script for the scheduler application.

---

## Setup

### Prerequisites
Ensure the following are installed on your system:
- **PostgreSQL** (v12 or later)
- Bash shell

### Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/Salon-Appointment-Scheduler.git
   cd Salon-Appointment-Scheduler
   ```
2. Set up the database using the `salon.sql` dump file:
   ```bash
   psql -U postgres -f salon.sql
   ```
3. Make the Bash script executable:
   ```bash
   chmod +x salon.sh
   ```
4. Run the script:
   ```bash
   ./salon.sh
   ```

## Usage

- Select a service from the displayed menu.
- Provide your phone number.
- If you are a new customer, your name will be recorded.
- Choose a time for your appointment.
- Receive confirmation of your booking.

---

## Example Output

### Example 1:
```plaintext
~~~~~ MY SALON ~~~~~

Welcome to My Salon, how can I help you?

1) cut
2) color
3) perm
4) style
5) trim
10

I could not find that service. What would you like today?
1) cut
2) color
3) perm
4) style
5) trim
1

What's your phone number?
555-555-5555

I don't have a record for that phone number, what's your name?
Fabio

What time would you like your cut, Fabio?
10:30

I have put you down for a cut at 10:30, Fabio.
```

### Example 2:
```plaintext
~~~~~ MY SALON ~~~~~

Welcome to My Salon, how can I help you?

1) cut
2) color
3) perm
4) style
5) trim
2

What's your phone number?
555-555-5555

What time would you like your color, Fabio?
11am

I have put you down for a color at 11am, Fabio.
```

## License
This project is licensed under the MIT License. See the LICENSE file for details.
