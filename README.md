# keycloak-sha1
Add SHA1 hashing support to Keycloak.

## Requirements

- Java 11
- Maven 3.6
- Keycloak 22.0.0

## Building

- Run `mvn package`
- It should generate a JAR archive under `./target/keycloak-sha1.jar`

## Deploying to Keycloak (Docker version only)

1. Move the built JAR file to Keycloak's directory `/opt/keycloak/providers/`
2. Build Dockerfile from docker compose

## Create new user using Keycloak's API
> Needs a service account configured with Authorization and Client Authentication flow

```shell
curl --location 'http://localhost:8080/admin/realms/master/users' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJsMW9hRE5vbks4QVhnemVMVjloLWtoSERjRGdmMm5SaWxsblJPN2xuWEFNIn0.eyJleHAiOjE2OTUyMTc2NDUsImlhdCI6MTY5NTIxNzU4NSwianRpIjoiZDI5MmQ1ZmYtM2UyNy00MmRjLWFkNWItNGJiZWExYTMxODg0IiwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo4MDgwL3JlYWxtcy9tYXN0ZXIiLCJhdWQiOlsibWFzdGVyLXJlYWxtIiwiYWNjb3VudCJdLCJzdWIiOiI1MzY0MzIyZS1kZDExLTQ2ZWItOWJmMi02ZjcxOGE2NjQyZmMiLCJ0eXAiOiJCZWFyZXIiLCJhenAiOiJtaWRkbGV3YXJlIiwiYWNyIjoiMSIsImFsbG93ZWQtb3JpZ2lucyI6WyIvKiJdLCJyZWFsbV9hY2Nlc3MiOnsicm9sZXMiOlsiZGVmYXVsdC1yb2xlcy1tYXN0ZXIiLCJvZmZsaW5lX2FjY2VzcyIsInVtYV9hdXRob3JpemF0aW9uIl19LCJyZXNvdXJjZV9hY2Nlc3MiOnsibWFzdGVyLXJlYWxtIjp7InJvbGVzIjpbIm1hbmFnZS11c2VycyJdfSwiYWNjb3VudCI6eyJyb2xlcyI6WyJtYW5hZ2UtYWNjb3VudCIsIm1hbmFnZS1hY2NvdW50LWxpbmtzIiwidmlldy1wcm9maWxlIl19LCJtaWRkbGV3YXJlIjp7InJvbGVzIjpbInVtYV9wcm90ZWN0aW9uIl19fSwic2NvcGUiOiJwcm9maWxlIGVtYWlsIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJjbGllbnRIb3N0IjoiMTcyLjIzLjAuMSIsInByZWZlcnJlZF91c2VybmFtZSI6InNlcnZpY2UtYWNjb3VudC1taWRkbGV3YXJlIiwiY2xpZW50QWRkcmVzcyI6IjE3Mi4yMy4wLjEiLCJjbGllbnRfaWQiOiJtaWRkbGV3YXJlIn0.EjAQMQLehLpaSp8D6lx636l3wspU5wSNZS5KIK1pC0VHDWbsYS_2T6zCflsoYqz-hakTgCckiDscbfUIpGScmqDQt0-aVzX-kb_4gqyx8PUsAiQcs9zwE2AiKvmdeH-Mgme2RhbdppWukpfJTIfMhV-M9P1pT7LdHD9SrXLrnbOii5rEIBoCoSKutCRzebA4KZbzE1ovXzg7TOpkfoiwy4aZhyQKCTePCnfafFg-2gC6xBT06xFJmnjZpkjiKigys_hJ7I4lYsig2gO-KcrJ7m5LxXKdP_HdU-c9FLCf1OvchaR26SJVpYmL6V1L7I4S2mH3xWkxNxDfmd75D4b5lw' \
--data-raw '{
    "username": "madruguinha",
    "email": "madruguinha@email.com",
    "firstName": "Madruga",
    "lastName": "Senhor",
    "requiredActions": [],
    "emailVerified": true,
    "groups": [],
    "enabled": true,
    "credentials": [
        {
            "type": "password",
            "algorithm": "SHA-1",
            "hashedSaltedValue": "e17d7c8ca045548d3bf7ad9eeb2f7ecf83654e78",
            "hashIterations": 10
        }
    ]
}'
```

## Login with created user
Now you can log in with username `madruguinha` and password `Zt72864b5` (it's the raw version of SHA-1 encoded `e17d7c8ca045548d3bf7ad9eeb2f7ecf83654e78`)

