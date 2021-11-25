<?php
  // HTTP Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');
  header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');

  include_once '../../config/Database.php';
  include_once '../../models/Post.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate blog post object
  $post = new Post($db);

  // get requst method
  $request_method = $_SERVER["REQUEST_METHOD"];

  switch ($request_method) {
    case 'GET':
      // Check parameter
      $post->id = isset($_GET['id']) ? $_GET['id'] : die();

      // Get single post
      $result = $post->read_single();

      $num = $result->rowCount();

      // Check if empty
      if($num > 0) {
        $posts_arr = array();

        $row = $result->fetch(PDO::FETCH_ASSOC);

        // Create array
        $post_arr = array(
          'id' => $post->id,
          'title' => $row['title'],
          'body' => $row['body'],
          'author' => $row['author'],
          'category_id' => $row['category_id'],
          'category_name' => $row['category_name'],
          'created_at' => $row['created_at']
        );

        // Make JSON
        print_r(json_encode($post_arr));    
      } else {
        echo json_encode(array('message' => "Post tidak ada"));
      }
      break;
    case 'POST':
      $data = json_decode(file_get_contents("php://input"));

      $post->title = $data->title;
      $post->body = $data->body;
      $post->author = $data->author;
      $post->category_id = $data->category_id;

      // Create post
      if($post->create()) {
        echo json_encode(
          array('message' => 'Post berhasil dibuat')
        );
      } else {
        echo json_encode(
          array('message' => 'Post gagal dibuat')
        );
      };
      break;
    case 'PUT':
      $data = json_decode(file_get_contents("php://input"));

      // Set ID
      $post->id = $data->id;

      $post->title = $data->title;
      $post->body = $data->body;
      $post->author = $data->author;
      $post->category_id = $data->category_id;

      // Update post
      if($post->update()) {
        echo json_encode(
          array('message' => 'Post berhasil diupdate')
        );
      } else {
        echo json_encode(
          array('message' => 'Post gagal diupdate')
        );
      };
      break;
    case 'DELETE':
      $data = json_decode(file_get_contents("php://input"));

      // Set ID
      $post->id = $data->id;

      // Delete post
      if($post->delete()) {
        echo json_encode(
          array('message' => 'Post berhasil dihapus')
        );
      } else {
        echo json_encode(
          array('message' => 'Post gagal dihapus')
        );
      };
      break;
    default:
      echo json_encode(
        array('message' => 'Request Method tersebut tidak diterima')
      );
      break;
  }
  // ALTER TABLE mahasiswa DROP no;
  // ALTER TABLE mahasiswa ADD  no INT( 11 ) NOT NULL AUTO_INCREMENT FIRST ,ADD KEY (no);