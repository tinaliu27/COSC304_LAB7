<!DOCTYPE html>
<html>
        
<head>
        <title>RockPalz</title>
<style>
h1{
        color: rgb(255,105,180); 
}
a {
        display: block; 
        align-items: center; 
        text-decoration: none; 
}

button {
        padding: 0 10px 0 10px; 
        margin-bottom: 20px; 
        background-color: white; 
}
button:hover{
        background-color: rgb(255,105,180); 
        padding: 0 20px 0 20px; 
}
.userinfo {
        display: block;  
        align-items: center; 
}
.userinfo h4, h5 {
        text-align: center; 
}
h3{
        align-items:center; 
        text-align: center; 
}
#header {
    display: flex; 
    position: sticky;
    background-color: transparent; 
    left: 0; 
    top: 0; 
    z-index: 9999;
    width: 100%;
    height: auto;  
    text-align: center; 
    display: flex;

}

#header .header {
    background-color: transparent;
    min-height: 8vh; 
    width: 100%; 
}

#header .entire-bar{
    display: flex; 
    align-items: center; 
    justify-content: space-between; 
    width: 100%; 
    height: 100%; 
    padding: 0 12px;
}
#header .entire-bar .upperleft{
    padding: 2px; 
    padding-left: 20px;
    display: flex;
    justify-content: center; 
    text-align: center; 
    align-items: center; 
}
#header .entire-bar .logo img{
    height: 90px;
    width: 90px; 
    top: 0; 
    left: 0; 
    margin: 0 auto; 
}
#header .bigname h1{
    display: flex; 
    text-transform: uppercase;
    font-size: 2rem; 
    color: white;
    letter-spacing: .4rem; 
}

#header .navlist {
    padding: 0 27px; 
    text-align: center; 
    justify-content: center; 
}
#header .navlist ul{
    list-style-type: none; 
    background-color: transparent; 
    opacity: 1;
    width: fit-content; 
    height: auto; 
    right: 100%;
    top: 0; 
    display: flex;
    justify-content: center; 
    align-items: center; 
    z-index: 1; 
    overflow-x: hidden; 
    transition: .5s ease left;
    margin: 0;
    padding: 0;
}
#header .navlist ul li{
        margin: 0 10px 0 10px ; 
}
.background img{
    position: fixed; 
    top: 0; 
    left: 0; 
    width: 100%; 
    height: auto; 
    z-index: -1; 
    object-fit: cover; 
}
.navlist .item {
        text-align: center; 
        text-decoration: none;
        align-items: center; 
}
.navlist .item .user img {
        display: inline-block; 
}
.navlist .item a img{
    height: 50px;
    width: 50px; 
    top: 0; 
    right: 0; 
    margin: 0 auto;
}
.navlist .item a h5{
        padding: 0 auto;
        margin: 0 auto; 
}
.mainrock{
        text-align: center; 
        padding: 0 auto; 
        margin: 0 auto; 
}
.mainrock img{
        height: 250px;
        width: auto;
        padding: 0 auto; 
        margin: 0 auto; 

}

.dosomething {
        text-align: center; 
        align-items: center;  
}
.dosomething .rock {
        display: inline-block; 
}
.dosomething .rock img {
        width: 100px; 
        height: 100px; 
        display: space-between;
}


</style>
</head>
<body>
        <section id = "header">    
                <div class="header container">
                    <div class="entire-bar">
                        <div class="upperleft">
                            <div class="logo">
                                <a href="#">
                                    <img src = "img/logo.PNG">
                                </a>
                            </div>
                            <div class = "bigname" align="center">
                                <a href = "#"><h1 align="center">RockPalz</h1></a>
                            </div>
                        </div>
                        <div class="navlist">
                                <ul>
                                    <li>
                                        <div class="item">
                                                <a href="listprod.jsp?productName=" align="center">
                                                        <img src="img/cart.png">
                                                </a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="item">
                                                <a href="listorder.jsp?productName=" align="center">
                                                        <img src="img/orders.png">
                                                </a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="item">
                                                <div class ="user">
                                                <a href="customer.jsp?productName=">
                                                        <img src="img/profile.png">
                                                        <%
	                                                        String userName = (String) session.getAttribute("authenticatedUser");
	                                                        if (userName != null)
		                                                out.println("<h3 align=\"center\">Signed in as: "+userName+"</h3>"); %>                                      
                                                </a>
                                                </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="item">
                                                <a href="logout.jsp?productName=" align="center">
                                                        <img src="img/logout.png">
                                                </a>
                                        </div>
                                    </li>


                                </ul> 
                        </div>
                    </div>
                </div>
            </section>
<div class="background">
        <img src="img/rockwallpaper1.jpeg">
</div>
<div class="mainrock">
        <h2 align="center"><i>Your New Best Friend</i></h2>
        <img src="img/rockmain.png" >
</div>
<div class = "dosomething">
        <div class = "rock">
                <a href="login.jsp?productName=" align="center" class="shopping">
                        <img src="img/rockmain.png">
                </a>
        </div>
         <div class = "rock">
                <a href="listprod.jsp?productName=" align="center" class="shopping">
                        <img src="img/rockmain.png">
                </a>
        </div>
         <div class = "rock">
                <a href="listorder.jsp?productName=" align="center" class="shopping">
                        <img src="img/rockmain.png">
                </a>
        </div>
         <div class = "rock">
                <a href="customer.jsp?productName=" align="center" class="shopping">
                        <img src="img/rockmain.png">
                </a>
        </div>
         <div class = "rock">
                <a href="admin.jsp?productName=" align="center" class="shopping">
                        <img src="img/rockmain.png">
                </a>
        </div>
         <div class = "rock">
                <a href="logout.jsp?productName=" align="center" class="shopping">
                        <img src="img/rockmain.png">
                </a>
        </div>
</div>
<div class = "userinfo">
        <h3>Created by</h3>
        <div class = "tina">
                <h4>Tina Liu</h4>
                <h5>29490737</h5>
        </div>
        <div class = "noah">
                <h4>Noah Stasuik</h4>
                <h5>44083343</h5>
        </div>

</div>


<h4 align="center"><a href="ship.jsp?orderId=1">Test Ship orderId=1</a></h4>

<h4 align="center"><a href="ship.jsp?orderId=3">Test Ship orderId=3</a></h4>

</body>
</head>


