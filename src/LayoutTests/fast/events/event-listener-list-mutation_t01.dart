/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests that event list mutation preserves the order of event
 * firing.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  TestMutation(remover, removee, result)
  {
    var report = [];

    var node = document.createElement("button");
    var eventType = "click";
    document.body.append(node);

    var listeners;

    mutateList(me)
    {
      if (remover == me)
        node.removeEventListener(eventType, listeners[removee], false);
      report.add(me);
    }

    listeners = [
      (_) { mutateList(0); },
      (_) { mutateList(1); },
      (_) { mutateList(2); }
    ];

    listeners.forEach((listener) { node.addEventListener(eventType, listener, false); });

    node.click();
    node.remove();

    var log = "listener $remover removing listener $removee";

    if (report.join(" ") == result)
      testPassed(log);
    else
      testFailed(log);
  }

  debug("self-removal:");
  TestMutation(0, 0, "0 1 2");
  TestMutation(1, 1, "0 1 2");
  TestMutation(2, 2, "0 1 2");

  debug("successor removal:");
  TestMutation(0, 1, "0 2");
  TestMutation(0, 2, "0 1");

  debug("predecessor removal:");
  TestMutation(2, 0, "0 1 2");
  TestMutation(2, 1, "0 1 2");
}
