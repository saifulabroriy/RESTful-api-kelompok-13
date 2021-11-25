<?php
  // HTTP Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');
  header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');

  include_once '../../config/Database.php';
  include_once '../../models/Category.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate blog post object
  $category = new Category($db);

  // get requst method
  $request_method = $_SERVER["REQUEST_METHOD"];

  switch ($request_method) {
    case 'GET':
      // Check parameter
      $category->id = isset($_GET['id']) ? $_GET['id'] : die();

      // Get single category
      $result = $category->read_single();

      $num = $result->rowCount();

      // Check if empty
      if($num > 0) {
        $categories_arr = array();

        $row = $result->fetch(PDO::FETCH_ASSOC);

        // Create array
        $categories_arr = array(
          'id' => $category->id,
          'name' => $row['name']
        );

        // Make JSON
        print_r(json_encode($categories_arr));    
      } else {
        echo json_encode(array('message' => "Category tidak ada"));
      }
      break;
    case 'POST':
      $data = json_decode(file_get_contents("php://input"));

      $category->name = $data->name;

      // Create post
      if($category->create()) {
        echo json_encode(array('message' => 'Kategori berhasil dibuat'));
      } else {
        echo json_encode(array('message' => 'Kategori gagal dibuat'));
      };
      break;
    case 'PUT':
      $data = json_decode(file_get_contents("php://input"));

      // Set ID
      $category->id = $data->id;

      $category->name = $data->name;

      // Update post
      if($category->update()) {
        echo json_encode(array('message' => 'Kategori berhasil diupdate'));
      } else {
        echo json_encode(array('message' => 'Kategori gagal diupdate'));
      };
      break;
    case 'DELETE':
      $data = json_decode(file_get_contents("php://input"));

      // Set ID
      $category->id = $data->id;

      // Delete post
      if($category->delete()) {
        echo json_encode(array('message' => 'Kategori berhasil dihapus'));
      } else {
        echo json_encode(array('message' => 'Kategori gagal dihapus'));
      };
      break;
    default:
      // Output ketika menggunakan method yang tidak disediakan
      echo json_encode(array('message' => 'Request Method tersebut tidak diterima'));
      break;
  }
