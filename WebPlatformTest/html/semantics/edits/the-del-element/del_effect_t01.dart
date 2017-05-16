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
 * after web-platform-tests/html/semantics/edits/the-del-element/del_effect.html
 * @assertion http://www.w3.org/TR/2012/CR-html5-20121217/edits.html#the-del-element
 * @description Text in the del element should be 'line-through'
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
<p><del>crossed-off text</del></p>
''';

void main() {
  document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);
  var element = document.getElementsByTagName('del')[0] as Element;
  var textDecoration = element.getComputedStyle().textDecorationLine;
  if (textDecoration==null || textDecoration == "") {
    textDecoration = element.getComputedStyle().textDecoration;
  }
  Expect.isTrue(textDecoration.contains('line-through'));
 }
