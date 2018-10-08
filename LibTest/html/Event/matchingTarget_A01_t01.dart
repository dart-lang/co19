/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Element get matchingTarget
 * A pointer to the element whose CSS selector matched within which an event
 * was fired.
 * If this Event was not associated with any Event delegation, accessing this
 * value will throw an UnsupportedError.
 * @description Checks expected matchingTarget if there is an event delegation
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var body = document.body;
  var id1 = new DivElement()..id = 'id';
  var id2 = new DivElement()..id = 'id';
  var class1 = new DivElement()..classes.add('class');
  var class2 = new DivElement()..classes.add('class');
  body.append(id1);
  body.append(id2);
  body.append(class1);
  body.append(class2);

  body.onClick.matches('#id').listen((e) {
    Expect.identical(id1, e.matchingTarget);
    asyncEnd();
  });

  body.onClick.matches('.class').listen((e) {
    Expect.identical(class1, e.matchingTarget);
    asyncEnd();
  });

  asyncMultiStart(2);
  id1.click();
  class1.click();
}
