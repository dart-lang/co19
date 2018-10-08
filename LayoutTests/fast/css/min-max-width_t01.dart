/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests offsetWidth using min-width and max-width
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  testWidth(style)
  {
    var div = document.createElement('div');
    div.setAttribute('style', 'width:100px;' + style);
    document.body.append(div);

    var result = div.offsetWidth;
    div.remove();
    return result;
  }

  shouldBe(testWidth("max-width:150px"), 100);
  shouldBe(testWidth("max-width:50px"), 50);
  shouldBe(testWidth("min-width:150px"), 150);
  shouldBe(testWidth("min-width:50px"), 100);
}

