/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Calling ShadowRoot.cloneNode() should throw a DataCloneError 
 * exception.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var host = document.createElement('div');
  var shadowRoot = host.createShadowRoot();
  shouldThrow(() {
    shadowRoot.clone(false);
  }, (e) => e is DomException && e.name == DomException.DATA_CLONE);
}
