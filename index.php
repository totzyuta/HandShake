<?php

require_once './mvc/Dispatcher.php';

$dispatcher = new Dispatcher();

$dispatcher->setSystemRoot('/index.php');
$controller=$dispatcher->dispatch();
$controller->helloAction();

?>

<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>HandShake v0.0</title>
  <meta name="keywords" content="">
  <meta name="description" content="">
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href='http://fonts.googleapis.com/css?family=Source+Code+Pro' rel='stylesheet' type='text/css'>
  <link rel="shortcut icon" href="favicon.ico">

  <script src="js/main.js"></script>
  <link href="css/main.css" rel="stylesheet" media="all">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>

<html>
<body>
  <!-- ここからトップページ -->
  <nav class="navbar navbar-default navbar-fixed-top">
    <div class="navbar-header">
      <a class="navbar-brand" href="">HandShake</a>
    </div>
  </nav>

  <div class="page">
    <section class="hero hero-top">
      <div class="container">
        <h3>教室の片隅の恋</h3>
      </div>
    </div>

    <div class="container">
      <div style="text-align: center;">
        <div class="btn btn-default">Sign Up</div>
      </div>
    </div>
  </div>

  <!-- ここから登録ページ -->
  <div class="page">
    <section class="hero regist">
    <div class="regist-face">
    </div>
    <input type="name" class="form-control" id="Email" placeholder="Enter name">
    <input type="email" class="form-control" id="Email" placeholder="Enter email">
    </section>
  </div>

  <div style="text-align: center;">
    <div class="btn btn-default">Yes</div>
    <div class="btn btn-default">No</div>
  </div>

  <!-- ここからマイページ -->
  <div class="page">
    <div class="hero target">
    </div>
    <div class="myface">
    <div class="hero lover">
    </div>
  </div>

  <!-- ここから告白入力ページ -->
  <div class="page">
    <h3>相手を選ぶ</h3>
    <div class="container">
        <div class="row">
      <div class="col-xs-4 regist-face"></div>
      <div class="col-xs-4 regist-face"></div>
      <div class="col-xs-4 regist-face"></div>
    </div>
    </div>

    <h3>告白事項</h3>
    <input type="text" class="form-control" id="HN" placeholder="Your Kokuhaku Name.">
    <input type="text" class="form-control" id="Reason" placeholder="Where do you like target.">
    <input type="text" class="form-control" id="Manifest" placeholder="Your manifest.">
  </div>

  <!-- ここからやりとりページ -->
  <div class="page">
    <h3>やりとり</h3>
    <div class="conversation">
      <div class="question">
        <span>人生とは何ですか？</span>
      </div>
      <div class="answer">
        <span>学ぶことです</span>
      </div>
    </div>

    <div class="conversation">
    </div>
  </div>

  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="js/bootstrap.min.js"></script>
</body>
</html>
