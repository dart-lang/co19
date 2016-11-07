/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test passes if it does not crash
 */
import "dart:html";

main() {
  var div = document.createElement('div');
  var span = document.createElement('span');
  div.append(span);
  var observer = new MutationObserver((m,o){});
  observer.observe(div, attributes: true, subtree: true);
  span.remove(); // cause span to become transiently observed
  div = null;
  observer.disconnect();
}
