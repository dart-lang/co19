 /*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests that when an href attribute is set, the href is no longer
 * subject to updates to the document base URI.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var a = document.createElement('a');
  var base = document.createElement('base');
  document.head.append(base);

  debug("Search attribute, update document base URI without attribute having been set");
  base.href = "http://old_base/";
  a.href = "?search";
  base.href = "http://new_base/";
  shouldBe(a.href, 'http://new_base/?search');

  debug("Search attribute, update document base URI after attribute has been set");
  base.href = "http://old_base/";
  a.href = "?foo";
  a.search = "search";
  base.href = "http://new_base/";
  shouldBe(a.href, 'http://old_base/?search');

  debug("Pathname attribute, update document base URI without attribute having been set");
  base.href = "http://old_base/";
  a.href = "path";
  base.href = "http://new_base/";
  shouldBe(a.href, 'http://new_base/path');

  debug("Pathname attribute, update document base URI after attribute has been set");
  base.href = "http://old_base/";
  a.href = "foo";
  a.pathname = "path";
  base.href = "http://new_base/";
  shouldBe(a.href, 'http://old_base/path');

  debug("Hash attribute, update document base URI without attribute having been set");
  base.href = "http://old_base/";
  a.href = "#hash";
  base.href = "http://new_base/";
  shouldBe(a.href, 'http://new_base/#hash');

  debug("Pathname attribute, update document base URI after attribute has been set");
  base.href = "http://old_base/";
  a.href = "#foo";
  a.hash = "hash";
  base.href = "http://new_base/";
  shouldBe(a.href, 'http://old_base/#hash');


  debug('Note that for the following attributes, updating the document base URI has no effect because we have to use an abosulte URL for the href in order to set an initial value for the attribute we wish to update. They are included for completeness.');

  debug("Host attribute, update document base URI without attribute having been set");
  base.href = "http://old_base/";
  a.href = "http://host:0";
  base.href = "http://new_base/";
  shouldBe(a.href, 'http://host:0/');

  debug("Host attribute, update document base URI after attribute has been set");
  base.href = "http://old_base/";
  a.href = "http://foo:80";
  a.host = "host:0";
  base.href = "http://new_base/";
  shouldBe(a.href, 'http://host:0/');


  debug("Hostname attribute, update document base URI without attribute having been set");
  base.href = "http://old_base/";
  a.href = "http://host";
  base.href = "http://new_base/";
  shouldBe(a.href, 'http://host/');

  debug("Hostname attribute, update document base URI after attribute has been set");
  base.href = "http://old_base/";
  a.href = "http://foo";
  a.hostname = "host";
  base.href = "http://new_base/";
  shouldBe(a.href, 'http://host/');


  debug("Protocol attribute, update document base URI without attribute having been set");
  base.href = "http://old_base/";
  a.href = "protocol:";
  base.href = "http://new_base/";
  shouldBe(a.href, 'protocol:');

  debug("Protocol attribute, update document base URI after attribute has been set");
  base.href = "http://old_base/";
  a.href = "foo:";
  a.protocol = "protocol:";
  base.href = "http://new_base/";
  shouldBe(a.href, 'protocol:');


  debug("Port attribute, update document base URI without attribute having been set");
  base.href = "http://old_base/";
  a.href = "http://host:0";
  base.href = "http://new_base/";
  shouldBe(a.href, 'http://host:0/');

  debug("Port attribute, update document base URI after attribute has been set");
  base.href = "http://old_base/";
  a.href = "http://host:80";
  a.port = '0';
  base.href = "http://new_base/";
  shouldBe(a.href, 'http://host:0/');

  base.href = '';
}

