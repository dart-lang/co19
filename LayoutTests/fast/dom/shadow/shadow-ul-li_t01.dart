/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test should not crash
 */
import "dart:html";

main() {
  var host = document.createElement('div');
  document.body.append(host);
  var shadow = host.createShadowRoot();

  var ul = document.createElement('ul');
  var li = document.createElement('li');
  ul.append(li);
  shadow.append(ul);
  document.body.offsetLeft;

  document.body.innerHtml = 'PASS unless crash.';
}
