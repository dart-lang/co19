/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for child elements of a datalist element.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <datalist id="dl1">Text is ok.</datalist>
      <datalist id="dl2"><b>An inline element is ok.</b></datalist>
      <datalist id="dl3"><div>A block element is not ok.</div></datalist>
      ''', treeSanitizer: new NullTreeSanitizer());

  var datalist = document.getElementById('dl1');
  shouldBe(datalist.firstChild.nodeName, "#text");

  datalist = document.getElementById('dl2');
  shouldBe(datalist.firstChild.nodeName, "B");

  datalist = document.getElementById('dl3');
  shouldBe(datalist.firstChild.nodeName, "DIV");
}
