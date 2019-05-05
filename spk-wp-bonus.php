<?php
$dbhost='localhost';
$dbuser='root';
$dbpass='';
$dbname='spk';
//-- database connection
$db=new mysqli($dbhost,$dbuser,$dbpass,$dbname);
?>

<!doctype html>
<html>
<head>
  <title>SPK WP BONUS KARYAWAN</title>
        <style>
          * {font-family:verdana,arial,sans-serif;font-size:1em;padding:2px;}
          h1 {font-size:1.5em}
          h2 {font-size:1.2em}
          td,th {min-width:70px;border:solid 1px #999;}
          th {background-color:#99f;}
          table {min-width:600px;}
          sub,sup {font-size:0.8em}
          .center {text-align:center}
        </style>
</head>
<body>

  <h1 align="center">SPK WP BONUS KARYAWAN</h1>
  <h2>[1] Perbaikan Bobot W</h2>
  <p>

  <?php
    $sql="SELECT id_kriteria,bobot,atribut FROM kriteria";
    $result=$db->query($sql);
    $W=array();
    $atribut=array();

    while($row=$result->fetch_object()){
      $W[$row->id_kriteria]=$row->bobot;
      $atribut[$row->id_kriteria]=$row->atribut;
    }
    $result->free();
   ?>

   Bobot awal W=(<?php echo implode(',',$W);?>) akan diperbaiki sehingga total 
   bobot sigma w<sub>j</sub>=1, dengan cara w<sub>j</sub>=w<sub>j</sub>/sigma 
   w<sub>j</sub>
  </p>
  <p>

    <?php
    $i=0;
    $sigma_w=array_sum($W);
    foreach($W as $j=>$w){
      echo "w<sub>".(++$i)."</sub>= {$w} /(".implode('+',$W).") = {$w} / {$sigma_w} = ".($w/$sigma_w)."<br>";
      $W[$j]=$w/$sigma_w;
    }
    ?>

  </p>
  <p>
    Bobot ternormalisasi w=(<?php echo implode(',',$W);?>)
  </p>
  <h2>[2] Menghitung nilai vektor S</h2>
  <p>

    <?php
    $sql="SELECT * FROM evaluasi ORDER BY id_alternative,id_kriteria";
    $result=$db->query($sql);
    $X=array();
    $alternative='';
    while($row=$result->fetch_object()){
      if($row->id_alternative!=$alternative){
        $X[$row->id_alternative]=array();
        $alternative=$row->id_alternative;
      }
      $X[$row->id_alternative][$row->id_kriteria]=$row->value;
    }
    $S=array();
    foreach($X as $alternative=>$x){
      $S[$alternative]=1;

      echo "S<sub>{$alternative}</sub> = ";

      foreach($x as $kriteria=>$value){

         $S[$alternative]*=pow($value,($atribut[$kriteria]=='cost'?-$W[$kriteria]:$W[$kriteria]));

         echo "({$value}<sup>".($atribut[$kriteria]=='cost'?-$W[$kriteria]:$W[$kriteria])."</sup>)";
      };
      echo " = {$S[$alternative]}<br>";
    }
    ?>
  </p>

  <h2>[3] Menghitung nilai vektor V</h2>
  <?php
     $V=array();
     $sigma_s=array_sum($S);
     $devider=implode(' + ',$S);
     foreach($S as $alternative=>$s){
       echo "<p>V<sub>{$alternative}</sub> = $s/({$devider})<br>= ";
       $V[$alternative]=$s/$sigma_s;
       echo $V[$alternative]."</p>";
     }
  ?>
  <h2>[4] Perangkingan nilai vektor V</h2>
  <p>
    <table>
      <tr>
        <th>No</th>
        <th>Alternative</th>
        <th>Hasil</th>
      </tr>
      <?php
      arsort($V);
      $no=0;
      foreach($V as $alternative=>$result){
      echo "<tr class='center'>
              <td>".(++$no)."</td>
              <td>A<sub>{$alternative}<sub></td>
              <td>{$result}</td>
            </tr>";
      }
      ?>
    </table>
  </p>
</body>
</html>                