/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks for a regression where scriptable plugins hide
 * properties of the OBJECT element.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <object id="obj" type="video/quicktime"><!-- quicktime -->
      </object>
      ''', treeSanitizer: new NullTreeSanitizer());

  var result = document.getElementById('obj').children;
  shouldBeList(result, []);
}
