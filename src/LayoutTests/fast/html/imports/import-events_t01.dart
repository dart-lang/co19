/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that events can be fired on imported documents.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../../Utils/async_utils.dart";
import "../../../testcommon.dart";
import "pwd.dart";

main() {
  document.head.append(new Element.html('''
    <link id="harness" rel="import" href="$root/resources/import-events-target.html">
    ''', treeSanitizer: new NullTreeSanitizer()));

  handle(list, id) => (event) {
    list.add(event.type + "@" + id);
  }

  testEventsFiredOn(doc) {
    var caughtFoo = [];
    var root = doc.documentElement;
    var target = doc.getElementById("target");

    target.addEventListener("foo", handle(caughtFoo, "target"));
    root.addEventListener("foo", handle(caughtFoo, "root"));
    target.dispatchEvent(new Event("foo", canBubble: true ));

    Expect.listEquals(['foo@target', 'foo@root'], caughtFoo);
  }

  testEventsFiredOn(document.getElementById('harness').import);
}
