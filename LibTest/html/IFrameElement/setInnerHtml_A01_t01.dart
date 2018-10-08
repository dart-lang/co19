/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void setInnerHtml(String html, {NodeValidator validator,
 * NodeTreeSanitizer treeSanitizer}) 
 * Parses the HTML fragment and sets it as the contents of this element.
 * This ensures that the generated content follows the sanitization rules
 * specified by the validator or treeSanitizer.
 * The resulting tree is guaranteed to only contain nodes and attributes
 * which are allowed by the provided validator.
 * @description Checks that if validator and sanitizer are omitted,
 * unknown elements and attribues are removed from provided html.
 * @needsreview issue #17456
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  IFrameElement x = new IFrameElement();
  x.setInnerHtml('<div foo="foo"><bar id="bar"></bar></div>');
  DivElement div = x.firstChild;
  print("div=${div.runtimeType} ${div.toString()}");
  Expect.mapEquals({}, div.attributes);

  var bar = div.querySelector('#bar');
  Expect.isNull(bar);
}
