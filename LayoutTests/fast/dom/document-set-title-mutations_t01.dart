/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * @description Test for mutations to childList when setting document.title.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var mutations;
  finish() {
    shouldBe(mutations.length, 1);
    shouldBe(mutations[0].type, "childList");
    shouldBe(mutations[0].addedNodes.length, 1);
    shouldBe(mutations[0].removedNodes.length, 1);
    asyncEnd();
  }

  var titleElement = document.querySelector('title');

  var observer = new MutationObserver((_mutations, observer) {
    mutations = _mutations;
  });
  observer.observe(titleElement, childList: true);
  document.title = "new";

  asyncStart();
  setTimeout(finish, 0);
}
