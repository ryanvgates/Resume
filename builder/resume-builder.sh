#!/bin/bash

while [[ $# -gt 0 ]]; do
  case $1 in
    -tf|--template-fileextension)
      TEMPLATE_FILE="$2"
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

echo "TEMPLATE FILE     = ${TEMPLATE_FILE}"
echo "COMPANY           = ${COMPANY}"
echo "ROLE              = ${ROLE}"
echo "ID                = ${ID}"

exit 0;