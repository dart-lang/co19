/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Test column balancer behavior when widows requirements are high,
 * and there are so many lines that there's no need for early breaks to honor widows 
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testharness.dart";

const String htmlEL2 = r'''
<p>There should be 6 lines in the first column, 5 in the second and 5 in the last one.</p>
<div id="mc" style="-webkit-columns:3; columns:3; -webkit-column-rule:solid; line-height:50px;">
    <div style="orphans:1; widows:5;">
        line<br>
        line<br>
        line<br>
        line<br>
        line<br>
        line<br>
        line<br>
        line<br>
        line<br>
        line<br>
        line<br>
        line<br>
        line<br>
        line<br>
        line<br>
        line<br>
    </div>
</div>
''';

void main() {
    document.body.setInnerHtml(htmlEL2, treeSanitizer:new NullTreeSanitizer());
    var mc=document.getElementById("mc");
    Expect.equals(300, mc.offsetHeight);
}
