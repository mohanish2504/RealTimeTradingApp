# Backend Setup

## Changes in Env files

if you are running this in local. Please change host
`kafka` to `127.0.0.1` in env files.

Since i was facing issues with go maintaining env file on parent package I have to create each individual `.env` file for the projects

Make changes here:
1. backend/.env
2. producer/.env
3. app/.env

## Starting up the project.

To start the backend project it just requires simple docker compose command

<code> sudo docker-compose up -d --build</code>

run above command in your backend. This pull and build required services.
