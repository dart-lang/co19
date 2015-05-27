/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test makes sure that navigator.isProtocolHandlerRegistered
 * throws the proper exceptions and returns the default state of handler.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  debug('isProtocolHandlerRegistered');
  shouldBeNonNull(window.navigator.isProtocolHandlerRegistered);

  debug('invalidUrl');
  var invalidUrl = "%S";
  shouldThrow(() {
    window.navigator.isProtocolHandlerRegistered("ssh", invalidUrl);
  }, (e) => e is DomException && e.name == DomException.SYNTAX);


  // FIXME: Need to check if this function can return 'registered' and 'declined' states as well.
  debug("new");
  var state = window.navigator
    .isProtocolHandlerRegistered("bitcoin", "valid protocol %s");
  shouldBe(state, "new");
}
