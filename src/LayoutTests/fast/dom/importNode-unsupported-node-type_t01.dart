/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description importNode should throw informative errors for unsupported node
 * types
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var doc = document.implementation.createHtmlDocument('');
  shouldThrow(() => document.importNode(doc));

  var shadow = document.createElement('div').createShadowRoot();
  shouldThrow(() => document.importNode(shadow));
}
