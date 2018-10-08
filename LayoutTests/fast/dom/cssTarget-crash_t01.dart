/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Should not crash.
 * rdar://4504805&4577323&4643028&5659812
 */
import "dart:html";
import "dart:math";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <form name="f" method="GET" action="#a"></form>
    <div id="anchors"><a name="a"></a></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var stopped = false;

  doIt() {
    if (stopped) {
      asyncEnd();
      return;
    }
    FormElement form = document.body.querySelector('form');
    form.submit();
    var x = new Random().nextDouble();
    setTimeout(doIt, 10);
    form.action = "#$x";
    document.getElementById("anchors").innerHtml +=
      '<img width=100 height=100><a name="$x"></a>';
  }
  asyncStart();
  setTimeout(doIt, 0);
  setTimeout(() => stopped = true, 100);

}
