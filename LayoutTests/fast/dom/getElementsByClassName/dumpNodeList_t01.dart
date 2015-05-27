/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div class="one">Line 1<div class="two">Line 2</div><p>Line <i>3</i></p></div>
    <div id="test" class="one two"><div class="one two">line 4</div><p class="two">line 5</p></div>
    <p><ol id="console"></ol></p>
    ''', treeSanitizer: new NullTreeSanitizer());

   dump(list) => list.map((x) => x.runtimeType).toList();

   var i = 0;

   test(actual, expected) {
     debug('test${++i}');
     shouldBeList(actual, expected);
   }

   var elm = document.getElementById("test");

   test(dump(document.getElementsByClassName("one")),
       [DivElement, DivElement, DivElement]); 
   test(dump(document.getElementsByClassName("two")),
       [DivElement, DivElement, DivElement, ParagraphElement]);
   test(dump(document.getElementsByClassName("one two")),
       [DivElement, DivElement]);
   test(dump(document.getElementsByClassName("one\t\t\n \ftwo")),
       [DivElement, DivElement]);
   test(dump(document.getElementsByClassName("")), []);
   test(dump(document.getElementsByClassName("onetwo")), []);
   test(dump(elm.getElementsByClassName("one")), [DivElement]);
   test(dump(elm.getElementsByClassName("two")), [DivElement, ParagraphElement]);
   test(dump(elm.getElementsByClassName("one two")), [DivElement]);
   test(dump(elm.getElementsByClassName("one\t\t\n \ftwo")), [DivElement]);
   test(dump(elm.getElementsByClassName("")), []);
   test(dump(elm.getElementsByClassName("onetwo")), []);
}
