#!/bin/sh
# The script sets environment variables helpful for PostgreSQL


#vacuumdb --analyze <db_name>


vacuumdb --analyze test
vacuumdb --analyze student
