/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description document.getElementsByClassName(): "tricky" compound
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var doc = new DomParser().parseFromString('''
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:g="http://www.w3.org/2000/svg" xmlns:h="http://www.w3.org/1999/xhtml" xmlns:t="http://tc.labs.opera.com/#test">
 <body>
  <x class="a"/>
  <g:x class="a"/>
  <x t:class="a" h:class="a" g:class="a"/>
  <g:x t:class="a" h:class="a" g:class="a"/>
  <t:x class="a" t:class="a" h:class="a" g:class="a"/>
 </body>
</html>
      ''', 'text/xml');

  var collection = doc.getElementsByClassName("a"),
      test = doc.getElementsByTagName("x");

  shouldBeList(collection, [test[0], test[1]]);
}
