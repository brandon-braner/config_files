#!/bin/sh

tmux new -d -s services
tmux rename-window Mono
tmux set -g pane-border-status top

# tmux select-pane -t 0 -T "Monolith"
tmux send-keys 'cd ~/projects/fieldnation'
tmux send-keys ENTER
tmux send-keys 'docker compose up'

tmux split-window -h

tmux select-pane -t 1 -T "UI"
tmux send-keys 'cd ~/projects/ui'
tmux send-keys ENTER
tmux send-keys 'docker compose up'

# copy this to create new windows for new services

tmux new-window
tmux rename-window "work-order-form"
tmux select-pane -t 0 -T "Work Order Form"
tmux send-keys 'cd ~/projects/work-order-form'
tmux send-keys ENTER
tmux send-keys 'docker compose up'

tmux new-window
tmux rename-window "recruitments"
tmux select-pane -t 0 -T "Recruitments"
tmux send-keys 'cd ~/projects/recruitments'
tmux send-keys ENTER
tmux send-keys 'docker compose up'


tmux new-window
tmux rename-window "user-profile"
tmux select-pane -t 0 -T "User Profile"
tmux send-keys 'cd ~/projects/user-profile'
tmux send-keys ENTER
tmux send-keys 'docker compose up'

tmux new-window
tmux rename-window "coverage"
tmux select-pane -t 0 -T "Coverage"
tmux send-keys 'cd ~/projects/coverage'
tmux send-keys ENTER
tmux send-keys 'docker compose up'

tmux new-window
tmux rename-window "qualifications"
tmux select-pane -t 0 -T "Qualifications"
tmux send-keys 'cd ~/projects/qualifications'
tmux send-keys ENTER
tmux send-keys 'docker compose up'


tmux new-window
tmux rename-window "ReactNative"
tmux select-pane -t 0 -T "ReactNative"
tmux send-keys 'cd /Users/brandonbraner/projects/fn_react_native'
tmux send-keys ENTER

# elasticlist logstash requeuer in one window
tmux new-window
tmux rename-window "logstash-elasticlist-requeuer"
tmux select-pane -t 0 -T "Elasticlist"
tmux send-keys 'cd ~/projects/elasticlist'
tmux send-keys ENTER
tmux send-keys 'docker compose up'

tmux split-window -h

tmux select-pane -t 1 -T "Logstash"
tmux send-keys 'cd ~/projects/logstash'
tmux send-keys ENTER
tmux send-keys 'docker compose up'

tmux split-window -h

tmux select-pane -t 2 -T "Requeuer"
tmux send-keys 'cd ~/projects/requeuer'
tmux send-keys ENTER
tmux send-keys 'docker compose up'

#go back to the first window (mono and ui)

tmux select-window -t Mono
tmux select-pane -t 0 
tmux split-window 
tmux send-keys 'cd /Users/brandonbraner/projects/fieldnation'
tmux send-keys ENTER
tmux send-keys 'make rabbitworker'

tmux attach -t services
