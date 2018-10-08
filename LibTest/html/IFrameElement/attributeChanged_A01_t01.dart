/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void attributeChanged(String name, String oldValue, String newValue)
 * Called by the DOM whenever an attribute on this has been changed.
 * @description Checks that attributeChanged is called and called with correct
 * parameters.
 */
import "dart:html";
import "../../../Utils/expect.dart";

class MyIFrameElement extends IFrameElement {
  MyIFrameElement() : super.created();

  attributeChanged(String name, String oldValue, String newValue) {
    super.attributeChanged(name, oldValue, newValue);
    Expect.equals('foo', name, 'name');
    Expect.equals('old-val', oldValue, 'old-val');
    Expect.equals('new-val', newValue, 'new-val');
    asyncEnd();
  }
}

main() {
  IFrameElement x = new MyIFrameElement();
  x.attributes['foo'] = 'old-val';
  document.body.append(x);

  asyncStart();
  x.attributes['foo'] = 'new-val';
}
