/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Moving an event listener between documents should keep it active
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var doc = document.implementation.createHtmlDocument('');
  var div = doc.createElement('div');
  var addedCalls = 0;
  var removedCalls = 0;
  div.addEventListener('DOMNodeInserted', (_) { addedCalls++; });
  div.addEventListener('DOMNodeRemoved', (_) { removedCalls++; });
  document.body.append(div);
  shouldBe(addedCalls, 1);
  div.append(document.createElement('span'));
  shouldBe(addedCalls, 2);
  div.firstChild.remove();
  shouldBe(removedCalls, 1);
}
