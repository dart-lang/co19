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

getComputedStyle(x, [pseudoElement]) => x.getComputedStyle(pseudoElement);

main() {
  document.body.setInnerHtml('''
      This test ensures that whatever written within dfn tag is italicized. <br>
      For example the <dfn id="dfntag">dfn</dfn> should be italicized.
      ''', treeSanitizer: new NullTreeSanitizer());

  var dfnfont = getComputedStyle(document.getElementById('dfntag'))
      .getPropertyValue("font-style");

  shouldBe(dfnfont, 'italic');
}
