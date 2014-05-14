/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test ensure that the shadow related elements are
 * instantiated even inside frameless documents.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var doc = document.implementation.createHtmlDocument('');
  var container = doc.createElement("span");
  doc.body.append(container);
  container.setInnerHtml(
      "<content id='contentElement'></content><shadow id='shadowElement'></shadow>",
      treeSanitizer: new NullTreeSanitizer());

  var content = container.querySelector("#contentElement");
  var shadow = container.querySelector("#shadowElement");

  debug("Testing on the frame-less document.");
  shouldBeTrue(content is ContentElement);
  shouldBeTrue(shadow is ShadowElement);

  debug("Moving to the main document.");
  document.body.append(container);
  shouldBeTrue(content is ContentElement);
  shouldBeTrue(shadow is ShadowElement);
}
