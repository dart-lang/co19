/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void enteredView()
 * Called by the DOM when this element has been inserted into the live document.
 * @description Checks that enteredView() is called when element is inserted
 * into the live document.
 */
import "dart:html";
import "../../../Utils/expect.dart";

class MyIFrameElement extends IFrameElement {
  MyIFrameElement() : super.created();

  enteredView() {
    super.enteredView();
    asyncEnd();
  }
}

main() {
  IFrameElement x = new IFrameElement();
  asyncStart();
  document.body.append(x);
}
