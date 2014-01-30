/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Document ownerDocument
 * The document this node belongs to.
 * MDN:  If this property is used on a node that is itself a document, the result is null.
 * Returns null if this node does not belong to any document.
 * @description Checks that document does not belong to any document.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  Expect.isNull(document.ownerDocument);
}
