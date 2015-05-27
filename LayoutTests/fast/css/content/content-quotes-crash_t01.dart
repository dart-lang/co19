/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";
import "../../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <p>
          PASS: WebKit didn't crash.
      </p>
      <ruby><q style="column-gap:2;">a</ruby>
          <cite style="word-break: break-all;">a<q style="text-transform:uppercase;">a<sup style="text-overflow:ellipsis;">
      ''', treeSanitizer: new NullTreeSanitizer());
}
