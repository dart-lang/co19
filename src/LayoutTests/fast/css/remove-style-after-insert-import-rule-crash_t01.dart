/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description crbug.com/344310: crash in WebCore::CSSStyleSheet::sheetLoaded.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style id='target'>
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <pre id="console"></pre>
      ''', treeSanitizer: new NullTreeSanitizer());

  var target = document.querySelector('#target');
  style.sheet.insertRule('@import url("$root/resources/red.css");', 0);
  target.remove();
}
