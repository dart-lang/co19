/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description PASS unless crash
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <div id=div1>
        <style scoped></style>
      </div>
      <div id=div2></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  (() { 
    var div1 = document.getElementById("div1");
    var div2Shadow = document.getElementById("div2").createShadowRoot();
    div2Shadow.append(div1);
    div1.remove();
  })();

  gc();

  asyncStart();
  setTimeout(() {
    document.body.append(document.createElementNS("http://www.w3.org/2000/svg", "font-face"));
    asyncEnd();
  }, 0);
}
