# smstome
api for smstome.com virtual phone site 
# Example
```nim
import asyncdispatch, smstome, json, strutils
let data = waitFor country_list()
let countries = data["data"]
for country in countries:
  echo country["name"].getStr()
  echo country["id"]
  echo country["order"]
  echo ".".repeat(40)
```

# Launch (your script)
```
nim c -d:ssl -r  your_app.nim
```
