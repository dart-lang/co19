/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var style = document.createElement('style');
  style.append(new Text("input { color: green; }"));
  style.append(new Text("input:checked { color: red; }"));
  document.documentElement.firstChild.append(style);

  var input1 = document.createElement('input');
  input1.type = 'radio';
  document.body.append(input1);
  input1.checked = true;
  input1.type = "text";

  shouldBeEqualToString(input1.getComputedStyle().getPropertyValue('color'),
      "rgb(0, 128, 0)");
  shouldBeTrue(input1.checked);

  // cleanup
  input1.remove();
}

