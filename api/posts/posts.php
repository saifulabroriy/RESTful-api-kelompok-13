<?php
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');

  include_once '../../config/Database.php';
  include_once '../../models/Post.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate blog post object
  $post = new Post($db);

  $request_method = $_SERVER["REQUEST_METHOD"];
  switch ($request_method) {
    case 'GET':
      $result = $post->read();
      
      // Get row count
      $num = $result->rowCount();

      // Check if any posts
      if($num > 0) {
        // Post array
        $posts_arr = array();

        while($row = $result->fetch(PDO::FETCH_ASSOC)) {
        extract($row);

        $post_item = array(
          'id' => $id,
          'title' => $title,
          'body' => html_entity_decode($body),
          'author' => $author,
          'category_id' => $category_id,
          'category_name' => $category_name,
          'created_at' => $created_at
        );

        // Push to "data"
        array_push($posts_arr, $post_item);
        }

        // Turn to JSON & output
        echo json_encode($posts_arr);

      } else {
        echo json_encode(
          array('message' => 'Post tidak ada')
        );
      }
      break;
    default:
      echo json_encode(
        array('message' => 'Request Method tersebut tidak diterima')
      );
      break;
  }
