<div id="querybox">
    <table width="370" height="20" class="formTimKiem">
        <tr>
       <strong>Query:</strong>
                <form action="index.php?a=19" method="POST" class="Query" >
                  <td>
                      <textarea cols="80" rows="6" name="txtQuery" placeholder="Type your query here" autofocus required></textarea>
                  </td>
                  <td><button type="submit" name="btnRun">Run</button></td>
                </form>
        </tr>
    </table>
</div>
<div id="displayResultQuery">
    
<table style="width:100%" >  
    <tr>
            <?php
                if(isset($_POST["txtQuery"]) && ($_POST["txtQuery"] != "")){
                    $sql ="";
                    $sql .=$_POST['txtQuery'];

                    $result = DataProvider::executeQuery($sql);
                    
                    if($result)
                    {
                        echo "<table style='width:100%' border = '1' cellspacing ='0' cellpadding = '0'>
                        <tr color ='#5D9951'>";
                        
                        if(mysqli_num_rows($result)>0)
                        {
                            while($property = mysqli_fetch_field($result))
                            {   
                                echo "<th align='left'><b>".$property->name."</th></b>";   
                            }
                            echo "</tr>";
                            
                            while($rows=$result->fetch_array(MYSQLI_ASSOC))
                            {
                                    echo "<tr>";

                                    foreach ($rows as $data)
                                    {
                                        echo "<td align='left'>".$data. "</td>";
                                    }
                                    $color=2;
                                    echo "</tr>"; 
                            }  
                        }
                        else 
                        {
                            echo"no results found";
                            echo "</table>";
                        }
                    }
                    else
                    {
                        echo "error running query!";
                    }
                }
            ?>
        <tr>
            <p><b>ReSult of Query: <?php if(isset($_POST["txtQuery"]) && ($_POST["txtQuery"] != "")){ echo $sql; }?></b></p>
        </tr>
    </tr>
</table>

</div>