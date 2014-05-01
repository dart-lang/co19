/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test URL protocol setter.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../../Utils/async_utils.dart";
import "../../../testcommon.dart";

main() {
  _shouldThrow (func()) {
    shouldThrow(func,
        (e) => e is DomException && e.name == DomException.SYNTAX);
  }

  var a = document.createElement("a");
  a.setAttribute("href", "http://www.apple.com/");
  document.body.append(a);

  shouldThrow(() => window.location.protocol = '');
  shouldThrow(() => window.location.protocol = ':');
  shouldThrow(() => window.location.protocol = 'é');
  shouldThrow(() => window.location.protocol = '[');
  shouldThrow(() => window.location.protocol = '0');

  // IE raises exceptions for anchors, too - but Firefox does not. In either case, protocol shouldn't change.
  try { a.protocol = ''; } catch (ex) { }
  try { a.protocol = 'é'; } catch (ex) { }
  try { a.protocol = '['; } catch (ex) { }
  try { a.protocol = '0'; } catch (ex) { }
  shouldBe(a.protocol, 'http:');

  a.protocol = "https";
  shouldBe(a.href, 'https://www.apple.com/');

  a.protocol = "http:";
  shouldBe(a.href, 'http://www.apple.com/');

  a.protocol = "https://foobar";
  shouldBe(a.href, 'https://www.apple.com/');
}
