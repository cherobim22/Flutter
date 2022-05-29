import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:shoppingapp/providers/counter.dart';
import 'package:shoppingapp/redux/app_store.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exemplo contador'),
      ),
      body: Center(
        child: AnimatedBuilder(
            animation: appStore,
            builder: (context, snapshot) {
              return Column(children: [
                Text('${appStore.state.value}}'),
                SizedBox(
                  height: 20,
                ),
                IconButton(
                    onPressed: () {
                      appStore.dispatcher(AppAction.decrement, 1);
                    },
                    icon: Icon(Icons.add))
              ]);
            }),
      ),
    );
  }
}
