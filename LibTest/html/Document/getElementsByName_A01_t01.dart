/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<Node> getElementsByName(String elementName)
 * Returns a list of elements with the given name.
 * @description Checks that a list of elements with the given name is returned.
 */
import "dart:html";
import "../../../Utils/expect.dart";

const myButton = "myButton";

main() {
  List<Node> lst = document.getElementsByName(myButton);
  Expect.equals(0, lst.length);

  var x1 = new Element.html('<button name="$myButton"></button>');
  var y = new DivElement();
  y.append(x1);
  document.body.append(y);
  lst = document.getElementsByName(myButton);
  Expect.equals(1, lst.length);
  Expect.equals(x1, lst[0]);

  var x2 = new Element.html('<form name="$myButton"></form>');
  document.body.append(x2);
  lst = document.getElementsByName(myButton);
  Expect.equals(2, lst.length);
  // order is not guarateed, so cannot compare lists directly
  Expect.isTrue(lst.contains(x1));
  Expect.isTrue(lst.contains(x2));
}
