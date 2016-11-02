/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test passed if not crashed
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <a href="javascript:">foo<img ismap style="content:'bar'; display:block;"></a>
    ''', treeSanitizer: new NullTreeSanitizer());

  (document.getElementsByTagName('img')[0] as Element).click();
}
