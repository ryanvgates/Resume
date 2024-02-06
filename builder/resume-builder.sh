#!/bin/bash

set -eo pipefail

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
      WORKING_DIRECTORY="$2"
      shift # past argument
      shift # past value
      ;;
    -*|--*)
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
echo ""
echo "TEMPLATE DIRECTORY    = ${TEMPLATE_DIRECTORY}"
echo "COMPANY               = ${COMPANY}"
echo "ROLE                  = ${ROLE}"
echo "ID                    = ${ID}"
echo "WORKING DIRECTORY     = ${WORKING_DIRECTORY}"
printf '=%.0s' {1..100}
echo ""

APPLICATION_PATH="${WORKING_DIRECTORY}/${COMPANY}/${ROLE}/${ID}"

echo "Creating directory ${APPLICATION_PATH}"
mkdir --parents "${APPLICATION_PATH}"

echo "Copying *.tex templates from ${TEMPLATE_DIRECTORY} to ${APPLICATION_PATH}"
cp -r "${TEMPLATE_DIRECTORY}/"*.tex "${TEMPLATE_DIRECTORY}/enumitem.sty" "${APPLICATION_PATH}"

exit 0;