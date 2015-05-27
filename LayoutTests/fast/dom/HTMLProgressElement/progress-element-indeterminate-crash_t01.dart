/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for https://bugs.webkit.org/show_bug.cgi?id=102459.
 * OK if not crashed.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <progress indeterminate="true"></progress>
    <p>PASS unless crash.</p>
    ''', treeSanitizer: new NullTreeSanitizer());
}

