/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that innerHTML does not mangle javascript: urls.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  var body = document.body;

  body.setInnerHtml('''
<div id=console></div>
<div id=jsurltest><a href='
 javascript:test(&37;3C!--D--&37;3E)'>link</a></div>
''', treeSanitizer: new NullTreeSanitizer());

  Element r = document.getElementById('jsurltest');

  r.setInnerHtml(r.innerHtml.replaceAll('&amp;37;3C!--D--&amp;37;3E', '123'),
      treeSanitizer: new NullTreeSanitizer());

  Expect.isTrue(r.innerHtml.indexOf('javascript:test(123)') > -1, 'Test point 1');

  (r.firstChild as Element).setAttribute('href', 'javascript:test("text<")');
  Expect.isTrue(r.innerHtml.indexOf('javascript:test("text<")') > -1, 'Test point 2');

  (r.firstChild as Element).setAttribute('href', "javascript:test('text>')");
  Expect.isTrue(r.innerHtml.indexOf("javascript:test('text>')") > -1, 'Test point 3');

  var testString = '''javascript:test('text&',"test2&")''';
  (r.firstChild as Element).setAttribute('href', testString);
  Expect.isTrue(r.innerHtml.indexOf('''javascript:test('text&amp;',&quot;test2&amp;&quot;)''') > -1, 'Test point 4');

  (r.firstChild as Element).setAttribute('href', 'http://www.google.fi/search?q=scarlett johansson&meta=&btnG=Google-haku');
}

