#!/bin/bash

set -euf -o pipefail
FILE="${HOME}/Pictures/screenshot_$(date +%Y%m%d_%H%M%S).png"
grim "${FILE}"
display "${FILE}"
