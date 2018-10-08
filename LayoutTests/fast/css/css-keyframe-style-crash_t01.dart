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

main() {
  var index = document.getElementsByTagName("style").length; // skip test framework's ones
  var rule;

  crash()
  {
    gc();
    var obj = rule.style.parentRule;
    asyncEnd();
  }

  load()
  {
    var style = document.createElement('style');
    style.text = '@-webkit-keyframes anim { from { color: green } }';
    document.head.append(style);
    CssKeyframesRule sr = (document.styleSheets[index] as CssStyleSheet).cssRules[0];
    rule = sr.findRule('from');
    style.remove();
    setTimeout(crash, 0);
  }

  asyncStart();
  load();
}

