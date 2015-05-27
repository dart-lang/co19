/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('&nbsp;&nbsp;  ',
      treeSanitizer: new NullTreeSanitizer());

  var regx = new RegExp('&nbsp;', caseSensitive:false);
  var a = document.body.innerHtml.replaceAll(regx, ' ');

  for(var i = 0; i < a.length; i++) {
    shouldBeFalse(a.codeUnitAt(i) != 32 && a.codeUnitAt(i) != 0x0a);
  }
  
  shouldBeTrue(document.body.innerHtml.contains("&nbsp;&nbsp;&nbsp;&nbsp;"));
}
