/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that we throw a NAMESPACE_ERR when parsing a 
 * selector string for querySelector and querySelectorAll that contains a
 * namespace.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <p>This tests that we throw a NAMESPACE_ERR when parsing a selector string for querySelector and querySelectorAll
        that contains a namespace.</p>
    <pre id="console" name="value"></pre>
    ''', treeSanitizer: new NullTreeSanitizer());

  shouldNotThrow(func()) => func();

  shouldThrow(() => document.querySelector('bbb|pre'));
  shouldThrow(() => document.querySelectorAll('bbb|pre'));
  shouldThrow(() => document.body.matches('bbb|pre'));
  shouldNotThrow(() => document.querySelector('*|pre'));
  shouldNotThrow(() => document.querySelectorAll('*|pre'));
  shouldNotThrow(() => document.body.matches('*|pre'));
  shouldNotThrow(() => document.querySelector('|pre'));
  shouldNotThrow(() => document.querySelectorAll('|pre'));
  shouldNotThrow(() => document.body.matches('|pre'));

  shouldThrow(() => document.querySelector('div bbb|pre'));
  shouldThrow(() => document.querySelectorAll('div bbb|pre'));
  shouldThrow(() => document.body.matches('div bbb|pre'));
  shouldNotThrow(() => document.querySelector('div *|pre'));
  shouldNotThrow(() => document.querySelectorAll('div *|pre'));
  shouldNotThrow(() => document.body.matches('div *|pre'));
  shouldNotThrow(() => document.querySelector('div |pre'));
  shouldNotThrow(() => document.querySelectorAll('div |pre'));
  shouldNotThrow(() => document.body.matches('div |pre'));

  shouldThrow(() => document.querySelector('[bbb|name=value]'));
  shouldThrow(() => document.querySelectorAll('[bbb|name=value]'));
  shouldThrow(() => document.body.matches('[bbb|name=value]'));
  shouldNotThrow(() => document.querySelector('[*|name=value]'));
  shouldNotThrow(() => document.querySelectorAll('[*|name=value]'));
  shouldNotThrow(() => document.body.matches('[*|name=value]'));
  shouldNotThrow(() => document.querySelector('[|name=value]'));
  shouldNotThrow(() => document.querySelectorAll('[|name=value]'));
  shouldNotThrow(() => document.body.matches('[|name=value]'));

  shouldThrow(() => document.querySelector(':-webkit-any(bbb|pre)'));

  shouldThrow(() => document.querySelector('div [bbb|name=value]'));
  shouldThrow(() => document.querySelectorAll('div [bbb|name=value]'));
  shouldThrow(() => document.body.matches('div [bbb|name=value]'));
  shouldNotThrow(() => document.querySelector('div [*|name=value]'));
  shouldNotThrow(() => document.querySelectorAll('div [*|name=value]'));
  shouldNotThrow(() => document.body.matches('div [*|name=value]'));
  shouldNotThrow(() => document.querySelector('div [|name=value]'));
  shouldNotThrow(() => document.querySelectorAll('div [|name=value]'));
  shouldNotThrow(() => document.body.matches('div [|name=value]'));
}
