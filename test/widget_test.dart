import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/main.dart';

void main() {
testWidgets('Quiz app opens successfully', (WidgetTester tester) async {
await tester.pumpWidget(const QuizApp());

```
expect(find.text('MindByte'), findsWidgets);
```

});
}
