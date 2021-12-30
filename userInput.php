<!-- Connect -->
<?php
       // get credentials
       $config = parse_ini_file("../../private/projconfig.ini");
       $server = $config["servername"];
       $username = $config["username"];
       $password = $config["password"];
       $database = "pburks_DB";

       // connect to db, get data
       $conn = mysqli_connect($server, $username, $password, $database);
       if (!$conn) {
           die("Connection failed: " . mysqli_connect_error()); 
       }
?>

<h4>New User</h4>
      <?php
        $username = $_POST['username'];
        $name = $_POST['name'];
        $birthday = $_POST['bday'];
        
        //add to database
        $sql = "INSERT INTO user VALUES ('$username', '$birthday', '$name')";

        //database addition confirmation
        if(mysqli_query($conn, $sql)){
            echo "Records inserted successfully.";
        } else{
            echo "ERROR: Could not execute $sql. " . mysqli_error($conn);
        }
        $conn->close();
      ?> 

<h1>
      <a href="https://barney.gonzaga.edu/~pburks/Final/proj.php">Home</a>
    </h1>