/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description 
 */
import "dart:html";
import "../../../Utils/expect.dart";

const String htmlEL1 = r'''
        <link rel="stylesheet" href="fake.css" type="text/css" >
''';

const String htmlEL2 = r'''
<form name="LoginForm"> 
<embed src="" type="application/x-shockwave-flash"></embed>
</form>         
''';

void testForm(e) {
    var LoginForm=document.getElementById("LoginForm");
    print("loginForm=${LoginForm}");
    Expect.isNotNull(LoginForm);
}

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    window.onLoad.listen(testForm);
//    document.body.onLoad.listen(testForm);
}

