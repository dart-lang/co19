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
import "../../testcommon.dart" as tc;
import "../../testharness.dart";
import "../../../Utils/expect.dart";

const String htmlEL2 = r'''
<a href="&#xD;&#xA;                           default.aspx?aType=SonDakika&amp;ArticleID=501349&amp;Date=03.03.2008&#xD;&#xA;   " >test</a>
''';

void doTest(e) {
    AnchorElement a = document.getElementsByTagName('a')[0] as AnchorElement;
    a.href = a.href;
    RegExp reg=new RegExp("%20");
    Expect.isFalse(reg.hasMatch(a.href));
    a.text="PASS";
}

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    tc.addOnLoadListener(doTest);
}
