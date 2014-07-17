/**
 * after web-platform-tests/webstorage/event_constructor_js.html
 * @assertion: http://dev.w3.org/html5/webstorage/ 
 * @description storageeventinit test 
 */
import 'dart:html';
import "../Utils/expectWeb.dart";

void main() {
    void onStorageEvent(event) {
        assert_equals(event.type, 'storage');
        assert_equals(event.key, null, 'key');
        assert_equals(event.oldValue, null, 'oldValue');
        assert_equals(event.newValue, null, 'newValue');
        assert_equals(event.url, '', 'url');
        assert_equals(event.storageArea, null, 'storageArea');
        asyncEnd();
    }

    window.addEventListener('storage', onStorageEvent, false);
    var event = new StorageEvent('storage');
    asyncStart();
    window.dispatchEvent(event);
}