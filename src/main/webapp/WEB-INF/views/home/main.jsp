<%@ page 
    language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- Core theme CSS (includes Bootstrap)-->
<link href="/resources/css/home/mainpagestyles.css" rel="stylesheet" />


<!-- Masthead-->
<header class="masthead">
    <div class="container position-relative">
        <div class="row justify-content-center">
            <div class="col-xl-6">
                <div class="text-center text-white">
                    <!-- Page heading-->
                    <h1 class="mb-5">신뢰할 수 있는 펫시터를 찾아보세요!</h1>
                    <!-- Signup form-->
                    <!-- * * * * * * * * * * * * * * *-->
                    <!-- * * SB Forms Contact Form * *-->
                    <!-- * * * * * * * * * * * * * * *-->
                    <!-- This form is pre-integrated with SB Forms.-->
                    <!-- To make this form functional, sign up at-->
                    <!-- https://startbootstrap.com/solution/contact-forms-->
                    <!-- to get an API token!-->
                    <form class="form-subscribe" id="contactForm" data-sb-form-api-token="API_TOKEN">
                        <!-- Email address input-->
                        <div class="row">
                            <div class="col">
                                <input class="form-control form-control-lg" id="emailAddress" type="email" placeholder="Email Address" data-sb-validations="required,email" />
                                <div class="invalid-feedback text-white" data-sb-feedback="emailAddress:required">Email Address is required.</div>
                                <div class="invalid-feedback text-white" data-sb-feedback="emailAddress:email">Email Address Email is not valid.</div>
                            </div>
                            <div class="col-auto"><button class="btn btn-primary btn-lg disabled" id="submitButton" type="submit">Submit</button></div>
                        </div>
                        <!-- Submit success message-->
                        <!---->
                        <!-- This is what your users will see when the form-->
                        <!-- has successfully submitted-->
                        <div class="d-none" id="submitSuccessMessage">
                            <div class="text-center mb-3">
                                <div class="fw-bolder">Form submission successful!</div>
                                <p>To activate this form, sign up at</p>
                                <a class="text-white" href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
                            </div>
                        </div>
                        <!-- Submit error message-->
                        <!---->
                        <!-- This is what your users will see when there is-->
                        <!-- an error submitting the form-->
                        <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</header>
<div class="blank1"></div>

<!-- Image Showcases-->
<section class="showcase bg-body">
    <div class="container">
        <div class="row g-0">
            <div class="col-lg-6 order-lg-2 text-white showcase-img">
                <div>
                    <img class="img-shadow img-fluid rounded-circle" src="/resources/assets/img/home/petcare.jpg"/>
                </div>
            </div>
            <div class="col-lg-6 order-lg-1 my-auto showcase-text pt-5">
                <h2>안심하고 맡길 수 있는<br> 우리 아이를 위한 맞춤 케어</h2>
                <p class="lead mb-0">When you use a theme created by Start Bootstrap, you know that the theme will look great on any device, whether it's a phone, tablet, or desktop the page will behave responsively!</p>
                <div class="button">
                    <button id="detailBtn" class="" type="button">상세보기</button>
                </div>
            </div>
        </div>
        <div class="blank2"></div>
        <div class="row g-0 ">
            <div class="col-lg-6 order-lg-1 text-white showcase-img">
                <div>
                    <img class="img-shadow img-fluid rounded-circle" src="/resources/assets/img/home/faq3.jpg" alt="..." />
                </div>
            </div>
            <div class="col-lg-6 order-lg-2 my-auto showcase-text pt-5">
                <h2>FAQ. <br> 자주 묻는 질문</h2>
                <p class="lead mb-0">When you use a theme created by Start Bootstrap, you know that the theme will look great on any device, whether it's a phone, tablet, or desktop the page will behave responsively!</p>
                <div class="button">
                    <button id="detailBtn" class="" type="button">질문보기</button>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="blank1"></div>

 <!-- Testimonials-->
 <section class="testimonials text-center">
    <div class="container">
        <h2 class="mb-5">쓰담쓰담의<br> 솔직담백 후기!</h2>
        <div class="row">
            <div class="col-lg-4">
                <div class="testimonial-item mx-auto mb-5 mb-lg-0">
                    <img class="img-fluid rounded-circle mb-3" src="/resources/assets/img/home/testimonials-1.jpg" alt="..." />
                    <h5>Margaret E.</h5>
                    <p class="font-weight-light mb-0">"This is fantastic! Thanks so much guys!"</p>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="testimonial-item mx-auto mb-5 mb-lg-0">
                    <img class="img-fluid rounded-circle mb-3" src="/resources/assets/img/home/testimonials-2.jpg" alt="..." />
                    <h5>Fred S.</h5>
                    <p class="font-weight-light mb-0">"Bootstrap is amazing. I've been using it to create lots of super nice landing pages."</p>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="testimonial-item mx-auto mb-5 mb-lg-0">
                    <img class="img-fluid rounded-circle mb-3" src="/resources/assets/img/home/testimonials-3.jpg" alt="..." />
                    <h5>Sarah W.</h5>
                    <p class="font-weight-light mb-0">"Thanks so much for making these free resources available to us!"</p>
                </div>
            </div>
        </div>
    </div>
</section>