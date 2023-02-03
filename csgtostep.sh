#!/bin/bash

# ──────────────────────────────────────────────────────────────────────────

usage="$(basename "$0") [-h] [INPUT] [OUTPUT]
Converts a CSG file (\".csg\" extension) to a STEP file (\".step\" extension) using FreeCAD. The input file name with extension [INPUT] must have the extension \".csg\". The output file name with extension [OUTPUT] must have the extension \".step\". Further commands are listed below:
    -h  shows this help text"

# ──────────────────────────────────────────────────────────────────────────

while getopts ":h" opt; do
    case ${opt} in
        h)
            echo "$usage"
            exit 1
            ;;
        \?)
            echo "Invalid option: $OPTARG" 1>&2
            echo "$usage"
            exit 1
            ;;
    esac
done
shift $((OPTIND -1))

# ──────────────────────────────────────────────────────────────────────────

INPUT=$1
OUTPUT=$2

# ──────────────────────────────────────────────────────────────────────────

if [ ! "$INPUT" ]; then
    echo "Input file must be provided."
    echo ""
    echo "$usage"
    exit 1
fi

# ──────────────────────────────────────────────────────────────────────────

docker run --rm --volume "$(pwd):/data" dkllrjr/csgtostep:latest $INPUT $OUTPUT
