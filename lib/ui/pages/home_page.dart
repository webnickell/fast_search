import 'package:fast_search/bloc/index_bloc/index_cubit.dart';
import 'package:fast_search/data/model/words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_listview/infinite_listview.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fast search'),
      ),
      body: Container(
        child: Consumer<Words>(
          builder: (_, words, __) {
            if (words == null) {
              return Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    CircularProgressIndicator(),
                    Text('File loading...'),
                  ],
                ),
              );
            }
            return Column(
              children: [
                TextField(
                  onChanged: (str) => context.read<IndexCubit>().search(str),
                ),
                Expanded(
                  child: BlocBuilder<IndexCubit, int>(
                    builder: (_, foundIndex) {
                      if (foundIndex == -1) {
                        return Center(
                          child: Text('Nothing found'),
                        );
                      }
                      return ListView.builder(
                        itemBuilder: (_, int i) {
                          final resIndex = foundIndex + i;
                          final word = words.words[resIndex];
                          return Text('$word', style: TextStyle(fontSize: 14));
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
