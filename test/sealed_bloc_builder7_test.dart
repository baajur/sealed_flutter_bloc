import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

import 'helpers/helper_bloc7.dart';

void main() {
  group('SealedBlocBuilder7', () {
    testWidgets('should throw AssertionError if builder is null',
        (tester) async {
      try {
        await tester.pumpWidget(
          SealedBlocBuilder7<HelperBloc7, HelperState7, State1, State2, State3,
              State4, State5, State6, State7>(
            bloc: HelperBloc7(),
            builder: null,
          ),
        );
      } on Object catch (error) {
        expect(error, isAssertionError);
      }
    });

    testWidgets('should render properly', (tester) async {
      final bloc = HelperBloc7();
      await tester.pumpWidget(
        SealedBlocBuilder7<HelperBloc7, HelperState7, State1, State2, State3,
            State4, State5, State6, State7>(
          bloc: bloc,
          builder: (context, states) {
            return states(
              (first) => Container(key: Key('__target1__')),
              (second) => Container(key: Key('__target2__')),
              (third) => Container(key: Key('__target3__')),
              (fourth) => Container(key: Key('__target4__')),
              (fifth) => Container(key: Key('__target5__')),
              (sixth) => Container(key: Key('__target6__')),
              (seventh) => Container(key: Key('__target7__')),
            );
          },
        ),
      );
      expect(find.byKey(Key('__target1__')), findsOneWidget);

      bloc.add(HelperEvent7.event2);
      await tester.pumpAndSettle();
      expect(find.byKey(Key('__target2__')), findsOneWidget);

      bloc.add(HelperEvent7.event3);
      await tester.pumpAndSettle();
      expect(find.byKey(Key('__target3__')), findsOneWidget);

      bloc.add(HelperEvent7.event4);
      await tester.pumpAndSettle();
      expect(find.byKey(Key('__target4__')), findsOneWidget);

      bloc.add(HelperEvent7.event5);
      await tester.pumpAndSettle();
      expect(find.byKey(Key('__target5__')), findsOneWidget);

      bloc.add(HelperEvent7.event6);
      await tester.pumpAndSettle();
      expect(find.byKey(Key('__target6__')), findsOneWidget);

      bloc.add(HelperEvent7.event7);
      await tester.pumpAndSettle();
      expect(find.byKey(Key('__target7__')), findsOneWidget);
    });
  });
}
