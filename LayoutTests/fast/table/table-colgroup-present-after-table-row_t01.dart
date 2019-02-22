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
import "../../resources/check-layout.dart";

const String htmlEL1 = r'''
    <style>
    td { font: 15px/1 Ahem }
    </style>
''';

const String htmlEL2 = r'''
<h3>Test for chromium bug : <a href="https://code.google.com/p/chromium/issues/detail?id=305169">305169</a>. &lt;colgroup&gt; is ignored if seen after &lt;tr&gt;.</h3>
<h4>Columns width are not based on width specified in colGroup becuase colGroup is present after table row and we was supporting it only when colGroup is present at the start in table.</h4>
  <table style="width: 100%;" border=1px>
    <tbody>
      <tr>
        <td colspan="4">First</td>
      </tr>
      <colgroup>
      <col width="35px">
      <col width="65px">
      <col width="100px">
      </colgroup>
      <tr >
      <td data-expected-width="64">Col-1</td>
      <td data-expected-width="65">Col-2</td>
      <td data-expected-width="100">Col-3</td>
      <td>Col-4</td>
      </tr>
  </table>
''';

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    tc.addOnLoadListener((_) {
        checkLayout('td');
    });
}
