<%@ page 
    language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- Core theme CSS (includes Bootstrap)-->
<link href="/resources/css/home/home.css" rel="stylesheet" />


<!-- 통합검색 -->
<header class="search">
    <div class="container position-relative">
        <div class="row justify-content-center">
            <div class="col-xl-7">
                <div>
                    <div class="text-center text-white">
                        <!-- Page heading -->
                        <h1>펫시터가 필요하신가요?</h1>
                        <h2 class="mb-5">펫시터를 찾아보세요!</h2>
                    </div>
                    <div class="wrap">
                        <form class="" action="/search/" method="GET">
                        	<!-- 동물 유형 선택 -->
                            <fieldset>
                                I'm looking for service for my: &nbsp;&nbsp;
                                
                                Dog <input type="radio" id="dog" name="petType" value="dog" />&nbsp;
                                Cat <input type="radio" id="cat" name="petType" value="cat"/>    
                            </fieldset>
                        
                            <hr>

                            <input type="hidden" value="dog" name="pet_type"/>
                        
                            <fieldset>
                                <div class="pt-2">서비스 선택</div>
                                <div class="input-group">
                                    <div class="select">
                                        <input type="checkbox" id="visit-All-day" value="visit-All-day" />
                                        <label for="visit-All-day">방문<br>All day</label>
                                    </div>

                                    <div class="select">
                                        <input type="checkbox" id="visit-Half-day" value="visit-Half-day" />
                                        <label for="visit-Half-day">방문<br>Half day</label>
                                    </div>

                                    <div class="select">
                                        <input type="checkbox" id="leave-All-day" value="leave-All-day" />
                                        <label for="leave-All-day">맡김<br>All day</label>
                                    </div>

                                    <div class="select">
                                        <input type="checkbox" id="leave-Half-day" value="leave-Half-day" />
                                        <label for="leave-Half-day"">맡김<br>Half day</label>
                                    </div>
                                </div>
                            </fieldset>

                            <fieldset>
                                <div class="pt-2 d-inline-block">
                                    <div>돌봄날짜</div>
                                    <spen><input type="text" class="selector" placeholder="시작일" /></spen>
                                    <span>&nbsp;~&nbsp;</span> 
                                    <spen><input type="text" class="selector" placeholder="종료일" /></spen> 
                                    <!-- <a class="input-button" title="toggle" data-toggle><i class="icon-calendar"></i></a> -->
                                </div>  

                                <div class="pt-2 pb-2">
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
                                <div id="dogType" class="pt-2">
                                    <div>Dog Size</div>
                                    
                                    <div class="input-group select">
                                        <div class="select">
                                            <input type="radio" id="small" name="dogType" value="small" >
                                            <label for="small">소형견<br>7kg 미만</label>
                                        </div>

                                        <div class="select">
                                            <input type="radio" id="medium" name="dogType" value="medium" />
                                            <label for="medium">중형견<br>7 - 14.9kg</label>
                                        </div>

                                        <div class="select">
                                            <input type="radio" id="large" name="dogType" value="large" />
                                            <label for="large">대형견<br>15kg 이상</label>
                                        </div>
                                    </div>

                                </div>
                                <div>
                                    <button type="button" id="searchBtn" class="regBtn2">검색</button>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<div class="blank1"></div>

 <!-- 서비스 설명, faq-->
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
                        <div class="modal-dialog modal-dialog-scrollable">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title">Modal Heading</h4>
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
                                    <button type="button" class="btn" data-dismiss="modal">Close</button>
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
                    <button type="button" id="faqBtn" class="regBtn" data-toggle="modal" data-target="#faq">질문보기</button>

                    <!-- The Modal -->
                    <div class="modal fade" id="faq">
                        <div class="modal-dialog modal-lg modal-dialog-scrollable modal-dialog-centered">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title">Modal Heading</h4>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">
                                    <div id="accordion">
                                        <!-- 동적으로 faq목록 생성 -->
                                    </div>
                                </div>
                                <!-- Modal footer -->
                                <div class="modal-footer">
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

 <!-- 후기 -->
 <section class="reviews text-center">
    <div class="container">
        <h2 class="mb-5">쓰담쓰담의<br> 솔직담백 후기!</h2>
        <div class="row">
            <div class="col-lg-4">
                <div class="reviews-item mx-auto mb-5 mb-lg-0">
                    <img class="img-fluid rounded-circle mb-3" src="/resources/assets/img/home/testimonials-1.jpg" alt="..." />
                    <h5 id="writer1"></h5>
                    <p id="content1" class="font-weight-light mb-0"></p>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="reviews-item mx-auto mb-5 mb-lg-0">
                    <img class="img-fluid rounded-circle mb-3" src="/resources/assets/img/home/testimonials-2.jpg" alt="..." />
                    <h5 id="writer2"></h5>
                    <p id="content2" class="font-weight-light mb-0"></p>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="reviews-item mx-auto mb-5 mb-lg-0">
                    <img class="img-fluid rounded-circle mb-3" src="/resources/assets/img/home/testimonials-3.jpg" alt="..." />
                    <h5 id="writer3"></h5>
                    <p id="content3" class="font-weight-light mb-0"></p>
                </div>
            </div>
        </div>
    </div>
</section>