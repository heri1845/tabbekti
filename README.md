# API DOCUMENTATION


## 1. LOGIN (POST)

### Endpoint URL
```bash
/api/v1/users/login
```


### Request Header
```bash
Content-Type:application/json  
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


## 2. STUDENT PERFORMANCE (POST)

### Endpoint URL
```bash
/api/v1/report/performance
```


### Request Header
```bash
Content-Type:application/json  
token:Bearer value-of-the-user-token-header-from-login
```


### Request Body (Teacher Role)
```bash
{
    "grade":1
}
```

### Response Body
```bash
{
    "1": {
        "student_id": value,
        "name": value,
        "grade": value,
        "performances": [
            {
                "subject_id": value,
                "subject_name": value,
                "score": value,
                "avg": value
            },
            {
                "subject_id": value,
                "subject_name": value,
                "score": value,
                "avg": value
            }
        ]
    }
}
```

## 3. TOP STUDENT (POST) (Teacher Only)

### Endpoint URL
```bash
/api/v1/report/top-student
```


### Request Header
```bash
Content-Type:application/json  
token:Bearer value-of-the-user-token-header-from-login
```


### Request Body (Teacher Role)
```bash
{
    "grade":1,
    "limit":3
}
```

### Response Body
```bash
{
    "0": {
        "name": value,
        "grade": value,
        "point": value
    },
    "1": {
        "name": value,
        "grade": value,
        "point": value
    },
    "2": {
        "name": value,
        "grade": value,
        "point": value
    }
}
```


