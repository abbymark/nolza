

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="apple-touch-icon" type="image/png" href="https://static.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png" />
<meta name="apple-mobile-web-app-title" content="CodePen">
<link rel="shortcut icon" type="image/x-icon" href="https://static.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico" />
<link rel="mask-icon" type="" href="https://static.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111" />
<title>CodePen - Flex with Nested Containers</title>
<link rel='stylesheet' href='https://ajax.googleapis.com/ajax/libs/angular_material/1.1.8/angular-material.min.css'>
<style>
body[ng-cloak] {
  display:none;
}




/* Important to set height for column layout */
.boxWithHeight {
  box-sizing: border-box;
  height: 100%;
}

.a, section {
  border: 5px solid rgba(85, 97, 85, 0.27);
  margin: 5px;  
}


</style>
<script>
  window.console = window.console || function(t) {};
</script>
<script>
  if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
  }
</script>
</head>
<body translate="no">
<body layout="row" ng-app="myApp" class="icondemoFontIconsWithLigatures" ng-cloak>
<div flex="30" layout="column" class="boxWithHeight" layout-padding>
flex="30"
<section flex="40">flex="40"</section>
<section flex>flex</section>
</div>
<div flex layout="column" class="boxWithHeight" layout-padding>
flex
<section flex="70">flex="70"</section>
<section flex="20">flex="20"</section>

</div>
</body>

<script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>
<script src='https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.js'></script>
<script src='https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-animate.min.js'></script>
<script src='https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-aria.min.js'></script>
<script src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/t-114/svg-assets-cache.js'></script>
<script src='https://ajax.googleapis.com/ajax/libs/angular_material/1.1.8/angular-material.min.js'></script>
<script id="rendered-js">
angular.module('myApp', ['ngMaterial']);


/*
                                         Copyright 2016-2018 Google Inc. All Rights Reserved. 
                                         Use of this source code is governed by an MIT-style license that can be found in the LICENSE file at http://material.angularjs.org/latest/license.
                                         */
//# sourceURL=pen.js
    </script>
</body>
</html>
