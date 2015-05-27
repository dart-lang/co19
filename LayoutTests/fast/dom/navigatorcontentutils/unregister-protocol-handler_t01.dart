/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test makes sure that navigator.unregisterProtocolHandler 
 * throws the proper exceptions and has no-op default implementation.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  debug('unregisterProtocolHandler');
  shouldBeNonNull(window.navigator.unregisterProtocolHandler);

  var invalid_protocols = ['http', 'https', 'file', 'web+'];
  invalid_protocols.forEach((protocol) {
    debug('invalid protocol: $protocol');
    shouldThrow(() {
      window.navigator
        .unregisterProtocolHandler(protocol, "invalid protocol %s");
      }, (e) => e is DomException && e.name == DomException.SECURITY);
  });

  var valid_protocols = ['bitcoin', 'geo', 'im', 'irc', 'ircs', 'magnet', 'mailto', 'mms', 'news', 'nntp', 'sip', 'sms', 'smsto', 'ssh', 'tel', 'urn', 'webcal', 'wtai', 'xmpp'];
  valid_protocols.forEach((protocol) {
    debug('valid protocol: $protocol');
    window.navigator.unregisterProtocolHandler(protocol, "valid protocol %s");
  });

  var invalid_urls = ["", "%S"];
  invalid_urls.forEach((url) {
    debug('invalid url: $url');
    shouldThrow(() {
      window.navigator.unregisterProtocolHandler('web+myprotocol', url);
      }, (e) => e is DomException && e.name == DomException.SYNTAX);
  });

  // Test that the API has default no-op implementation.
  var succeeded = true;
  window.navigator.unregisterProtocolHandler('web+myprotocol', "%s");
}
