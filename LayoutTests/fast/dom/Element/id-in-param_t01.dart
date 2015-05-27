/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test using id in param element.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <object width=100 height=100>
      <param name="movie" id="id1">
    </object>    
    ''', treeSanitizer: new NullTreeSanitizer());

  Expect.isNotNull(document.getElementById("id1"));
}
