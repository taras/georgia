echo '{"tag":"","packages":[]}' > published.json

echo $(jq '.packages[.packages | length] |= . + {"name": "test", "version": "9.9.9"}' ~/../workspace/published.json) > ~/../workspace/published.json

pkg=hiya

echo $(jq --arg test "$pkg" '.packages[.packages | length] |= . + {"name":$test,"version":"1.1.1"}' published.json) > published.json

echo $(jq '.tag = "hi"' example.json) > example.json

echo $(jq --arg TEST "$tag" '.tag = $TEST' published.json) > published.json
