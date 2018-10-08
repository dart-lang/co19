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
  var finishTest;

  document.body.innerHtml = 'PASS';

  asyncStart();

  window.onLoad.listen((_) {
    Element element = document.body.append(document.createElement("a"));

    element.setAttributeNS("namespace", "id", "foo");
    element.setAttribute("id", "bar");

    element.remove();
    element = null;
    gc();

    setTimeout(finishTest, 0);
  });

  finishTest = ()
  {
    document.getElementById("bar");
    asyncEnd();
  };
}
