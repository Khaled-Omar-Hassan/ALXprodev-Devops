#!/bin/bash

jq -r '
  . as $p |
  "\(.name | ascii_upcase[0])\(.name[1:]) is of type \($p.types[0].type.name | ascii_upcase), weighs \(.weight / 10)kg, and is \(.height / 10)m tall."
' data.json
