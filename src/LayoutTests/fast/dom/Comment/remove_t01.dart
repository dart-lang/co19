/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests the DOM 4 remove method on a Comment.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var body = document.body;

  body.setInnerHtml('''
    <div id="test"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var testDiv = document.getElementById('test');
  var comment = new Comment('Comment');
  testDiv.append(comment);
  Expect.equals(1, testDiv.childNodes.length);
  comment.remove();
  Expect.equals(0, testDiv.childNodes.length);
  comment.remove();
  Expect.equals(0, testDiv.childNodes.length);
}
