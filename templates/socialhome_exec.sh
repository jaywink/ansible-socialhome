#!/usr/bin/env bash
source /home/{{ socialhome_os_user}}/venv/bin/activate
cd /home/{{ socialhome_os_user}}/socialhome
export `cat env.local`
$@
