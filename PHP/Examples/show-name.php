<html>
<head>
     <title>Showing the name on URL</title>
</head>
<body>
     <h1>Hello <?php echo htmlspecialchars($_GET["name"]) ?>!</h1>
     <p>
          This is an example of how to includes GET parameter from URL on the page. Try this URL to show your name:
     </p>
     
     <code>
          http://localhost:8000/?name=[yourname]
     </code>
     
     <script src="http://localhost:35729/livereload.js"></script>
</body>
</html>
