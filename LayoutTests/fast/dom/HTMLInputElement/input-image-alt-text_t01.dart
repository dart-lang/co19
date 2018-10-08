/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests whether alt text is shown for image-type form 
 * input elements with no src attribute.
 */
import "dart:html";
import "../../../testcommon.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
    <form>
    <input type="image" alt="PASS"><br>
    <input type="image" alt="PASS" width="100" height="50" border="1"><br>

    <input type="image" src="$root/resources/blue_rect.jpg" alt="FAILED!"><br>
    ''', treeSanitizer: new NullTreeSanitizer());
}
