/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ElementList queryAll(String selectors)
 * Alias for querySelectorAll
 * @description Checks various selectors (not exhaustive)
 * @note deprecated
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  // make html and include copy of itself

  var html = '';
  for (var x in [1,2]) {
      html = '<div>'
               '<span>'
               '''<hr><pre
                           id="myid"
                           class="foo bar"
                           lang="en">'''
                     '$html' // include itself
                     '</pre>'
               '</span>'
             '</div>';
  }

  var e = new Element.html(html, treeSanitizer: new NullTreeSanitizer());

  testTrue(list, testName) {
    Expect.equals(2, list.length, testName);
    Expect.isTrue(list[0] is PreElement, '$testName arg0');
    Expect.isTrue(list[1] is PreElement, '$testName arg1');
  }

  testFalse(list, testName) {
    Expect.listEquals([], list, testName);
  }

  testTrue(e.queryAll('pre'), 'Type selector');
  
  testFalse(e.queryAll('table'), 'Type selector, negative');
  
  testTrue(e.queryAll('span pre'), 'Descendant selector, direct');
  
  testTrue(e.queryAll('div pre'), 'Descendant selector, indirect');
  
  testTrue(e.queryAll('* pre'), 'Descendant selector, any');
  
  testTrue(e.queryAll('span > pre'), 'Child selector');
  
  testFalse(e.queryAll('div > pre'), 'Child selector, negative');
  
  testFalse(e.queryAll('pre:first-child'), 'The :first-child pseudo-class');
  
  testTrue(e.queryAll('pre:lang(en)'), 'The :lang() pseudo-class');

  testFalse(e.queryAll('pre:lang(fr)'), 'The :lang() pseudo-class');

  testTrue(e.queryAll('hr + pre'), 'Adjacent selector');
  
  testFalse(e.queryAll('div + pre'), 'Adjacent selector, negative');

  testTrue(e.queryAll('pre[id]'), 'Attribute selector 1');
  
  testFalse(e.queryAll('pre[foo]'), 'Attribute selector 1, negative');
  
  testTrue(e.queryAll('pre[id="myid"]'), 'Attribute selector 2');
  
  testFalse(e.queryAll('pre[id="myid2"]'), 'Attribute selector 2, negative');
  
  testTrue(e.queryAll('pre[class~="bar"]'), 'Attribute selector 3');

  testFalse(e.queryAll('pre[class~="baz"]'), 'Attribute selector 3, negative');

  testTrue(e.queryAll('pre[lang|="en"]'), 'Attribute selector 4');
  
  testFalse(e.queryAll('pre[lang|="fr"]'), 'Attribute selector 4, negative');
  
  testTrue(e.queryAll('pre.foo'), 'Class selector');
  
  testFalse(e.queryAll('pre.baz'), 'Class selector, negative');
  
  testTrue(e.queryAll('pre#myid'), 'Id selector');
  
  testFalse(e.queryAll('pre#baz'), 'Id selector, negative');
}
