```yaml
services:
  db:
    image: kedarmahesh/python-code-library-db:v1
    deploy:
      replicas: 1
    ports:
      - "3306:3306"
    networks:
      - mynetwork

  auth_service:
    image: kedarmahesh/python-code-library-auth:v1
    deploy:
      replicas: 1
    ports:
      - "5001:5001"
    networks:
      - mynetwork
    depends_on:
      - db

  book_service:
    image: kedarmahesh/python-code-library-book:v1
    deploy:
      replicas: 1
    ports:
      - "5002:5002"
    networks:
      - mynetwork
    depends_on:
      - db

  borrow_service:
    image: kedarmahesh/python-code-library-borrow:v1
    deploy:
      replicas: 1
    ports:
      - "5003:5003"
    networks:
      - mynetwork
    depends_on:
      - db

  frontend:
    image: kedarmahesh/python-code-library-frontend:v1
    deploy:
      replicas: 1
    ports:
      - "5000:5000"
    networks:
      - mynetwork
    depends_on:
      - auth_service
      - book_service
      - borrow_service

networks:
  mynetwork:
    driver: overlay
```
