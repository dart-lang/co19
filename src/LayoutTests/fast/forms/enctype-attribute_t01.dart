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
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <p>Test enctype and formenctype attributes</p>

      <form id=f1></form>
      ''', treeSanitizer: new NullTreeSanitizer());

  var form1 = document.getElementById('f1');

  debug('Missing value default:');
  shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  shouldBeNull(form1.getAttribute("enctype"));

  debug('');
  debug('Invalid value default:');
  form1.enctype = "foobar"; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  shouldBe(form1.getAttribute("enctype"), "foobar");
  form1.setAttribute("enctype", "baz"); shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  debug('');
  debug('Text and its subtypes:');
  form1.enctype = "text"; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  form1.enctype = "plain"; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  form1.enctype = "text/1d-interleaved-parityfec"; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  form1.enctype = "text/calendar"; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  form1.enctype = "text/css"; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  form1.enctype = "text/csv"; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  form1.enctype = "text/dns"; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  form1.enctype = "text/enriched"; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  form1.enctype = "text/example"; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  form1.enctype = "text/fwdred"; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  form1.enctype = "text/html"; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  form1.enctype = "text/rfc822-headers"; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  form1.enctype = "text/richtext"; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  form1.enctype = "text/rtx"; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  form1.enctype = "text/sgml"; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  form1.enctype = "text/t140"; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  form1.enctype = "text/troff"; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  form1.enctype = "text/ulpfec"; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  form1.enctype = "text/uri-list"; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  form1.enctype = "text/vcard"; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  form1.enctype = "text/xml"; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  form1.enctype = "text/xml-external-parsed-entity"; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  debug('');
  debug('Multipart and its subtypes:');
  form1.enctype = "multipart"; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  form1.enctype = "form-data"; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  form1.enctype = "multipart/mixed"; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  form1.enctype = "multipart/message"; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  form1.enctype = "multipart/digest"; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  form1.enctype = "multipart/alternative"; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  form1.enctype = "multipart/alternative"; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  form1.enctype = "multipart/byteranges"; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  form1.enctype = "multipart/encrypted"; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  form1.enctype = "multipart/example"; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  form1.enctype = "multipart/parallel"; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  form1.enctype = "multipart/related"; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  form1.enctype = "multipart/report"; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  form1.enctype = "multipart/signed"; shouldBe(form1.enctype, "application/x-www-form-urlencoded");

  debug('');
  debug('Valid values:');
  form1.enctype = "Text/Plain"; shouldBe(form1.enctype, "text/plain");
  shouldBe(form1.getAttribute("enctype"), "Text/Plain");
  form1.setAttribute("enctype", "Text/Plain"); shouldBe(form1.enctype, "text/plain");
  form1.enctype = "Multipart/Form-Data"; shouldBe(form1.enctype, "multipart/form-data");
  shouldBe(form1.getAttribute("enctype"), "Multipart/Form-Data");
  form1.setAttribute("enctype", "Multipart/Form-Data"); shouldBe(form1.enctype, "multipart/form-data");

  debug('');
  debug('Values with whitespace:');
  // Note: IE9 thorws "Invalid argument.", Firefox 6 doesn't allow leading whitespace.
  // Firefox matches to the specification.
  form1.enctype = "  multipart/form-data"; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  shouldBe(form1.getAttribute("enctype"), "  multipart/form-data");
  form1.enctype = "multipart/form-data  "; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
  shouldBe(form1.getAttribute("enctype"), "multipart/form-data  ");

  form1.enctype = "application/x-www-form-urlencoded "; shouldBe(form1.enctype, "application/x-www-form-urlencoded");
}
