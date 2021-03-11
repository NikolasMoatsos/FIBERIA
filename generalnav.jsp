<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-md navbar-dark fixed-top navbar-custom">
    <a class="navbar-brand" href="mainPage.jsp" style="color: #ed8074;"><strong>Fiberia</strong></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
        <div class="dropdown_hover">
            <button class="dropbtn"> Men
              <i class="fa fa-caret-down"></i>
            </button>
            <div class="dropdown-content">
              <a href="collection.jsp?cat=Tops&gend=Male"> Tops</a>
              <a href="collection.jsp?cat=Bottoms&gend=Male"> Bottoms</a>
              <a href="collection.jsp?cat=Jackets %26 Coats&gend=Male"> Jackets & Coats </a>
              <a href="collection.jsp?cat=Swimwear&gend=Male"> Swimwear </a>
              <a href="collection.jsp?cat=Underwear %26 socks&gend=Male"> Underwear & socks </a>
              <a href="collection.jsp?cat=Shoes&gend=Male"> Shoes </a>
              <a href="collection.jsp?cat=Accessories&gend=Male"> Accessories </a>
              <a href="collection.jsp?gend=Male"> View All </a>
            </div>
        </div>
        </li>
        <li class="nav-item active">
          <div class="dropdown_hover">
              <button class="dropbtn"> Women
                <i class="fa fa-caret-down"></i>
              </button>
              <div class="dropdown-content">
                  <a href="collection.jsp?cat=Tops&gend=Female"> Tops</a>
                  <a href="collection.jsp?cat=Bottoms&gend=Female"> Bottoms</a>
                  <a href="collection.jsp?cat=Jackets %26 Coats&gend=Female"> Jackets & Coats </a>
                  <a href="collection.jsp?cat=Dresses&gend=Female"> Dresses </a>
                  <a href="collection.jsp?cat=Swimwear&gend=Female"> Swimwear </a>
                  <a href="collection.jsp?cat=Underwear %26 socks&gend=Female"> Underwear & socks </a>
                  <a href="collection.jsp?cat=Shoes&gend=Female"> Shoes </a>
                  <a href="collection.jsp?cat=Accessories&gend=Female"> Accessories </a>
                  <a href="collection.jsp?gend=Female"> View All </a>
              </div>
          </div>
          </li>
          <li class="nav-item active">
            <div class="dropdown_hover">
                <button class="dropbtn"> Kids
                  <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                  <a href="collection.jsp?cat=Tops&gend=Kid"> Tops </a>
                  <a href="collection.jsp?cat=Bottoms&gend=Kid"> Bottoms </a>
                  <a href="collection.jsp?cat=Jackets %26 Coats&gend=Kid"> Jackets & Coats </a>
                  <a href="collection.jsp?cat=Swimwear&gend=Kid"> Swimwear </a>
                  <a href="collection.jsp?cat=Underwear %26 socks&gend=Kid"> Underwear & socks </a>
                  <a href="collection.jsp?cat=Shoes&gend=Kid"> Shoes </a>
                  <a href="collection.jsp?cat=Accessories&gend=Kid"> Accessories </a>
                  <a href="collection.jsp?gend=Kid"> View All </a>
                </div>
            </div>
            </li>
            <%
              if(session.getAttribute("userobj")!=null) {
            %>
            <li class="nav-item active">
              <div class="dropdown_hover">
                  <button class="dropbtn"> Sell
                    <i class="fa fa-caret-down"></i>
                  </button>
                  <div class="dropdown-content">
                      <a href="product_registration.jsp"> Sell clothes </a>
                  </div>
              </div>
              </li>
            <% } %>
      </ul>
      <ul class="navbar-nav">
        <%
        if(session.getAttribute("userobj")!=null){
        %>
        <li class="nav-item active">
        <div class="dropdown_hover">
          <button  class="dropbtn"> My profile <span><i class="fa fa-user" style="font-size: 64; color: #ed8074;"></i></span></button>
          <div id="myDropdown" class="dropdown-content">
            <a href="Profile.jsp">View profile</a>
            <a href="log_out.jsp">Sign out</a>
          </div>
        </div>
        </li>
        <li class="nav-item active">
        <div class="dropdown_hover">
          <button class="dropbtn">  Cart <span><i class="fa fa-shopping-cart" style="font-size: 64; color: #ed8074;"></i></span></button>
            <div id="myDropdown" class="dropdown-content">
              <a href="cart.jsp">View Cart</a>
            </div>  
        </div>
        </li>
        <%
      }else{ %>
        <li class="nav-item active">
          <div class="dropdown_hover">
            <button class="dropbtn"> Sign in <span><i class="fa fa-sign-in" aria-hidden="true" style="font-size: 64; color: #ed8074;margin-right: 25px;"></i></span></button>
              <div id="myDropdown" class="dropdown-content">
                <a href="log_in.jsp">Sign in</a>
                <a href="registration.jsp">Create profile</a>
              </div>  
          </div>
          </li>
        <%}%>
      </ul>
  </nav>

<script>
/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}
</script>