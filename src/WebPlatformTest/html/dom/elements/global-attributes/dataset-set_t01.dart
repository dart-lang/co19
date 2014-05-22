/**
 * after web-platform-tests/html/dom/elements/global-attributes/dataset-set.html
 * @assertion 
 * @description Dataset - Set
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

void main() {
      void testSet(prop, expected) {
        var d = document.createElement("div");
        d.dataset[prop] = "value";
        return d.getAttribute(expected) == "value";
      }

      test(() { assert_true(testSet('foo', 'data-foo')); },
        "Setting element.dataset['foo'] should also change the value of element.getAttribute('data-foo')'");
      test(() { assert_true(testSet('fooBar', 'data-foo-bar')); },
        "Setting element.dataset['fooBar'] should also change the value of element.getAttribute('data-foo-bar')'");
      test(() { assert_true(testSet('-', 'data--')); },
        "Setting element.dataset['-'] should also change the value of element.getAttribute('data--')'");
      test(() { assert_true(testSet('Foo', 'data--foo')); },
        "Setting element.dataset['Foo'] should also change the value of element.getAttribute('data--foo')'");
      test(() { assert_true(testSet('-Foo', 'data---foo')); },
        "Setting element.dataset['-Foo'] should also change the value of element.getAttribute('data---foo')'");
      test(() { assert_true(testSet('', 'data-')); },
        "Setting element.dataset[''] should also change the value of element.getAttribute('data-')'");
      test(() { assert_true(testSet('\xE0', 'data-\xE0')); },
        "Setting element.dataset['\xE0'] should also change the value of element.getAttribute('data-\xE0')'");
      test(() { assert_throws('SYNTAX_ERR', () { testSet('-foo', 'dummy'); }); },
        "Setting element.dataset['-foo'] should throw a SYNTAX_ERR'");
      test(() { assert_throws('InvalidCharacterError', () { testSet('foo\x20', 'dummy'); }); },
        "Setting element.dataset['foo\x20'] should throw an InvalidCharacterError'");
      test(() { assert_throws('InvalidCharacterError', () { testSet('foo\uF900', 'dummy'); }); },
        "Setting element.dataset['foo\uF900'] should throw an InvalidCharacterError'");

      checkTestFailures();
}