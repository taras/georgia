echo $(jq '.packages[.packages | length] |= . + {"name": "test", "version": "9.9.9"}' example.json) > example.json
