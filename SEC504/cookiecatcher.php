html>
<?php
file_put_contents("cookies.log", json_encode(array(
    "GET"=>$_GET, 
    "POST"=>$_POST, 
    "headers"=>getallheaders()))."\n",
    FILE_APPEND);
?>
</html>

