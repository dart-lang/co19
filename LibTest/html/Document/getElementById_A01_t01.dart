/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Element getElementById(String elementId)
 * Returns an object reference to the identified element.
 * @description Checks that a reference to the identified element is returned.
 */
import "dart:html";
import "../../../Utils/expect.dart";

const myButton = "myButton";

main() {
  var x = new Element.html('<button id="$myButton"></button>');
  var y = new DivElement();
  y.append(x);
  document.body.append(y);

  var z = document.getElementById(myButton);
  Expect.equals(x, z);
}
