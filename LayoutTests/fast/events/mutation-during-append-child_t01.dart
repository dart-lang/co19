/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Ensures that appendChild() throws an exception if mutation even
 * handler does something wrong
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <div>
        <div id="child"></div>
        <div id="newparent"></div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var child = document.getElementById('child');
  var newparent = document.getElementById('newparent');

  EventListener listener;
  listener = (_) {
    document.removeEventListener("DOMNodeRemoved", listener, false);
    child.append(newparent);
  };

  document.addEventListener("DOMNodeRemoved", listener, false);

  shouldThrow(() => newparent.append(child),
      (e) => e is DomException && e.name == DomException.HIERARCHY_REQUEST);
}
