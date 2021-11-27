**API DOCUMENTATION**

**LOGIN (POST)**

**Endpoint URL**
http://localhost:3001/api/v1/users/login

**Request Headers**
Content-Type:application/json

**Request Body**
{  
  "email" : value,  
  "password" : value  
}

**Response Body**
{  
  "id" : value,  
  “username”: value,   
  “name”:value,  
  “email”:value,  
  “role”:value,  
  “token”:value  
}
