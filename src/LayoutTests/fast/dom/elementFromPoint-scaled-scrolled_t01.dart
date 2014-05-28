/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test is successful if elementFromPoint returns the correct
 * element.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setAttribute('style',
      "width:2000px;height:2000px;margin:0px;padding:100px");

  document.body.setInnerHtml('''
<button style="width:50px;height:50px;">B1</button><button style="width:50px;height:50px;">B2</button><button style="width:50px;height:50px;">B3</button>
<div>This test is successful if elementFromPoint returns the correct element.</div>''', treeSanitizer: new NullTreeSanitizer());

  window.scrollTo(100,100);

  shouldBe(document.elementFromPoint(125, 25).text, 'B3');
}
