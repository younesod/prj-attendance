# PRJ 4 Tasks
## Members

- Yassine
- Ibrahim
- Mohamed
- Younes

# 0 - After a clone

```
cp .env.example .env
composer update
php artisan key:generate
```

## .env configuration
```
DBDATABASE=database.sqlite
```

# 1 - Dockerise

```
docker build -t app .
docker run -p 5000:8069 -t app
```

[See](http://localhost:5000/)
