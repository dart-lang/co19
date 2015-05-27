/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test makes sure that navigator.registerProtocolHandler 
 * throws the proper exceptions and has no-op default implementation.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  debug('registerProtocolHandler');
  shouldBeNonNull(window.navigator.registerProtocolHandler);

  var invalid_protocols = ['http', 'https', 'file', 'web+'];
  invalid_protocols.forEach((protocol) {
    debug('invalid protocol: $protocol');
    shouldThrow(() {
      window.navigator
        .registerProtocolHandler(protocol, "invalid protocol %s", "title");
      }, (e) => e is DomException && e.name == DomException.SECURITY);
  });

  var valid_protocols = ['bitcoin', 'geo', 'im', 'irc', 'ircs', 'magnet', 'mailto', 'mms', 'news', 'nntp', 'sip', 'sms', 'smsto', 'ssh', 'tel', 'urn', 'webcal', 'wtai', 'xmpp'];
  valid_protocols.forEach((protocol) {
    debug('valid protocol: $protocol');
    window.navigator
      .registerProtocolHandler(protocol, "valid protocol %s", "title");
  });

  var invalid_urls = ["", "%S"];
  invalid_urls.forEach((url) {
    debug('invalid url: $url');
    shouldThrow(() {
      window.navigator.registerProtocolHandler('web+myprotocol', url, 'title');
      }, (e) => e is DomException && e.name == DomException.SYNTAX);
  });

  // Test that the API has default no-op implementation.
  window.navigator.registerProtocolHandler('web+myprotocol', "%s", "title");
}
