#!/bin/bash

set -eou pipefail

while [[ $# -gt 0 ]]; do
  case $1 in
    -td|--template-directory)
      TEMPLATE_DIRECTORY="$2"
      shift # past argument
      shift # past value
      ;;
    -c|--company)
      COMPANY="$2"
      shift # past argument
      shift # past value
      ;;
    -r|--role)
      ROLE="$2"
      shift # past argument
      shift # past value
      ;;
    -id|--identification-number)
      ID="$2"
      shift # past argument
      shift # past value
      ;;
    -wd|--working-directory)
      WORKING_DIRECTORY="${2:-$(pwd)}"
      shift # past argument
      shift # past value
      ;;
    -*)
      echo "Unknown option $1"
      exit 1
      ;;
    *)
      POSITIONAL_ARGS+=("$1") # save positional arg
      shift # past argument
      ;;
  esac
done

printf '=%.0s' {1..100}
printf "TEMPLATE DIRECTORY    = %s\n" "$TEMPLATE_DIRECTORY"
printf "COMPANY               = %s\n" "$COMPANY"
printf "ROLE                  = %s\n" "$ROLE"
printf "ID                    = %s\n" "$ID"
printf "WORKING DIRECTORY     = %s\n" "$WORKING_DIRECTORY"
printf '=%.0s' {1..100}
printf "\n"

APPLICATION_PATH="${WORKING_DIRECTORY}/${COMPANY}/${ROLE}/${ID}"

printf "Creating directory %s\n" "$APPLICATION_PATH"
mkdir --parents "$APPLICATION_PATH"

printf "Copying *.tex templates from %s to %s \n" "$TEMPLATE_DIRECTORY" "$APPLICATION_PATH"
cp -r "${TEMPLATE_DIRECTORY}/"*.tex "${TEMPLATE_DIRECTORY}/enumitem.sty" "${APPLICATION_PATH}"

exit 0;
