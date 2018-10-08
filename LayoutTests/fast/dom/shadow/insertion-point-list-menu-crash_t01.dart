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

main() {
  boom(_) {
    var div = document.createElement('div');

    var older = div.createShadowRoot();
    older.append(document.createElement('div'));
    document.documentElement.append(div);

    var younger = div.createShadowRoot();
    var select = document.createElement('select');
    var shadow = document.createElement('shadow');
    select.append(shadow);
    younger.append(select);

    testPassed("unless crash");
    asyncEnd();
  }

  asyncStart();
  window.onLoad.listen(boom);
}
