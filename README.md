# RESTful API Kelompok 13

---

Tugas Pertemuan 11 Pemrograman API 2021
Dokumentasi

## Introduction

RESTful API kelompok 13 adalah operasi CRUD pada database yang mempunyai 2 tabel yaitu post dan category. Jadi, dengan menggunakan method-method di bawah ini anda bisa menambahkan post, melihat seluruh post, dan masih banyak lagi. Berikut merupakan tabel method pada API kami:

| Resource   | HTTP Method | URL                                       |
| ---------- | ----------- | ----------------------------------------- |
| categories | GET         | /api/categories/categories.php            |
| category   | GET         | /api/category/category.php?id=category_id |
|            | POST        | /api/category/category.php                |
|            | PUT         | /api/category/category.php                |
|            | DELETE      | /api/category/category.php                |
| posts      | GET         | /api/posts/posts.php                      |
| post       | GET         | /api/post/post.php?id=post_id             |
|            | POST        | /api/category/category.php                |
|            | PUT         | /api/post/post.php                        |
|            | DELETE      | /api/category/category.php                |

## REST API

### 1. categories

> Mendapatkan semua kategori

```
GET /api/categories/categories.php
```

#### Reponse

Success :

```
[
    {
        "id": "1",
        "name": "Tutorial"
    },
    {
        "id": "2",
        "name": "Teknologi"
    },
    …
]
```

Error :

```
{
    "message": "Kategori tidak ada"
}
```

### 2. category

- Category By ID

  > Mendapatkan sebuah kategori dengan menggunakan idnya.

  ```
  GET /api/category/category.php?id=category_id
  ```

  **Query Params**

  > id : id kategori
  > Contoh id = 3

  #### Reponse

  Success :

  ```
  {
    "id": "3",
    "name": "Web Development"
  }
  ```

  Error :

  ```
  {
    "message": "Kategori tidak ada"
  }
  ```

- Insert Category

  > Menambah kategori baru. API ini harus mempunyai request body yaitu raw data.

  ```
  POST /api/category/category.php
  ```

  **Contoh raw data**

  ```
  {
    "name": "Coba Kategori"
  }
  ```

  #### Reponse

  Success :

  ```
  {
    "message": "Kategori berhasil dibuat"
  }
  ```

  Error :

  ```
  {
    "message": "Kategori gagal dibuat"
  }
  ```

- Update Category

  > Mengubah kategori dengan request body tipe raw data.

  ```
  PUT /api/category/category.php
  ```

  **Contoh raw data**

  ```
  {
    "id": "3",
    "name": "PHP"
  }
  ```

  #### Reponse

  Success :

  ```
  {
    "message": "Kategori berhasil diubah"
  }
  ```

  Error :

  ```
  {
    "message": "Kategori gagal diubah"
  }
  ```

- Delete Category

  > Menghapus sebuah kategori dengan request body raw.

  ```
  DELETE /api/category/category.php
  ```

  **Contoh raw data**

  ```
  {
    "id": "3"
  }
  ```

  #### Reponse

  Success :

  ```
  {
    "message": "Kategori berhasil dihapus"
  }
  ```

  Error :

  ```
  {
    "message": "Kategori gagal dihapus"
  }
  ```

### 3. posts

Mendapatkan semua post

```
GET /api/posts/posts.php
```

#### Reponse

Success :

```
[
    {
        "id": "5",
        "title": "Apa itu Web Development?",
        "body": "Isi Post",
        "author": "Saiful Abroriy",
        "category_id": "3",
        "category_name": "Web Development",
        "created_at": "2021-11-17 10:04:04"
    },
    {
        "id": "6",
        "title": "Apa itu API?",
        "body": "Isi post",
        "author": "Eka Zuni Selviana",
        "category_id": "4",
        "category_name": "Pemrograman API",
        "created_at": "2021-11-17 10:04:04"
    },
    …
]

```

Error :

```
{
    "message": "Post tidak ada"
}
```

### 4. category

- Post By ID

  > Mendapatkan sebuah post dengan menggunakan idnya.

  ```
  GET /api/post/post.php?id=post_id
  ```

  **Query Params**

  > id : id post
  > Contoh id = 10

  #### Reponse

  Success :

  ```
  {
    "id": "10",
    "title": "Tutorial Django Python",
    "body": "Isi Post",
    "author": "Saiful Abroriy",
    "category_id": "1",
    "category_name": "Tutorial",
    "created_at": "2021-11-17 10:07:21"
  }
  ```

  Error :

  ```
  {
    "message": "Post tidak ada"
  }
  ```

- Insert Post

  > Menambah post baru. API ini harus mempunyai request body yaitu raw data.

  ```
  POST /api/post/post.php
  ```

  **Contoh raw data**

  ```
  {
    "title": "Coba Post",
    "body": "Coba Post",
    "author": "Saiful Abroriy",
    "category_id": "2"
  }
  ```

  #### Reponse

  Success :

  ```
  {
    "message": "Post berhasil dibuat"
  }
  ```

  Error :

  ```
  {
    "message": "Post gagal dibuat"
  }
  ```

- Update Post

  > Mengubah post dengan request body tipe raw data.

  ```
  PUT /api/post/post.php
  ```

  **Contoh raw data**

  ```
  {
    "id": "12",
    "title": "Coba Post 2",
    "body": "Coba",
    "author": "Saiful Abroriy",
    "category_id": "2"
  }
  ```

  #### Reponse

  Success :

  ```
  {
    "message": "Post berhasil diubah"
  }
  ```

  Error :

  ```
  {
    "message": "Post gagal diubah"
  }
  ```

- Delete Post

  > Menghapus sebuah post dengan request body raw.

  ```
  DELETE /api/post/post.php
  ```

  **Contoh raw data**

  ```
  {
    "id": "12"
  }
  ```

  #### Reponse

  Success :

  ```
  {
    "message": "Post berhasil dihapus"
  }
  ```

  Error :

  ```
  {
    "message": "Post gagal dihapus"
  }
  ```
