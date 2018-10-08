/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that ownerNode of orphan sheet is null.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var link = new Element.html('''
    <link id="target" rel="stylesheet" href="old_IntentionallyMissingFile.css">
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(link);

  asyncStart();
  window.onLoad.listen((_) {
    LinkElement target = document.getElementById('target');
    var oldSheet = target.sheet;
    target.setAttribute("href", "new_IntentionallyMissingFile.css");
    
    waitAndTest() {
      if (0 <= target.sheet.href.indexOf("old_IntentionallyMissingFile.css"))
          return setTimeout(waitAndTest, 0);
      shouldBeNull(oldSheet.ownerNode);
      if (oldSheet.ownerNode != null)
          asyncEnd();
      // We need to exercise cached case as well, which can be executed with a reload.
      if (0 <= window.location.toString().indexOf("?reloaded"))
          asyncEnd();
      window.location.href += "?reloaded";
    };

    setTimeout(waitAndTest, 0);
  });
}
