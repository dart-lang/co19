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
  appendItem(list, caption)
  {
    var item = document.createElement('li');
    item.append(new Text(caption));
    list.append(item);
  }

  var fragment = document.createDocumentFragment();
  var list = document.createElement('ul');
  var i;
  for (i = 0; i < 5; i++)
    appendItem(list, 'item $i');

  fragment.append(list);
  document.addEventListener("DOMNodeRemoved", (_) {
    appendItem(list, 'item ${i++}');
  }, false);

  document.body.append(fragment);
  list.text = '';

  shouldBe(list.childNodes.length, 0);
}
