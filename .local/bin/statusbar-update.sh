#!/bin/sh

pkill -x sleep -P $(pgrep -x sh -P $(pgrep -x startdwm.sh))
