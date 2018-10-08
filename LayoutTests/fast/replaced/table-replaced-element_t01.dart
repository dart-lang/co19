/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Layout test for WebKit bug 85581
 */
import "dart:html";
import "../../testharness.dart";

const String squareBlue = "$testSuiteRoot/fast/replaced/resources/square-blue-100x100.png";

const String htmlEL2 = '''
<table id="table" style="width: 100%;" border="1">
  <tr>
    <td style="vertical-align: top;">
      <div>
        <p>
          <div id="div1" style="height: 200px; width: 100%;"></div>
          <img id="image" src="$squareBlue" style="height: 60%;">
          <div id="div2" style="height: 20px; width: 100%;"></div>
        </p>
      </div>
    </td>
  </tr>
</table>

<p> Layout test for <a href="https://bugs.webkit.org/show_bug.cgi?id=85581">WebKit bug 85581</a>.  </p>
<p> This tests that the contents of a table do not overflow when the table contains an image with percentage height. For this test to pass, the blue rectangle should be entirely within the table border and/or you should see a 'PASS' message below. </p>
<p id="console"></p>
''';

double parsePixelValue(String str) {
    Expect.isNotNull(str, "str=$str");
    Expect.isTrue(str.length >= 3, "str.length=${str.length}");
    Expect.isTrue(str.substring(str.length - 2) == "px", "str=$str");
    return double.parse(str.substring(0, str.length - 2));
}

void runTest(e) {
    var tableHeight = document.getElementById('table').offsetHeight;
    var div1Height = parsePixelValue(document.getElementById('div1').style.height);
    var div2Height = parsePixelValue(document.getElementById('div2').style.height);
    var imageHeight = (document.getElementById('image') as ImageElement).height;
    var contentsHeight = div1Height + div2Height + imageHeight;

    Expect.isTrue(contentsHeight < tableHeight,
       "Height of table: $tableHeight, Height of table contents: $contentsHeight");
    asyncEnd();
}

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    asyncStart();
    window.onLoad.listen(runTest);
}
