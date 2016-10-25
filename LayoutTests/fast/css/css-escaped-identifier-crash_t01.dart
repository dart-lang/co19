/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test for crash discovered with escapes in CSS identifiers.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html(r'''
      <style>foo { D\\\\\$\eeeeeeeeeee\\\\\\\\\\\\\\\\\\ }</style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);
}
