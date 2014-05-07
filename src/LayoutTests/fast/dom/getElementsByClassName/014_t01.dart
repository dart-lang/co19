/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description document.getElementsByClassName(): case sensitive (quirks mode)
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var doc = new DomParser().parseFromString('''
<html class="a A">
 <body class="a a">
 </body>
</html>
      ''', 'text/html');

  // We differ from Opera's implementation here.  We are case-insensitive in quirks mode.
  // t(document.getElementsByClassName("A a"), [document.documentElement])
  shouldBeList(doc.getElementsByClassName("A a"),
      [doc.documentElement, doc.body]);
}
