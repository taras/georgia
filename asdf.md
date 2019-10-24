echo '{"packages":[]}' > published.json

echo $(jq '.packages[.packages | length] |= . + {"name": "test", "version": "9.9.9"}' published.json) > published.json
