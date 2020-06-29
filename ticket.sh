#!/bin/bash


curl  --request POST 'https://prod-28.eastus2.logic.azure.com:443/workflows/42517d4652c9446d8808fe0665c76088/triggers/request/paths/invoke?api-version=2016-10-01&sp=%2Ftriggers%2Frequest%2Frun&sv=1.0&sig=oqY1WrPZX1_xK23Tj0h4lthuYT0vltjyW8QyRmou_GU' --header 'Content-Type: application/json' --data-raw '{ "location": "20171-00" }'
