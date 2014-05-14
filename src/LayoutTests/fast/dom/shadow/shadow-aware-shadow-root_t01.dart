/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests for ShadowAware.shadowRoot property.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var host = document.createElement('div');
  shouldBeNull(host.shadowRoot);
  var root1 = host.createShadowRoot();
  shouldBe(host.shadowRoot, root1);
  var root2 = host.createShadowRoot();
  shouldBe(host.shadowRoot, root2);

  var hostWithUAShadow = document.createElement('input');
  shouldBeNull(hostWithUAShadow.shadowRoot);
}
