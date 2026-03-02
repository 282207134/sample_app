#!/bin/bash
cd "$(dirname "$0")"
bin/rails db:migrate
