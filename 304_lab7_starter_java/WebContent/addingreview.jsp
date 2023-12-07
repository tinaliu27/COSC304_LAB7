<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Map" %>

<!DOCTYPE html>
<html>
<head>
<title>Review</title>
<style>

body {
    background: url("img/textured.png");
    background-size: cover; 
    background-repeat: no-repeat; 
    text-align: center; 
    align-items: center; 
}
form {
    display: block;
    text-align: center; 
    align-items: center;
}
.form-container{
    background-color: transparent; 
    width: fit-content; 
    text-align: left; 
    padding: 20px; 
    padding-left: 50px; 
    padding-right: 50px; 
    display: flex; 
    flex-direction: column;
    align-items: center;
    margin: 13rem auto 0 auto;
    margin-top: 5px; 
}
h1{
    padding: 0 auto; 
    margin: 0 auto; 
}
.rating {
    display: inline-block; 
}
 .rating input[type="radio"] {
    margin: 10px 30px; 
    width: 20px;
    height: 20px; 
 }
 .rating label{
    font-size: 1.7em; 
 }
 .form-container .dropdown{
    padding: 10px 30px; 
 }
 textarea{
    padding: 10px; 
    max-width: 100%; 
 }
 .reset {
    margin:  0px 10px;
    padding: 15px 40px;
    color: black;
    background-color: white;  
    border-radius: 50px; 
    font-size: 1.5em; 
 }
 .reset:hover{
    background-color: #afb5bd;
    border: 2px solid black; 

 }
.submit {
    margin:  0px 10px;
    padding: 15px 40px;
    background-color: #457ed9; 
    border-radius: 50px;
    font-size: 1.5em; 
 
}
.submit:hover{
    background-color: #5ea3ff;
    border: 2px solid black; 
}
.rock img{
    width: 250px;
    height: 200px; 
}
</style>
</head>
<body>
<%@ include file="headertransparent.jsp" %>
<%@ include file="jdbc.jsp" %>
<div class = "rock" style="margin-top: 100px;">
    <img src = "img/rockmain.png">
</div>
<br>
<h1 align="center" style="font-size: 3em;">Leave a Review</h1> 
<hr style="width: 50%; border-top: 2px solid black;">
<div class = "form-container">
    <form method="get" action="review.jsp">
        <select size = "1" name="productName" align="center" class="dropdown" name="rock">
            <option value = "The Rock (Dwayne Johnson)">The Rock (Dwayne Johnson)</option> 
            <option value = "The Classic">The Classic</option> 
            <option value = "The Bowtie">The Bowtie</option> 
            <option value = "The Garfield">The Garfield</option> 
            <option value = "The Abraham Lincoln">The Abraham Lincoln</option> 
            <option value = "The Harry Potter">The Harry Potter</option> 
            <option value = "The Santa">The Santa</option> 
            <option value = "The Mickey Mouse">The Mickey Mouse</option> 
            <option value = "The Alien">The Alien</option>
            <option value = "The One Eyed Rock">The One Eyed Rock</option> 
            <option value = "Dr. Ramon Lawence">Dr. Ramon Lawrence</option> 
            <option value = "Dr. Yves Lucet">Dr. Yves Lucet</option> 
            <option value = "Dr. Yong Gao">Dr. Yong Gao</option> 
            <option value = "The EEAAT">The EEAAT</option> 
            <option value = "The Mozart">The Mozart</option> 
            <option value = "Build Your Own Rock - Variety Pack">Build Your Own Rock - Variety Pack</option> 
            <option value = "Build Your Own Rock - Classic Edition">Build Your Own Rock - Classic Edition</option> 
            <option value = "Bowtie">Bowtie</option> 
            <option value = "Top Hat">Top Hat</option> 
            <option value = "Mustache">Mustache</option> 
            <option value = "Rock paint">Rock paint</option> 
            <option value = "Pet Rock Stand">Pet Rock Stand</option> 
            <option value = "The Snoop Rockk">The Snoop Rockk</option> 
            <option value = "The Cat">The Cat</option> 
            <option value = "The Ladybug">The Ladybug</option> 
            <option value = "Family Rock Bundle">Family Rock Bundle</option> 
        </select>
        <p>Customer ID: <br><input type="text" name="customerId" size="40" required></p>
        <!-- https://www.w3schools.com/tags/att_input_type_radio.asp -->
        <div class = "rating">
            <input type="radio" id="star" name="star" value=1>
            <label for="star">1</label>
            <input type="radio" id="star" name="star" value=2>
            <label for="star">2</label>
            <input type="radio" id="star" name="star" value=3>
            <label for="star">3</label>
            <input type="radio" id="star" name="star" value=4>
            <label for="star">4</label>        
            <input type="radio" id="star" name="star" value=5>
            <label for="star">5</label> 
        </div>   
        <br><textarea name="comments" cols="70" rows="5" placeholder="Insert your comment here..." required></textarea><br><br>
        <input type="reset" value="Reset" class="reset">
        <input type="submit" name="submit" value="Submit" class="submit">

    </form>
</div> 
</body>
</html>

