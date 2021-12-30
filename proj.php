<!-- Final Project - Payton Burks -->

<html>

  <head>
    <style>
      #s {
      font-family: Arial, Helvetica, sans-serif;
      border-collapse: collapse;
      width: 50%;
    }

    #s td, #customers th {
      border: 1px solid #ddd;
      padding: 8px;
    }

    #s tr:nth-child(even){background-color: #f2f2f2;}

    #s tr:hover {background-color: #ddd;}

    #s th {
      padding-top: 12px;
      padding-bottom: 12px;
      text-align: left;
      background-color: #04AA6D;
      color: white;
    }    
    </style>
  </head>

  <body>
   <h1>Concert Database</h1>

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

    <form action="venue_page.php" method="POST">
      <select name="venueChoice">
            <?php
                // query
                $rs=mysqli_query($conn, "SELECT name_ FROM venue");  
                while($row=mysqli_fetch_assoc($rs)){  
                    echo "<option value='" . $row["name_"] . "'>" . $row["name_"] . "</option>\n";
                }  
            ?>
      </select>
      <input type="submit" value="Search by Venue"/>
    </form>

    <form action="artist_page.php" method="POST">
      <select name="artistChoice">
            <?php
                // query
                $rs=mysqli_query($conn, "SELECT name_ FROM artist");  
                while($row=mysqli_fetch_assoc($rs)){  
                    echo "<option value='" . $row["name_"] . "'>" . $row["name_"] . "</option>\n";
                }  
            ?>
      </select>
      <input type="submit" value="Search by Artist"/>
    </form>

    <form action="user_page.php" method="POST">
      <select name="userChoice">
            <?php
                // query
                $rs=mysqli_query($conn, "SELECT username FROM user");  
                while($row=mysqli_fetch_assoc($rs)){  
                    echo "<option value='" . $row["username"] . "'>" . $row["username"] . "</option>\n";
                }  
            ?>
      </select>
      <input type="submit" value="Search by User"/>
    </form>

    <h2>
      <a href="https://barney.gonzaga.edu/~pburks/Final/interesting_queries.php">Interesting Queries</a>
    </h2>

    <h3>Insert Data</h3>
    <h4>New User</h4>
    <form name="Insert Data" method="post" action="userInput.php">
      <p>
        <label for="username">Username: </label>
        <input type="text" name="username" id="username">
      </p>
      <p>
        <label for="name">Name: </label>
        <input type="text" name="name" id="name">
      </p>
      <p>
        <label for="bday">Birthday (YYYY/MM/DD): </label>
        <input type="text" name="bday" id="bday">
      </p>
      <p>
        <input type="submit" name="Submit" id="Submit" value="Submit">
      </p>
    </form>
    
    <h4>New Artist</h4>
    <form name="artistData" method="post" action="artistInput.php">
      <p>
        <label for="artist">Artist: </label>
        <input type="text" name="artist" id="artist">
      </p>
      <p>
        <label for="genre">Genre: </label>
        <input type="text" name="genre" id="genre">
      </p>
      <p>
        <input type="submit" name="Submit" id="Submit" value="Submit">
      </p>
    </form>

    <h4>New Venue</h4>
    <form name="venueData" method="post" action="venueInput.php">
      <p>
        <label for="venue">Venue: </label>
        <input type="text" name="venue" id="venue">
      </p>
      <p>
        <label for="city">City: </label>
        <input type="text" name="city" id="city">
      </p>
      <p>
        <label for="state">State: </label>
        <input type="text" name="state" id="state">
      </p>
      <p>
        <label for="country">Country: </label>
        <input type="text" name="country" id="country">
      </p>
      <p>
        <label for="numseats">Number of seats: </label>
        <input type="text" name="numseats" id="numseats">
      </p>
      <p>
        <input type="submit" name="Submit" id="Submit" value="Submit">
      </p>
    </form>

    <h4>New Concert Visit</h4>
    <form name="venueData" method="post" action="concertInput.php">
      <p>
        <label for="username">Username: </label>
        <input type="text" name="username" id="username">
      </p>
      <p>
        <label for="venue">Venue: </label>
        <input type="text" name="venue" id="venue">
      </p>
      <p>
        <label for="artist">Artist: </label>
        <input type="text" name="artist" id="artist">
      </p>
      <p>
        <label for="date">Date (YYYY/MM/DD): </label>
        <input type="text" name="date" id="date">
      </p>
      <p>
        <label for="price">Price: </label>
        <input type="text" name="price" id="price">
      </p>
      <p>
        <input type="submit" name="Submit" id="Submit" value="Submit">
      </p>
    </form>


    <!-- Most Recent Concerts -->
    <?php
      $query =  "SELECT username, date, venue, artist " .
                "FROM concert " .
                "GROUP BY date " .
                "ORDER BY date DESC " .
                "LIMIT 5; ";

      $stmt = $conn->stmt_init();
      $stmt->prepare($query);
      $stmt->execute();
      $stmt->bind_result($username, $date, $venue, $artist);

      // output to table
      echo "<p style='font-weight: bold;'>Recent Concerts </p>";
      echo "<table id='s'><tr><th>Username</th><th>Date</th><th>Venue</th><th>Artist</th></tr>";
      while ($stmt->fetch()) {
        echo "<tr>";
        echo "<td>" . $username . "</td><td>" . $date . "</td><td>" . $venue . "</td><td>" . $artist . "</td>";
        echo "</tr>";
      }

      echo "</table>";
      $stmt->close();
    ?> 

    <!-- Most Active Users -->
    <?php
      $query =  "SELECT username, COUNT(*) as num_count " .
                "FROM concert " .
                "GROUP BY username " .
                "ORDER BY COUNT(*) DESC " .
                "LIMIT 5; ";

      $stmt = $conn->stmt_init();
      $stmt->prepare($query);
      $stmt->execute();
      $stmt->bind_result($username, $num_count);

      // output to table
      echo "<p style='font-weight: bold;''>Most Active Users</p>";
      echo "<table id='s'><tr><th>Username</th><th>Number of Concerts Attended</th></tr>";
      while ($stmt->fetch()) {
        echo "<tr>";
        echo "<td>" . $username . "</td><td>" . $num_count . "</td>";
        echo "</tr>";
      }

      echo "</table>";
      $stmt->close();
      $conn->close();
    ?>

  </body>
</html>
