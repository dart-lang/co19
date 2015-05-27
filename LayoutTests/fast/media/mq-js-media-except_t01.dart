/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description 'all and (' is not a valid media query and should become 'not all'.
 * Not all is not present in the media rule, hence a DOMException.NOT_FOUND_ERR should be thrown.
 */
import "dart:html";
import "../../../Utils/expect.dart";

const String htmlEL1 = r'''
<link rel="help" href="http://www.w3.org/TR/css3-mediaqueries/" />

<style type="text/css">
@media all and (color) {
p#result { color: green;}
}
</style>
''';

const String htmlEL2 = r'''
''';

void main() {
    document.head.appendHtml(htmlEL1);
    Expect.throws(() {
        document.styleSheets[document.styleSheets.length-1].cssRules[0].media.deleteMedium("all and (");
    },
    (e)=>e is DomException && e.name=="NotFoundError"
    );
}
