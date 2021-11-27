# API DOCUMENTATION


## 1. LOGIN (POST)

### Endpoint URL
```bash
/api/v1/users/login
```


### Content-Type
```bash
application/json
```


### Request Body
```bash
{  
  "email" : value,  
  "password" : value  
}
```

### Response Body
```bash
{  
  "id" : value,  
  “username”: value,   
  “name”:value,  
  “email”:value,  
  “role”:value,  
  “token”:value  
}
```


