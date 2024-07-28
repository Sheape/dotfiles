#!/bin/sh

free -m | awk 'NR==2{rounded = sprintf("%.2f",$3/1000); print rounded}'
