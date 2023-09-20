// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppStore on _AppStore, Store {
  Computed<ObservableList<Map<String, dynamic>>>? _$allOrdersComputed;

  @override
  ObservableList<Map<String, dynamic>> get allOrders => (_$allOrdersComputed ??=
          Computed<ObservableList<Map<String, dynamic>>>(() => super.allOrders,
              name: '_AppStore.allOrders'))
      .value;
  Computed<ObservableList<Map<String, dynamic>>>? _$pendingComputed;

  @override
  ObservableList<Map<String, dynamic>> get pending => (_$pendingComputed ??=
          Computed<ObservableList<Map<String, dynamic>>>(() => super.pending,
              name: '_AppStore.pending'))
      .value;
  Computed<ObservableList<Map<String, dynamic>>>? _$inProgressComputed;

  @override
  ObservableList<Map<String, dynamic>> get inProgress =>
      (_$inProgressComputed ??= Computed<ObservableList<Map<String, dynamic>>>(
              () => super.inProgress,
              name: '_AppStore.inProgress'))
          .value;
  Computed<ObservableList<Map<String, dynamic>>>? _$cancelledComputed;

  @override
  ObservableList<Map<String, dynamic>> get cancelled => (_$cancelledComputed ??=
          Computed<ObservableList<Map<String, dynamic>>>(() => super.cancelled,
              name: '_AppStore.cancelled'))
      .value;
  Computed<ObservableList<Map<String, dynamic>>>? _$completedComputed;

  @override
  ObservableList<Map<String, dynamic>> get completed => (_$completedComputed ??=
          Computed<ObservableList<Map<String, dynamic>>>(() => super.completed,
              name: '_AppStore.completed'))
      .value;

  late final _$isLoadingAtom =
      Atom(name: '_AppStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$currentIndexAtom =
      Atom(name: '_AppStore.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$shipmentHistoryAtom =
      Atom(name: '_AppStore.shipmentHistory', context: context);

  @override
  ObservableList<Map<String, dynamic>> get shipmentHistory {
    _$shipmentHistoryAtom.reportRead();
    return super.shipmentHistory;
  }

  @override
  set shipmentHistory(ObservableList<Map<String, dynamic>> value) {
    _$shipmentHistoryAtom.reportWrite(value, super.shipmentHistory, () {
      super.shipmentHistory = value;
    });
  }

  late final _$changeTabAsyncAction =
      AsyncAction('_AppStore.changeTab', context: context);

  @override
  Future<void> changeTab({required int index}) {
    return _$changeTabAsyncAction.run(() => super.changeTab(index: index));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
currentIndex: ${currentIndex},
shipmentHistory: ${shipmentHistory},
allOrders: ${allOrders},
pending: ${pending},
inProgress: ${inProgress},
cancelled: ${cancelled},
completed: ${completed}
    ''';
  }
}
