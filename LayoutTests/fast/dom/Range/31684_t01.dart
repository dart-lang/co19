/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks an orphan text node cannot be surrounded by 
 * the range. (bug31684)
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var range = document.createRange();
  var text = new Text('hello');
  var element = document.createElement("div");
  range.selectNodeContents(text);

  shouldThrow(() {
    range.surroundContents(element);
  }, (e) => e is DomException && e.name == DomException.HIERARCHY_REQUEST);
}
