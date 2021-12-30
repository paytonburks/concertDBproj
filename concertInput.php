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

    <h4>New Concert Visit</h5>
      <?php
        $username = $_POST['username'];
        $venue = $_POST['venue'];
        $artist = $_POST['artist'];
        $date = $_POST['date'];
        $price = $_POST['price'];

        //add to database
        $sql = "INSERT INTO concert VALUES ('$username', '$date', '$venue', '$artist', '$price')";

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