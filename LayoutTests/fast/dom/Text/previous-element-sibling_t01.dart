/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests the ChildNode interface previousElementSibling 
 * property on a Text node.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var element = document.createElement('div');
  var a = element.append(new Text('a'));
  shouldBeNull(a.previousElementSibling);
  var b = element.insertBefore(document.createElement('b'), a);
  shouldBe(a.previousElementSibling, b);
  var c = element.insertBefore(new Comment('c'), a);
  shouldBe(a.previousElementSibling, b);
}
