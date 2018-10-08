/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that a live list is updated after the child of an 
 * HTMLOutputElement was removed.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <output id="parentOutput"><span class="inner" id="first"></span><span class="inner" id="second"></span></output>
    ''', treeSanitizer: new NullTreeSanitizer());

  List list = document.getElementsByClassName("inner");
  debug("The number of spans before removal is ${list.length}");
  var beforeLength = list.length;
  document.getElementById("first").remove();
  debug("The number of spans after removal is ${list.length}");
  shouldBeTrue(list.length == beforeLength - 1);
}
