/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion DocumentFragment createFragment(String html,
 * {NodeValidator validator, NodeTreeSanitizer treeSanitizer})
 * Create a DocumentFragment from the HTML fragment and ensure that it
 * follows the sanitization rules specified by the validator or treeSanitizer.
 * The returned tree is guaranteed to only contain nodes and attributes which
 * are allowed by the provided validator.
 * @description Checks that if validator and sanitizer are omitted,
 * unknown elements and attribues are removed from provided html.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  IFrameElement x = new IFrameElement();
  var f = x.createFragment('<div foo="foo"><bar id="bar"></bar></div>');
  DivElement div = f.firstChild;

  Expect.mapEquals({}, div.attributes);

  var bar = f.querySelector('#bar');
  Expect.isNull(bar);
}
