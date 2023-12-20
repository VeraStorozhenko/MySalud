Basic functionality for Salud Application

Functionality:
- 2 Roles: Patient and Doctor.
- Patient and Doctor can sign-in and sign-up.
- Doctor can see: 
  - his Appointments list with patient info,
    appointment date and photos attached by Patients.
- Patient can see: 
  - appointments list with different doctors.
  - directory: list of all registered doctors. Patient can start a new 3D
    appointment through this list. This page also contain a
    search by doctor name and/or city.
- Some Rspec tests

> Starter Kit to build modern Rails applications fast

Powered by:

- [Rails](https://rubyonrails.org)
- [Ralix](https://github.com/ralixjs/ralix)
- [Tailwind CSS](https://tailwindcss.com)
- [PostgreSQL](https://www.postgresql.org)
- [Turbo](https://turbo.hotwired.dev)
- [esbuild](https://esbuild.github.io)

## Install

Clone this repository (or use the GitHub *template* button), then `cd` into the folder and run:

> bin/setup

If you dont have postgres run:

> gem install pg -v '1.5.3' --source 'https://rubygems.org/'

## Run

Start the development server:

> bin/dev

