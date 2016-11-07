/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks validity.customError.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <p id="description"></p>
      <div id="console"></div>

      <fieldset name="set" id="fieldset-set"></fieldset>
      <button   name="set" id="button-set"></button>
      <button   name="set" id="button-button-set" type="button"></button>
      <button   name="set" id="button-reset-set" type="reset"></button>
      <select   name="set" id="select-set"></select>
      <textarea name="set" id="textarea-set"></textarea>
      <input    name="set" id="input-set" />
      <input    name="set" id="input-submit-set" type="submit" />

      <fieldset name="set-and-empty" id="fieldset-set-and-empty"></fieldset>
      <button   name="set-and-empty" id="button-set-and-empty"></button>
      <button   name="set-and-empty" id="button-button-set-and-empty" type="button"></button>
      <button   name="set-and-empty" id="button-reset-set-and-empty" type="reset"></button>
      <select   name="set-and-empty" id="select-set-and-empty"></select>
      <textarea name="set-and-empty" id="textarea-set-and-empty"></textarea>
      <input    name="set-and-empty" id="input-set-and-empty" />
      <input    name="set-and-empty" id="input-submit-set-and-empty" type="submit" />

      <fieldset name="no-changes" id="fieldset-no-changes"></fieldset>
      <button   name="no-changes" id="button-no-changes"></button>
      <button   name="no-changes" id="button-button-no-changes" type="button"></button>
      <button   name="no-changes" id="button-reset-no-changes" type="reset"></button>
      <select   name="no-changes" id="select-no-changes"></select>
      <textarea name="no-changes" id="textarea-no-changes"></textarea>
      <input    name="no-changes" id="input-no-changes" />
      <input    name="no-changes" id="input-submit-no-changes" type="submit" />

      <fieldset name="many-changes" id="fieldset-many-changes"></fieldset>
      <button   name="many-changes" id="button-many-changes"></button>
      <button   name="many-changes" id="button-button-many-changes" type="button"></button>
      <button   name="many-changes" id="button-reset-many-changes" type="reset"></button>
      <select   name="many-changes" id="select-many-changes"></select>
      <textarea name="many-changes" id="textarea-many-changes"></textarea>
      <input    name="many-changes" id="input-many-changes" />
      <input    name="many-changes" id="input-submit-many-changes" type="submit" />
      ''', treeSanitizer: new NullTreeSanitizer());

  bool customErrorFor(String id) {
    return (document.getElementById(id) as InputElementBase).validity.customError;
  }

  debug('Set some value for customError.');
  List<Node> v = document.getElementsByName("set");
  for (int i = 0; i < v.length; i++)
    (v[i] as dynamic).setCustomValidity("Custom validation message");
  shouldBeFalse(customErrorFor("fieldset-set"));
  shouldBeTrue(customErrorFor("button-set"));
  shouldBeFalse(customErrorFor("button-button-set"));
  shouldBeFalse(customErrorFor("button-reset-set"));
  shouldBeTrue(customErrorFor("select-set"));
  shouldBeTrue(customErrorFor("textarea-set"));
  shouldBeTrue(customErrorFor("input-set"));
  shouldBeTrue(customErrorFor("input-submit-set"));

  debug('');
  debug('Set some value for customError, and clear it.');
  v = document.getElementsByName("set-and-empty");
  for (int i = 0; i < v.length; i++)
    (v[i] as dynamic).setCustomValidity("Custom validation message");
  for (int i = 0; i < v.length; i++)
    (v[i] as dynamic).setCustomValidity("");
  shouldBeFalse(customErrorFor("fieldset-set-and-empty"));
  shouldBeFalse(customErrorFor("button-set-and-empty"));
  shouldBeFalse(customErrorFor("button-button-set-and-empty"));
  shouldBeFalse(customErrorFor("button-reset-set-and-empty"));
  shouldBeFalse(customErrorFor("select-set-and-empty"));
  shouldBeFalse(customErrorFor("textarea-set-and-empty"));
  shouldBeFalse(customErrorFor("input-set-and-empty"));
  shouldBeFalse(customErrorFor("input-submit-set-and-empty"));

  debug('');
  debug('Not any changes for customError.');
  shouldBeFalse(customErrorFor("fieldset-no-changes"));
  shouldBeFalse(customErrorFor("button-no-changes"));
  shouldBeFalse(customErrorFor("button-button-no-changes"));
  shouldBeFalse(customErrorFor("button-reset-no-changes"));
  shouldBeFalse(customErrorFor("select-no-changes"));
  shouldBeFalse(customErrorFor("textarea-no-changes"));
  shouldBeFalse(customErrorFor("input-no-changes"));
  shouldBeFalse(customErrorFor("input-submit-no-changes"));

  debug('');
  debug('Many changes for customError:');
  debug('Set some value, and set with no arguments.');
  v = document.getElementsByName("many-changes");
  for (int i = 0; i < v.length; i++) {
    (v[i] as dynamic).setCustomValidity("Custom string");
    try {
      (v[i] as dynamic).setCustomValidity();
      testFailed("setCustomValidity() did not throw");
    } catch(err) {
      testPassed("setCustomValidity() EXPECTEDLY threw $err");
    }
    //v[i].setCustomValidity(undefined);
    (v[i] as dynamic).setCustomValidity(null);
  }
  shouldBeFalse(customErrorFor("fieldset-many-changes"));
  shouldBeTrue(customErrorFor("button-many-changes"));
  shouldBeFalse(customErrorFor("button-button-many-changes"));
  shouldBeFalse(customErrorFor("button-reset-many-changes"));
  shouldBeTrue(customErrorFor("select-many-changes"));
  shouldBeTrue(customErrorFor("textarea-many-changes"));
  shouldBeTrue(customErrorFor("input-many-changes"));
  shouldBeTrue(customErrorFor("input-submit-many-changes"));

  debug('Set null.');
  for (int i = 0; i < v.length; i++)
    (v[i] as dynamic).setCustomValidity(null);
  shouldBeFalse(customErrorFor("fieldset-many-changes"));
  shouldBeTrue(customErrorFor("button-many-changes"));
  shouldBeFalse(customErrorFor("button-button-many-changes"));
  shouldBeFalse(customErrorFor("button-reset-many-changes"));
  shouldBeTrue(customErrorFor("select-many-changes"));
  shouldBeTrue(customErrorFor("textarea-many-changes"));
  shouldBeTrue(customErrorFor("input-many-changes"));
  shouldBeTrue(customErrorFor("input-submit-many-changes"));
}
