/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description HTMLFormElement::checkValidity() with cases that event handlers
 * called by checkValidity() updates DOM structure.
 * @static-warning
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var parent = document.createElement('div');
  document.body.append(parent);

  // ----------------------------------------------------------------
  debug('The target form is removed.');
  parent.innerHtml = '<form id=f1><input name=i id=i required></form>';
  var handler = (event) {
    parent.innerHtml = '';
  };
  document.getElementById('i').addEventListener('invalid', handler, false);
  // The specificiation doesn't define the behavior in this case.
  // It's ok if WebKit doesn't crash.
  shouldBeFalse(document.getElementById("f1").checkValidity());

  // ----------------------------------------------------------------
  debug('');
  debug('A control to be checked is removed.');
  parent.innerHtml = '<form id=f1><input name=i1 id=i1 required><input name=i2 id=i2 required></form>';
  var handler1 = (event) {
    document.getElementById('i2').remove();
  };
  document.getElementById('i1').addEventListener('invalid', handler1, false);
  var handler2Called = false;
  var handler2 = (event) {
    handler2Called = true;
  };
  document.getElementById('i2').addEventListener('invalid', handler2, false);
  shouldBeFalse(document.getElementById("f1").checkValidity());
  // If the node was removed from the form, i2.checkValidity() is called, but an
  // invalid event is not fired because it is not in any documents.
  shouldBeFalse(handler2Called);

  // ----------------------------------------------------------------
  debug('');
  debug('A new control is added.');
  parent.innerHtml = '<form id=f1><input name=i1 id=i1 required></form>';
  handler2Called = false;
  handler2 = (event) {
    handler2Called = true;
  };
  handler1 = (event) {
    var input = document.createElement('input');
    input.name = 'i2';
    input.required = true;
    input.addEventListener('invalid', handler2, false);
    document.getElementById('f1').append(input);
  };
  document.getElementById('i1').addEventListener('invalid', handler1, false);
  shouldBeFalse(document.getElementById("f1").checkValidity());
  // If a new node is added to the form, checkValidity() doesn't handle it.
  shouldBeFalse(handler2Called);

  // ----------------------------------------------------------------
  debug('');
  debug('A control is moved to another form.');
  parent.innerHtml = '<form id=f1><input name=i1 id=i1 required><input name=i2 id=i2 required></form>'
    + '<form id=f2></form>';
  handler1 = (event) {
    document.getElementById('f2').append(document.getElementById('i2'));
  };
  document.getElementById('i1').addEventListener('invalid', handler1, false);
  handler2Called = false;
  handler2 = (event) {
    handler2Called = true;
  };
  document.getElementById('i2').addEventListener('invalid', handler2, false);
  shouldBeFalse(document.getElementById("f1").checkValidity());
  // The moved control is not checked.
  shouldBeFalse(handler2Called);

  // ----------------------------------------------------------------
  debug('');
  debug('A control is moved to another document.');
  parent.innerHtml = '<form id=f1><input name=i1 id=i1 required></form>';
  var doc2 = document.implementation.createHtmlDocument('');
  handler1 = (event) {
    doc2.body.append(doc2.adoptNode(document.getElementById('i1')));
  };
  document.getElementById('i1').addEventListener('invalid', handler1, false);
  // i1 is not listed in 'unhandled invalid controls' because it was moved to
  // another document.
  shouldBeTrue(document.getElementById("f1").checkValidity());

  parent.innerHtml = '';
}
