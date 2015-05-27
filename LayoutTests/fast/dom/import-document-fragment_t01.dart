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
  var xmld = new DomParser().parseFromString( "<doc/>", "text/xml");

  var fragment = document.createDocumentFragment();
  fragment.append(new Text("1"));
  fragment.append(new Text("2"));

  var importedFragment = xmld.importNode(fragment, true);
  xmld.firstChild.append(importedFragment);
  shouldBe(xmld.firstChild.text, "12");
}
