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

main() {
  document.body.setInnerHtml('''
<style>
div + * {}
</style>
<p id="container"><textarea>a
</textarea></p>
      ''', treeSanitizer: new NullTreeSanitizer());

  var textarea = document.body.querySelector('textarea');

  textarea.focus();
  textarea.selectionStart = 1;
  textarea.selectionEnd = 1;
  document.execCommand('InsertLineBreak', false, null);

  document.body.text = "This test verifies WebKit doesn't crash even if the DOM changes in shadow DOM caused the shadow host's style to change.\nPASS";
}
