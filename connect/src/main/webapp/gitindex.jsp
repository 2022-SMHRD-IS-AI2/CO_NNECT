<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.smhrd.model.UserVO" %>
<%@page import="com.smhrd.model.UserDAO" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>GitHub Calendar</title>
        <link rel="stylesheet" href="./assets/github-calendar/css/gitstyle.css">
    <script src="./assets/jquery/jquery-3.6.3.js"></script>
	<script src="./assets/jquery/jquery-3.6.3.min.js"></script>
    </head>
    <body>
        <div class="bag fixed">
            <!-- <h1>Embed your GitHub contributions calendar anywhere!</h1> -->
            <div class="calendar">
                <img src="https://github.githubassets.com/images/spinners/octocat-spinner-128.gif" class="spinner"/>
                <p class="spinner-text monospace">Crunching <a href="https://github.com/ImperetilliDeus">@ImperetilliDeus</a>'s contributions just for you.</p>
            </div>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/es6-promise/3.0.2/es6-promise.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/fetch/0.10.1/fetch.min.js"></script>
            <script src="./assets/github-calendar/dist/github-calendar.min.js"></script>
            <script src="./assets/github-calendar/gitmain.js"></script>
            <!-- <p class="monospace">If you want to know more about this project, <a href="https://github.com/Bloggify/github-calendar" target="blank">check out the GitHub repository</a>.</p>
            <p class="monospace">Embed guide <3</p>
            <pre>
<!-- Include the library. -->
<script
  src="https://unpkg.com/github-calendar@latest/dist/github-calendar.min.js"
></script> 

<!-- Optionally, include the theme (if you don't want to struggle to write the CSS) -->
<link
   rel="stylesheet"
   href="https://unpkg.com/github-calendar@latest/dist/github-calendar-responsive.css"
/>

<!-- Prepare a container for your calendar. -->
<!-- <div class="calendar">
    <!-- Loading stuff -->
    <!-- Loading the data just for you. -->
</div> 


<!-- 여기에 세팅창에서 입력한 사용자 깃허브 주소에서 깃 아이디 추출해와야함 -->
<script>
    GitHubCalendar(".calendar", "ImperetilliDeus");
    // or enable responsive functionality
    GitHubCalendar(".calendar", "ImperetilliDeus", { responsive: true });
</script>
            </pre>
            <!-- <div class="monospace with-heart">
                <span class="octicon octicon-code"></span> with <span class="octicon octicon-heart"></span> &amp; JS by <a href="https://ionicabizau.net">IonicaBizau</a> @ <a href="https://bloggify.org">Bloggify</a>
            </div>
        </div> -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.0.0/highlight.min.js"></script>
        <script>hljs.highlightBlock(document.querySelector("pre"))</script>
    </body>
</html>
