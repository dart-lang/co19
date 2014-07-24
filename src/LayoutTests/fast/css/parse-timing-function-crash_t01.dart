/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <p style="-webkit-transition-timing-function: cubic-bezier(0.5, 0.2, 0.8, 0.9);">This paragraph has a -webkit-transition-timing-function property that uses the cubic-bezier function. Parsing its style should not cause the browser to crash.</p>
      ''', treeSanitizer: new NullTreeSanitizer());
}
