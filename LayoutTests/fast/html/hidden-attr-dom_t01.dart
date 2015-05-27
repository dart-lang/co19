/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Various tests for the the hidden IDL attribute.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  var testParent = document.createElement('div');
  document.body.append(testParent);

  //debug('The IDL attribute reflects what is present in markup:');
  testParent.innerHtml = '<div id=h1 hidden></div><div id=h2 hidden=false></div><div id=h3 hidden=off></div><div id=s1></div>';
  var h1 = document.getElementById("h1");
  var h2 = document.getElementById("h2");
  var h3 = document.getElementById("h3");
  var s1 = document.getElementById("s1");

  Expect.isTrue(h1.hidden);
  Expect.isTrue(h2.hidden);
  Expect.isTrue(h3.hidden);
  Expect.isFalse(s1.hidden);

  //debug('Changes via DOM Core are reflected through the IDL attribute:');

  h1.attributes.remove("hidden");
  Expect.isFalse(h1.hidden);
  h1.setAttribute("hidden", "");
  Expect.isTrue(h1.hidden);
  h2.setAttribute("hidden", "");
  Expect.isTrue(h2.hidden);
  s1.setAttribute("hidden", "");
  Expect.isTrue(s1.hidden);

  //debug('Changes via IDL attribute are reflected in the core DOM:');

  h3.hidden = false;
  Expect.equals(null, h3.getAttribute("hidden"));
  h3.hidden = true;
  Expect.equals('', h3.getAttribute("hidden"));
}
