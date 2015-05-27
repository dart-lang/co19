/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that WebKitMutationObserver.observe throws exceptions
 * appropriately
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../../Utils/async_utils.dart";
import "../../../testcommon.dart";

main() {
  var observer = new MutationObserver((mutations, observer) { });
  shouldThrow(() => observer.observe());
  shouldThrow(() => observer.observe(null));
  shouldThrow(() => observer.observe(document.body));
  shouldThrow(() => observer.observe(document.body, null));
  shouldThrow(() => observer.observe(null, attributes: true));
  shouldThrow(() => observer.observe(document.body, subtree: true));
  shouldThrow(() => observer.observe(document.body, attributes: false, attributeOldValue: true));
  shouldThrow(() => observer.observe(document.body, attributes: false, attributeFilter: ["id"]));
  shouldThrow(() => observer.observe(document.body, attributes: false, attributeOldValue: false));
  shouldThrow(() => observer.observe(document.body, characterData: false, characterDataOldValue: true));
  shouldThrow(() => observer.observe(document.body, characterData: false, characterDataOldValue: false));
}
