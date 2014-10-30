/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test passes if it does not crash.
 */
import "dart:html";
import "../../../testcommon.dart";
import "../../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <fieldset>
      <fieldset>
      </fieldset>
      </fieldset>
      ''', treeSanitizer: new NullTreeSanitizer());

  var fieldsets = document.getElementsByTagName("fieldset");
  //var fieldsets = document.body.queryAll("fieldset");
  fieldsets[1].disabled = true;
}
