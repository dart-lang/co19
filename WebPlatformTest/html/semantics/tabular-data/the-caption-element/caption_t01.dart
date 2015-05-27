/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
/**
 * after web-platform-tests/html/semantics/tabular-data/the-caption-element/caption_001.html
 * @assertion
 * http://www.w3.org/TR/html5/tabular-data.html#the-caption-element
 * @description HTML5 Table API Tests
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL = r'''
    <table id="table1" style="display:none">
      <tr><td></td></tr>
      <caption>first caption</caption>
      <caption>second caption</caption>
    </table>
    <table id="table2" style="display:none">
      <tr><td></td></tr>
    </table>
    <table id="table3" style="display:none">
      <tr><td></td></tr>
    </table>
    <table id="table4" style="display:none">
      <tr><td></td></tr>
      <caption>first caption</caption>
    </table>
''';

void main() {
  document.body.appendHtml(htmlEL);

  test((){
    TableElement table1=document.getElementById('table1');
    assert_equals(table1.caption.innerHtml, "first caption");
  }, "first caption element child of the first table element");

  test((){
    var caption = document.createElement("caption");
    caption.innerHtml = "new caption";
    var table = document.getElementById('table1');
    table.caption = caption;

    assert_equals(caption.parentNode, table);
    assert_equals(table.caption.innerHtml, "new caption");

    var captions = table.querySelectorAll('caption');
    assert_equals(captions.length, 2);
    assert_equals(captions[0].innerHtml, "new caption");
    assert_equals(captions[1].innerHtml, "second caption");
  }, "setting caption on a table");

  test((){
    TableElement table2=document.getElementById('table2');
    assert_equals(table2.caption, null);
  }, "caption IDL attribute is null");

  test((){
    var table = document.getElementById('table3');
    var caption = document.createElement("caption");
    table.rows[0].append(caption);
    assert_equals(table.caption, null);
  }, "caption of the third table element should be null");

  test((){
    TableElement table4=document.getElementById('table4');
    assert_not_equals(table4.caption, null);

    table4.caption.remove();

    assert_equals(table4.caption, null);
  }, "dynamically removing caption on a table");
  
  checkTestFailures();
}

