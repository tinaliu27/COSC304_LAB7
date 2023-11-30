<style>
html{
    text-decoration: none; 
    color: black; 
}
#footer {
        display: flex; 
        width: 100%;
        height: auto;  
        background-color: #D0D3C7; 
        margin: 0 auto;
        padding: 20px 30px; 
        position: sticky-bottom; 
        text-align: left; 
        overflow: hidden;
}
#footer h2{
    margin: 0 auto;
    padding: 0 auto;
}
#footer .footer-container {
        padding; 0px; 
        display: flex; 

}
.footer-container .item {
        display: inline-block; 
        margin: 0 20px; 
        align-items: center; 
}
.item .info img {
    padding-top: 5px; 
    width: fit-content;
    height: 140px; 
}
.companyinfo img {
    width: 170px; 
    height: 170px; 
}
.item .title h2{
    color: #D0D3C7; 
}
.items {
    margin-top: 50px; 
    text-align: left; 
}
.items h3{
    margin-bottom: 0;
}

</style> 
<html>
<section id="footer">
        <div class = "footer-container">
            <div class = "item">
                <div class="companyinfo">
                    <img src= "img/logo.PNG">
                </div>
            </div>
            <div class = "item">
                <h2 align="justify">About Us</h2>
                <h4>Mission Statement</h4> 
                <h4>Executive Summary</h4> 
                <a href = "https://github.com/tinaliu27/COSC304_LAB7/tree/Lab10"><h4>Github Link</h4></a>
            </div>
            <div class = "item">
                <h2 align="justify">Tests</h2>
                <h4><a href="ship.jsp?orderId=1">Test Ship orderId=1</a></h4>
                <h4><a href="ship.jsp?orderId=3">Test Ship orderId=3</a></h4>
            </div>
            <div class = "item">
                <h2>Creators</h2> 
                <div class = "info">
                    <img src="img/profiletina.jpeg">
                </div>
            </div>
            <div class = "items">
                <h3>Tina Liu</h3>
                <p>BA Computer Science</p>
            </div> 
            <div class = "item">
                <div class = "title">
                    <h2>Hi</h2>
                </div>
                <div class = "info">
                    <img src="img/noah.jpeg" class = "noah">
                </div>
            </div>
            <div class = "items">
                <h3>Noah Stasuik</h3>
                <p>BSc Computer Science</p>
            </div>
        </div>
          
    
</section>
</html>