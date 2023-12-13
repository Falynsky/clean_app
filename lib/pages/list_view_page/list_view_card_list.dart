import 'package:clean_app/bloc/list_view_bloc/list_view_bloc.dart';
import 'package:clean_app/configs/transaction.dart';
import 'package:clean_app/cubit/navigation_cubit/navigation_cubit.dart';
import 'package:clean_app/enums/navigation_screens_enum.dart';
import 'package:clean_app/pages/list_view_page/list_view_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewBuilderCardList extends StatefulWidget {
  final ScrollController scrollController;

  const ListViewBuilderCardList({required this.scrollController, Key? key}) : super(key: key);

  @override
  State<ListViewBuilderCardList> createState() => _ListViewBuilderCardListState();
}

class _ListViewBuilderCardListState extends State<ListViewBuilderCardList> {
  late NavigationCubit navigationCubit;
  late final TransactionsBloc transactionsBloc;
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = widget.scrollController;
    navigationCubit = context.read<NavigationCubit>();
    transactionsBloc = context.read<TransactionsBloc>();
  }

  @override
  Widget build(BuildContext context) {
    final List<Transaction> transactions = transactionsBloc.transactions;
    return Container(
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () => navigationCubit.navigate(NavigationScreens.home),
            child: const Text('Loaded transactions'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: transactions.length,
              controller: scrollController,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: ListViewCard(
                    transaction: transactions[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
