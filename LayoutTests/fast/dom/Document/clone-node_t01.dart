/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests cloneNode for Document.
 */
import "dart:html";
import "../../../../Utils/expect.dart";

main() {
  dynamic doc = document.implementation.createDocument('', 'root', null);
  Expect.isTrue(doc.clone(false) is Document);
  Expect.equals('root', doc.clone(true).documentElement.localName);
}
