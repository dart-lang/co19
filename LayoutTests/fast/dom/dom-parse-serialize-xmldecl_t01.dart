/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test verifies that the xml declaration gets serialized if
 * present.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  f (str) => str.replaceAll(new RegExp('"'), "'");

  var xmlpi = '<?xml version="1.0" encoding="UTF-8"?>';
  var markup = xmlpi + '<root><test/></root>';
  var xmldoc = new DomParser().parseFromString(markup, "text/xml");
  shouldBeEqualToString(f(new XmlSerializer().serializeToString(xmldoc)),
      "<?xml version='1.0' encoding='UTF-8'?><root><test/></root>");

  xmlpi = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>';
  markup = xmlpi + '<root><test/></root>';
  xmldoc = new DomParser().parseFromString(markup, "text/xml");
  shouldBeEqualToString(f(new XmlSerializer().serializeToString(xmldoc)),
      "<?xml version='1.0' encoding='UTF-8' standalone='yes'?><root><test/></root>");

  xmlpi = '<?xml version="1.0" encoding="UTF-8" standalone="no"?>';
  markup = xmlpi + '<root><test/></root>';
  xmldoc = new DomParser().parseFromString(markup, "text/xml");
  shouldBeEqualToString(f(new XmlSerializer().serializeToString(xmldoc)),
      "<?xml version='1.0' encoding='UTF-8' standalone='no'?><root><test/></root>");

  xmlpi = '<?xml version="1.0" standalone="yes"?>';
  markup = xmlpi + '<root><test/></root>';
  xmldoc = new DomParser().parseFromString(markup, "text/xml");
  shouldBeEqualToString(f(new XmlSerializer().serializeToString(xmldoc)),
      "<?xml version='1.0' standalone='yes'?><root><test/></root>");

  xmlpi = '<?xml version="1.0" standalone="no"?>';
  markup = xmlpi + '<root><test/></root>';
  xmldoc = new DomParser().parseFromString(markup, "text/xml");
  shouldBeEqualToString(f(new XmlSerializer().serializeToString(xmldoc)),
      "<?xml version='1.0' standalone='no'?><root><test/></root>");

  xmlpi = '<?xml version="1.0"?>';
  markup = xmlpi + '<root><test/></root>';
  xmldoc = new DomParser().parseFromString(markup, "text/xml");
  shouldBeEqualToString(f(new XmlSerializer().serializeToString(xmldoc)),
      "<?xml version='1.0'?><root><test/></root>");
}
