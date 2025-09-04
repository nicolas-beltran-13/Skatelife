<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>SkateLife</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <?php include 'navbar.html'; ?>


    <!-- Navbar Start -->
    <div class="container-fluid">
        <div class="row border-top px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
                    <h6 class="m-0">Categorías</h6>
                    <i class="fa fa-angle-down text-dark"></i>
                </a>
                <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 1;">
                    <div class="navbar-nav w-100 overflow-hidden" style="height: 410px">
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link" data-toggle="dropdown">Camisetas <i class="fa fa-angle-down float-right mt-1"></i></a>
                            <div class="dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0">
                    <?php include 'navbar.html'; ?>
                                <a href="" class="dropdown-item">Cencilla</a>
                                <a href="" class="dropdown-item">personalizada</a>
                                <a href="" class="dropdown-item">de lujo</a>
                            </div>
                        </div>
                       <a href="" class="nav-item nav-link">Rodilleras</a>
                        <a href="" class="nav-item nav-link">Zapatos</a>
                        <a href="" class="nav-item nav-link">Cascos</a>
                        <a href="" class="nav-item nav-link">Lijas</a>
                        <a href="" class="nav-item nav-link">Ruedas</a>
                        <a href="" class="nav-item nav-link">Bujes</a>
                        <a href="" class="nav-item nav-link">lubricantes</a>
                        <a href="" class="nav-item nav-link">tornillos</a>
                        <a href="" class="nav-item nav-link">Shoes</a>
                    </div>
                </nav>
            </div>
            <div class="col-lg-9">
                <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                    <a href="" class="text-decoration-none d-block d-lg-none">
                        <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">S</span>kateLife</h1>
                    </a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto py-0">
                            <a href="index.html" class="nav-item nav-link">Inicio</a>
                            <a href="shop.html" class="nav-item nav-link">Tienda</a>
                            
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Páginas</a>
                                <div class="dropdown-menu rounded-0 m-0">
                                    <a href="cart.html" class="dropdown-item">Carrito de Compras</a>
                                    <a href="checkout.html" class="dropdown-item">Pagar</a>
                                </div>
                            </div>
                            <a href="contact.html" class="nav-item nav-link">Contacto</a>
                        </div>
                        <div class="navbar-nav ml-auto py-0">
                            <a href="login.html" class="nav-item nav-link">Iniciar Sesión</a>
                            <a href="register.html" class="nav-item nav-link">Registrarse</a>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
    </div>
    <!-- Navbar End -->


    <div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
        <h1 class="font-weight-semi-bold text-uppercase mb-3">Contáctanos</h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="#">Inicio</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">Contacto</p>
                    <?php include 'footer.html'; ?>
        </div>
    </div>
</div>
<div class="container-fluid pt-5">
    <div class="text-center mb-4">
        <h2 class="section-title px-5"><span class="px-2">Ponte en Contacto con Nosotros</span></h2>
    </div>
    <div class="row px-xl-5">
        <div class="col-lg-7 mb-5">
            <div class="contact-form">
                <div id="success"></div>
                <form name="sentMessage" id="contactForm" novalidate="novalidate">
                    <div class="control-group">
                        <input type="text" class="form-control" id="name" placeholder="Tu Nombre"
                            required="required" data-validation-required-message="Por favor, ingresa tu nombre" />
                        <p class="help-block text-danger"></p>
                    </div>
                    <div class="control-group">
                        <input type="email" class="form-control" id="email" placeholder="Tu Correo Electrónico"
                            required="required" data-validation-required-message="Por favor, ingresa tu correo electrónico" />
                        <p class="help-block text-danger"></p>
                    </div>
                    <div class="control-group">
                        <input type="text" class="form-control" id="subject" placeholder="Asunto"
                            required="required" data-validation-required-message="Por favor, ingresa un asunto" />
                        <p class="help-block text-danger"></p>
                    </div>
                    <div class="control-group">
                        <textarea class="form-control" rows="6" id="message" placeholder="Tu Mensaje"
                            required="required"
                            data-validation-required-message="Por favor, ingresa tu mensaje"></textarea>
                        <p class="help-block text-danger"></p>
                    </div>
                    <div>
                        <button class="btn btn-primary py-2 px-4" type="submit" id="sendMessageButton">Enviar Mensaje</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-lg-5 mb-5">
            <h5 class="font-weight-semi-bold mb-3">Ponte en Contacto</h5>
            <p>¿Tienes preguntas sobre nuestras tablas, ruedas o accesorios? ¿Necesitas ayuda con un pedido o un consejo sobre skate? ¡No dudes en contactarnos! Estamos aquí para ayudarte a rodar.</p>
            <div class="d-flex flex-column mb-3">
                <h5 class="font-weight-semi-bold mb-3">Nuestra Tienda (Skate Shop)</h5>
                <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>Carrera 119A #17-13, Funza, Cundinamarca, Colombia</p>
                <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>info@yourskateshop.com</p>
                <p class="mb-2"><i class="fa fa-phone-alt text-primary mr-3"></i>+57 3XX XXX XXXX (Ejemplo)</p>
            </div>
            </div>
    </div>
</div>


    <?php include 'footer.html'; ?>


    <!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>