#!/bin/sh

for c in {1..10000} ; do
	curl --location --request POST 'http://localhost:5002/order' \
	--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJMQlJBVU41IiwianRpIjoiMjkwMmJjOWEtYThhYi00MmRiLThiMmQtNTdhMjEyMWE1ZTYyIiwiZW1haWwiOiJsdWthc0BicmF1bjUuYXQiLCJnaXZlbl9uYW1lIjoibGJyYXVuNSIsImlkIjoiMDg3NGFiYzItYTdiNi00NTJmLWI4ZTItY2QxNWE0OTUwMWJhIiwibmJmIjoxNTg4MzYzMTI4LCJleHAiOjE1ODgzNzAzMjgsImlhdCI6MTU4ODM2MzEyOCwiaXNzIjoid3d3LmZhcm1lcnpvbi5hdCIsImF1ZCI6Ind3dy5mYXJtZXJ6b24uYXQifQ.HxWU3F2lxn8tVbgp54yHWGH_-ha2jvufyD-bgu0Ovyw' \
	--header 'Content-Type: application/json' \
	--data-raw '{
	    "address": {
		"street": "Paradiesstraße",
		"doorNumber": "18B",
		"city": {
		    "zipCode": "4232",
		    "name": "Hagenberg"
		},
		"state": {
		    "name": "Oberösterreich"
		},
		"country": {
		    "name": "Österreich",
		    "code": "AT"
		}
	    },
	    "payment_method": {
		"method": "Kreditkarte"
	    },
	    "articles": [
		{ "article_id": 1, "amount": 10 },
		{ "article_id": 2, "amount": 12 }
	    ]
	}'
done
