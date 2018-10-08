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
  document.body.setInnerHtml('''
      Test passes if it does not crash.
      <form>
      <input id="submit" type="submit" />
      </form>
      ''', treeSanitizer: new NullTreeSanitizer());

  var textNode = new Text("x");
  document.getElementById("submit").append(textNode);

  runTest() {
    asyncEnd();
    var event = new MouseEvent("click");
    textNode.dispatchEvent(event);
  }

  asyncStart();
  setTimeout(runTest, 0);
}
