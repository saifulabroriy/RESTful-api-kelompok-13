<?php
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');
  header('Access-Control-Allow-Methods: GET');

  include_once '../../config/Database.php';
  include_once '../../models/Category.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate blog post object
  $category = new Category($db);

  $request_method = $_SERVER["REQUEST_METHOD"];
  switch ($request_method) {
    case 'GET':
      $result = $category->read();
      
      // Get row count
      $num = $result->rowCount();

      // Check if any posts
      if($num > 0) {
        // Post array
        $categories_arr = array();

        while($row = $result->fetch(PDO::FETCH_ASSOC)) {
        extract($row);

        $post_item = array(
          'id' => $id,
          'name' => $name,
        );

        // Push to "data"
        array_push($categories_arr, $post_item);
        }

        // Turn to JSON & output
        echo json_encode($categories_arr);

      } else {
        echo json_encode(
          array('message' => 'Kategori tidak ada')
        );
      }
      break;
    default:
      echo json_encode(
        array('message' => 'Request Method tersebut tidak diterima')
      );
      break;
  }
