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


## 4. BELOW AVERAGE STUDENT (POST) (Teacher Only)

### Endpoint URL
```bash
/api/v1/report/below-average-student
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
    "0": {
        "student_id": 1,
        "name": "Agus",
        "grade": 1,
        "performances": [
            {
                "subject_id": 1,
                "subject_name": "Math",
                "score": 76.66666666666667,
                "avg": 79.33333333333333
            },
            {
                "subject_id": 3,
                "subject_name": "Indonesian",
                "score": 76.5,
                "avg": 86.3
            }
        ]
    },
    "5": {
        "student_id": 6,
        "name": "Asep",
        "grade": 1,
        "performances": [
            {
                "subject_id": 1,
                "subject_name": "Math",
                "score": 76.33333333333333,
                "avg": 79.33333333333333
            },
            {
                "subject_id": 2,
                "subject_name": "English",
                "score": 85,
                "avg": 86
            }
        ]
    },
    "8": {
        "student_id": 9,
        "name": "Ucu",
        "grade": 1,
        "performances": [
            {
                "subject_id": 1,
                "subject_name": "Math",
                "score": 75.33333333333333,
                "avg": 79.33333333333333
            },
            {
                "subject_id": 3,
                "subject_name": "Indonesian",
                "score": 84,
                "avg": 86.3
            }
        ]
    },
    "9": {
        "student_id": 10,
        "name": "Bebeb",
        "grade": 1,
        "performances": [
            {
                "subject_id": 2,
                "subject_name": "English",
                "score": 83,
                "avg": 86
            }
        ]
    }
}
```


