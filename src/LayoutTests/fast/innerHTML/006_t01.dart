/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests html output
 * @needsreview
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  var body = document.body;
  var div = '''
<div>
<table style="border-style:solid; border-width:2px; border-color:red;">
<thead>
<tr>
<td>one</td>
<td>two</td>
<td>three</td>
</tr>
<tr>
<td>four</td>
<td>five</td>
<td>six</td>
</tr>
<tr>
<td>seven</td>
<td>eight</td>
<td>nine</td>
</tr>
<tfoot>
</table>
</div>''';

  body.setInnerHtml('''
<span><b>This markup:</b>
<xmp id="xmpID">$div</xmp>
</span>
<div><b>Should produce a table here:</b><span id="logID"></span></div>
<br>''', treeSanitizer: new NullTreeSanitizer());

  var xmpObj = document.getElementById('xmpID');
  var logObj = document.getElementById('logID');

  logObj.setInnerHtml(xmpObj.innerHtml,
      treeSanitizer: new NullTreeSanitizer());

  //Expect.equals(div, logObj.innerHtml);
}

