<!DOCTYPE html>
<html>
<head>
    <title>Conexion BD</title>
</head>
<body>
    <h1>Datos desde PostgreSQL</h1>
    <?php
    $host = "192.168.56.11";
    $dbname = "tallerdb";
    $user = "postgres";
    $password = "vagrant123";
    
    $conn = pg_connect("host=$host dbname=$dbname user=$user password=$password");
    
    if (!$conn) {
        echo "<p>Error de conexion</p>";
    } else {
        echo "<p>Conexion exitosa</p>";
        
        $query = "SELECT * FROM estudiantes";
        $result = pg_query($conn, $query);
        
        echo "<table border='1'>";
        echo "<tr><th>ID</th><th>Nombre</th><th>Edad</th><th>Carrera</th></tr>";
        
        while ($row = pg_fetch_assoc($result)) {
            echo "<tr>";
            echo "<td>" . $row['id'] . "</td>";
            echo "<td>" . $row['nombre'] . "</td>";
            echo "<td>" . $row['edad'] . "</td>";
            echo "<td>" . $row['carrera'] . "</td>";
            echo "</tr>";
        }
        
        echo "</table>";
        pg_close($conn);
    }
    ?>
</body>
</html>