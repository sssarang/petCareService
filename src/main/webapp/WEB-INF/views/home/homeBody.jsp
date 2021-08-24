<%@ page 
    language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- address.js-->
<script src="/resources/js/common/address.js" type="application/javascript"></script>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/resources/css/home/home.css" rel="stylesheet" />

<!-- Masthead-->
<header class="masthead">
    <div class="container position-relative">
        <div class="row justify-content-center">
            <div class="col-xl-7">
                <div class="">
                    <div class="text-center text-white">
                        <!-- Page heading-->
                        <h1>펫시터가 필요하신가요?</h1>
                        <h2 class="mb-5">펫시터를 찾아보세요!</h2>
                    </div>
                    <div class="wrap">
                        <form class="" action="/search/" method="GET">
                            <fieldset>
                                
                                I'm looking for service for my: &nbsp;&nbsp;
                                
                                <label for="pet-type-checkbox-dog-search-form">Dog </label>
                                <input
                                    type="checkbox"
                                    id="pet-type-checkbox-dog-search-form"
                                    name="pet-type-checkbox-search-form"
                                    value="dog"
                                />
                                <label for="pet-type-checkbox-cat-search-form">Cat </label>
                                <input
                                    type="checkbox"
                                    id="pet-type-checkbox-cat-search-form"
                                    name="pet-type-checkbox-search-form"
                                    value="cat"
                                />    
                            </fieldset>
                        </form>
                        <hr>
                        <input type="hidden" value="dog" name="pet_type"/>
                    
                        <fieldset>
                            <div>서비스 선택</div>
                            <div class="input-group">
                                <div class="select">
                                    <input
                                        id="visit-All-day"
                                        type="checkbox"
                                        name="homepage_service_type"
                                        value="방문-All day"
                                    />
                                    <label for="visit-All-day">방문<br>All day</label>
                                </div>

                                <div class="select">
                                    <input
                                        id="visit-Half-day"
                                        type="checkbox"
                                        name="homepage_service_type"
                                        value="방문-All day"
                                    />
                                    <label for="visit-Half-day">방문<br>Half day</label>
                                </div>

                                <div class="select">
                                    <input
                                        id="bb-All-day"
                                        type="checkbox"
                                        name="homepage_service_type"
                                        value="방문-All day"
                                    />
                                    <label for="bb-All-day">맡김<br>All day</label>
                                </div>

                                <div class="select">
                                    <input
                                        id="bb-Half-day"
                                        type="checkbox"
                                        name="homepage_service_type"
                                        value="방문-All day"
                                    />
                                    <label for="bb-Half-day">맡김<br>Half day</label>
                                </div>
                            </div>
                            
                        </fieldset>
                        <fieldset>
                            <div class="pt-3 d-inline-block">
                                <div>돌봄날짜</div>
                                <spen><input type="text" class="selector" placeholder="시작일" /></spen>
                                <span>&nbsp;~&nbsp;</span> 
                                <spen><input type="text" class="selector" placeholder="종료일" /></spen> 
            
                                <!-- <a class="input-button" title="toggle" data-toggle><i class="icon-calendar"></i></a> -->
                                
                                <script type="text/javascript">
            
                                    $(".selector").flatpickr({ 
                                    
                                    dateFormat: "Y-m-d",
                                    
                                    minDate:"today",
                                    
                                    maxDate: new Date().fp_incr(30)
                                    
                                    });
                                    
                                </script> 
                            </div>  
                            <div class="pb-3">
                                <div>주소</div> 
                                <select id="sido">
                                    <option value="">선택</option>
                                </select>
                                <select id="sigugun">
                                    <option value="">선택</option>
                                </select>
                                <select id="dong">
                                    <option value="">선택</option>
                                </select>
                            </div>
                        </fieldset>

                        <fieldset>
                            <div>
                                <div>Dog Size</div>
                                </div>
                                <div class="input-group">
                                    <div class="select">
                                        <input
                                        id="small"
                                        type="checkbox"
                                        name="homepage_service_type"
                                        value="방문-All day"
                                        />
                                        <label for="small">소형견<br>0-6.9kg</label>
                                    </div>

                                    <div class="select">
                                        <input
                                        id="medium"
                                        type="checkbox"
                                        name="homepage_service_type"
                                        value="방문-All day"
                                        />
                                        <label for="medium">중형견<br>7-14.9kg</label>
                                    </div>

                                    <div class="select">
                                        <input
                                        id="large"
                                        type="checkbox"
                                        name="homepage_service_type"
                                        value="방문-All day"
                                        />
                                        <label for="large">대형견<br>15kg +</label>
                                    </div>
                                </div>
                                <div>
                                    <button class="regBtn2"type="button">검색</button>
                                </div>
                            </div>
                            
                        </fieldset>
                    </div>
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
                    <img class="img-fluid" src="/resources/assets/img/home/dog.png"/>
                </div>
            </div>
            <div class="col-lg-6 order-lg-1 my-auto showcase-text pt-5">
                <h2>안심하고 맡길 수 있는<br> 우리 아이를 위한 맞춤 케어</h2>
                <p class="lead mb-0">When you use a theme created by Start Bootstrap, you know that the theme will look great on any device, whether it's a phone, tablet, or desktop the page will behave responsively!</p>
                
                <!-- Button to Open the Modal -->
                <div class="button">
                    <button type="button" class="regBtn" data-toggle="modal" data-target="#serviceInfo">상세보기</button>

                    <!-- The Modal -->
                    <div class="modal fade" id="serviceInfo">
                        <!-- NOTE 4: if ( class="modal-dialog" ) not exists, modal window appeared by full width on viewport. -->
                        <div class="modal-dialog modal-dialog-scrollable">

                            <!-- NOTE 5: if ( class="modal-content" ) not exists, the background of modal window not appeared. -->
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title">Modal Heading</h4>

                                    <!-- NOTE 6: if ( data-dismiss="modal" ) not exists, model window not closed if clicked. -->
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">
                                    <h3>Some text to enable scrolling..</h3>

                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nam dolores, obcaecati minima maxime numquam voluptatem aut esse libero, error inventore corrupti distinctio pariatur rerum debitis facilis delectus odit maiores dignissimos.</p>

                                    <p>The name of the waters, and let it separate the waters from the waters. The LORD God said to the serpent, We may eat of the air, and over the birds of the air, and to the birds of the field; but for the LORD God made the wild animals of the sea and over the fish of the sea, and over the night, and to the birds of the garden, nor shall you touch it, or you shall die. And to every beast of the earth, and over every living thing that moves upon the earth. And it was very good. And there was evening and there he put the man and for seasons and for days and years. Out of the ground of every kind: cattle and creeping things and wild animals of the field and every bird of the tree that is pleasant to the tree of life also in the image of God he created them; male and female he created them. He said, I heard the sound of the sea and over the fish of the sea, and over every creeping thing that moves upon the earth. He said, Who told you that you were taken; you are dust, and to the birds of the fruit of the trees in the image of God he created them; male and female he created them.</p>

                                    <p>Mit Ausnahme von Bedienungsrechten von Hypotheken ist der volle Betrag in Abzug zu bringen, nach Bereinigung um entsprechende latente Steuerverbindlichkeiten, die erlöschen würden, falls sich der Betrag, der vom Ergänzungskapital abzuziehen ist, ergibt sich aus dem nachfolgenden Abschnitt „Abzug von Beträgen über dem Schwellenwert“. Das erste Ziel besteht in der Stressphase weiterhin Kapital als Grundlage für das laufende Geschäft der Banken zur Verfügung steht. Das Rahmenkonzept reduziert den Ermessensspielraum von Banken, die die auf internationaler Ebene hat der Ausschuss eine Reihe einheitlicher Kennzahlen entwickelt, dies als das Minimum an Informationen anzusehen sind, über das die Aufsichtsinstanzen verfügen sollten. Dies wäre im Rahmen der standardisierten CVA-Risikokapitalanforderungen gemäss Absatz 104 für anwendbar. Mit Ausnahme von Bedienungsrechten von Hypotheken abzuziehen ist, als die Summe sämtlicher Beteiligungspositionen, die insgesamt mehr als 10% des harten Kernkapitals in voller Höhe abgezogen werden. Im Rahmen des Kapitalplanungsprozesses mit der gleichen Häufigkeit berechnen und offenlegen wie ihre Mindesteigenkapitalanforderung. Banken, die die auf internen Modellen basierende Methode anwenden, müssen über eine Sicherheitenverwaltungseinheit verfügen. Die Einheit muss ferner darauf achten, ob Konzentrationen auf einzelne Kategorien von Vermögenswerten bestehen, die von der Bank weiterverwendet werden und welche Rechte die Bank beim Stellen von Sicherheiten ihren Kontrahenten abtritt. Derartige zum Ausgleich herangezogene Vermögenswerte sollten mit dem prozentualen Anteil der Positionen des harten Kernkapitals am gesamten Eigenkapital.</p>
                                </div>

                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <!-- NOTE 6: if ( data-dismiss="modal" ) not exists, model window not closed if clicked. -->
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>            
                    </div>
                </div>
            </div>
        </div>
        <div class="blank1"></div>
        <div class="row g-0 ">
            <div class="col-lg-6 order-lg-1 text-white showcase-img">
                <div>
                    <img class="img-fluid" src="/resources/assets/img/home/cat.png" alt="..." />
                </div>
            </div>
            <div class="col-lg-6 order-lg-2 my-auto showcase-text pt-5">
                <h2>FAQ. <br> 자주 묻는 질문</h2>
                <p class="lead mb-0">When you use a theme created by Start Bootstrap, you know that the theme will look great on any device, whether it's a phone, tablet, or desktop the page will behave responsively!</p>
                
                <!-- Button to Open the Modal -->
                <div class="button">
                    <button type="button" class="regBtn" data-toggle="modal" data-target="#faq">질문보기</button>

                    <!-- The Modal -->
                    <div class="modal fade" id="faq">
                        <!-- NOTE 4: if ( class="modal-dialog" ) not exists, modal window appeared by full width on viewport. -->
                        <div class="modal-dialog modal-lg modal-dialog-scrollable modal-dialog-centered">

                            <!-- NOTE 5: if ( class="modal-content" ) not exists, the background of modal window not appeared. -->
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title">Modal Heading</h4>

                                    <!-- NOTE 6: if ( data-dismiss="modal" ) not exists, model window not closed if clicked. -->
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">

                                    <div id="accordion">

                                        <div class="card">
                                            <div class="card-header">
                                                <!-- NOTE 1 : A ( data-toggle="collapse" ) attribute must be used 
                                                                in a ( <a> ) element to control ( show / hide ) the ( collapsible ) content.
                                                                    
                                                    * For ( <a> ) elements, you can use the ( href ) attribute instead of the ( data-target ) attribute. -->
                                                <a class="card-link" data-toggle="collapse" href="#collapseOne">
                                                    Collapsible Group Item #1
                                                </a>
                                            </div>
                            
                                            <!-- NOTE 2 : Collapsible ( <div> ) element to contain contents must have ( .collapse ) class. -->
                                            <div id="collapseOne" class="collapse show" data-parent="#accordion">
                                                <div class="card-body">
                                                    Lorem ipsum..
                                                </div>
                                            </div>
                                        </div>
                            
                                        <div class="card">
                                            <div class="card-header">
                                                <!-- NOTE 1 : A ( data-toggle="collapse" ) attribute must be used 
                                                                in a ( <a> ) element to control ( show / hide ) the ( collapsible ) content.
                                                                    
                                                    * For ( <a> ) elements, you can use the ( href ) attribute instead of the ( data-target ) attribute. -->
                                                <a class="collapsed card-link" data-toggle="collapse" href="#collapseTwo">
                                                    Collapsible Group Item #2
                                                </a>
                                            </div>
                            
                                            <!-- NOTE 2 : Collapsible ( <div> ) element to contain contents must have ( .collapse ) class. -->
                                            <div id="collapseTwo" class="collapse" data-parent="#accordion">
                                                <div class="card-body">
                                                    Lorem ipsum..
                                                </div>
                                            </div>
                                        </div>
                            
                                        <div class="card">
                                            <div class="card-header">
                                                <!-- NOTE 1 : A ( data-toggle="collapse" ) attribute must be used 
                                                                in a ( <a> ) element to control ( show / hide ) the ( collapsible ) content.
                                                                    
                                                    * For ( <a> ) elements, you can use the ( href ) attribute instead of the ( data-target ) attribute. -->
                                                <a class="collapsed card-link" data-toggle="collapse" href="#collapseThree">
                                                    Collapsible Group Item #3
                                                </a>
                                            </div>
                            
                                            <!-- NOTE 2 : Collapsible ( <div> ) element to contain contents must have ( .collapse ) class. -->
                                            <div id="collapseThree" class="collapse" data-parent="#accordion">
                                                <div class="card-body">
                                                    Lorem ipsum..
                                                </div>
                                            </div>
                                        </div>
                            
                                    </div> 
                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <!-- NOTE 6: if ( data-dismiss="modal" ) not exists, model window not closed if clicked. -->
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>            
                    </div>
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