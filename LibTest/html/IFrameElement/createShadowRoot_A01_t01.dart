/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ShadowRoot createShadowRoot()
 * Creates a new shadow root for this shadow host.
 * from W3C: The nodeType attribute of a ShadowRoot instance must return
 * OCUMENT_FRAGMENT_NODE.
 * Accordingly, the nodeName attribute of a ShadowRoot instance must return
 * "#document-fragment".
 * @description Checks that a correct ShadowRoot is returned.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  IFrameElement x = new IFrameElement();
  print("before");
  ShadowRoot r = x.createShadowRoot();
  print("after");
  Expect.equals(Node.DOCUMENT_FRAGMENT_NODE, r.nodeType);
  Expect.equals("#document-fragment", r.nodeName);
}
