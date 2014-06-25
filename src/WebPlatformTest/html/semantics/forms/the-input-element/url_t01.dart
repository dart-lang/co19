/**
 * after web-platform-tests/html/semantics/forms/the-input-element/url.html
 * @assertion
 * http://www.w3.org/html/wg/drafts/html/master/forms.html#url-state-%28type=url%29
 * @description Input url
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
    <h1>Input url</h1>
    <div style="display: none">
    <input type="url" id="type_support" />
    <input type="url" id="set_value_LF" />
    <input type="url" id="set_value_CR" />
    <input type="url" id="set_value_CRLF" />
    <input type="url" id="value_with_CRLF" value="a&#x000D;&#x000A;a" />
    <input type="url" id="value_with_leading_trailing_white_space" value=" aa " />
    <input type="url" id="value_with_leading_trailing_inner_white_space" value=" a a " />
    </div>
''';

void main() {
  document.body.appendHtml(htmlEL);
		test((){
			var element = document.getElementById('type_support');
			assert_equals(element.type, 'url');
		}, 'url type supported on input element');

		test((){
			var element = document.getElementById('set_value_LF');
			element.value = 'a\u000Aa';
			assert_equals(element.value, 'aa');

			element = document.getElementById('set_value_CR');
			element.value = 'a\u000Da';
			assert_equals(element.value, 'aa');

			element = document.getElementById('set_value_CRLF');
			element.value = 'a\u000D\u000Aa';
			assert_equals(element.value, 'aa');
		}, 'The value must not be set with "LF" (U+000A) or "CR" (U+000D)');

		test((){
			var element = document.getElementById('value_with_CRLF');
			assert_equals(element.value, 'aa');
		}, 'The value sanitization algorithm is as follows: Strip line breaks from the value');

		test((){
			var element = document.getElementById('value_with_leading_trailing_white_space');
			assert_equals(element.value, 'aa');

			element = document.getElementById('value_with_leading_trailing_inner_white_space');
			assert_equals(element.value, 'a a');
		}, 'The value sanitization algorithm is as follows: Strip leading and trailing whitespace from the value.');

  checkTestFailures();
}
