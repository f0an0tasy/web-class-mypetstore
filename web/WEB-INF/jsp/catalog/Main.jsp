
<%@include file="../common/IncludeTop.jsp"%>
<link rel="stylesheet" href="css/mouseEventInform.css" type="text/css" media="screen" />
<style type="text/css">
    #inform
    {
        width:200px;

        border:1px solid #3ccbc0;

        max-height: 350px;
        z-index: 10;

        background: #83b7e5;

        word-wrap: break-word;
        box-shadow:0px 0px 10px #4b86de;
        display: none;

        position:absolute;
    }
    #inform span
    {
        width:0px;
        height:0px;
        border-width:10px;
        border-style:none solid solid none;
        position:absolute;
    }
    #inform .tb-border
    {
        left:-10px;
        border-color:transparent #ccc transparent transparent;
        top:-1px;
    }
    #inform .tb-background
    {
        left:-9px;
        border-color:transparent white transparent transparent;
    }
</style>



<div id="Welcome">
    <div id="WelcomeContent">
        Welcome to MyPetStore!
    </div>
</div>

<div id="Main">
    <div id="Sidebar">
        <!--左侧导航栏-->
        <div id="SidebarContent">
            <a href="viewCategory?categoryId=FISH"><img src="images/fish_icon.gif" /></a>
            <br/> Saltwater, Freshwater <br/>
            <a href="viewCategory?categoryId=DOGS"><img src="images/dogs_icon.gif" /></a>
            <br /> Various Breeds <br />
            <a href="viewCategory?categoryId=CATS"><img src="images/cats_icon.gif" /></a>
            <br /> Various Breeds, Exotic Varieties <br />
            <a href="viewCategory?categoryId=REPTILES"><img src="images/reptiles_icon.gif" /></a>
            <br /> Lizards, Turtles, Snakes <br />
            <a href="viewCategory?categoryId=BIRDS"><img src="images/birds_icon.gif" /></a>
            <br /> Exotic Varieties
        </div>
    </div>

    <%--    <div id="inform" style="display: none"></div>--%>

    <div id="inform">
        <span class="tb-border"></span>
        <span class="tb-background"></span>
    </div>


    <div id="MainImage">
        <div id="MainImageContent">
            <!--中间显示栏-->
            <map name="estoremap">

                <area alt="BIRDS" coords="72,2,280,250" href="viewCategory?categoryId=BIRDS" shape="rect"
                      onmouseover="showInform(alt,event);" onmouseout="hiddenInform(event)"/>
                <area alt="FISH" coords="2,180,72,250" href="viewCategory?categoryId=FISH" shape="rect"
                      onmouseover="showInform(alt,event);" onmouseout="hiddenInform(event)"/>
                <area alt="DOGS" coords="60,250,130,320" href="viewCategory?categoryId=DOGS" shape="rect"
                      onmouseover="showInform(alt,event);" onmouseout="hiddenInform(event)"/>
                <area alt="REPTILES" coords="140,270,210,340" href="viewCategory?categoryId=REPTILES" shape="rect"
                      onmouseover="showInform(alt,event);" onmouseout="hiddenInform(event)"/>
                <area alt="CATS" coords="225,240,295,310" href="viewCategory?categoryId=CATS" shape="rect"
                      onmouseover="showInform(alt,event);" onmouseout="hiddenInform(event)"/>
                <area alt="BIRDS" coords="280,180,350,250" href="viewCategory?categoryId=BIRDS" shape="rect"
                      onmouseover="showInform(alt,event);" onmouseout="hiddenInform(event)"/>
            </map>
            <img height="355" src="images/splash.gif" align="middle" usemap="#estoremap" width="350" />
        </div>
    </div>
    <div id="Separator">&nbsp;</div>
<%@include file="../common/IncludeBottom.jsp"%>