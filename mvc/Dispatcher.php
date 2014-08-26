<?php

class Dispatcher
{
  private $sysRoot;
  
  public function setSystemRoot($path)
  {
    $this->sysRoot = rtrim($path, '/');
    // echo "hi";
    // echo $this->sysRoot;
  }

  public function dispatch()
  {
    $params = array();
    if (''!=$_SERVER['REQUEST_URI']){
      $params = explode('/', $_SERVER['REQUEST_URI']);
    }
    // var_dump($params);
    $controller = 'index';
    if (0<count($params)) {
      $controller = $params[count($params)-1];
    }

    $controllerInstance = null;
    switch ($controller) {
      case 'index.php';
        $controllerInstance = new IndexController();
        break;
      default: 
        // header("HTTP/1.0 404 NotFound");
        exit;
        break;
    }
    return $controllerInstance;
  }
}

/*
class IndexController
{
  public function helloAction()
  {
    echo 'Hello! from helloAction';
  }
}
 */

?>

