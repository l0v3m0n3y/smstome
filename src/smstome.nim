import asyncdispatch, httpclient, json, strutils
const api = "https://smstome.com/api"
var headers = newHttpHeaders({
    "Connection": "keep-alive",
    "user-agent":"Dalvik/2.1.0 (Linux; U; Android 11; Haier Android TV DVB Build/RTM7.230903.069)",
    "Host": "smstome.com",
    "Content-Type": "application/json",
    "accept": "application/json"
  })

proc country_list*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = headers
    let response = await client.get(api & "/countries")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc get_phone_by_country*(country_id:int,page:int=1): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = headers
    let response = await client.get(api & "/countries/" & $country_id & "/phones-paginated?page=" & $page )
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc read_sms*(phone_id:int): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = headers
    let response = await client.get(api & "/phones/" & $phone_id & "/messages")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()
