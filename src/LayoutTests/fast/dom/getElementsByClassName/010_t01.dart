/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description document.getElementsByClassName(): compound
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var doc = new DomParser().parseFromString('''
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:g="http://www.w3.org/2000/svg">
 <body>
  <x class="a"/>
  <g:x class="a"/>
 </body>
</html>
      ''', 'text/xml');

  shouldBeList(doc.getElementsByClassName("a"),
      doc.getElementsByTagName("x"));
}

