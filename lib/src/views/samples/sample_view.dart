import 'package:flutter/material.dart';
import 'package:flutter_fire_starter/src/core/l10n/locale_provider.dart';
import 'package:flutter_fire_starter/src/view_models/samples/sample_view_model.dart';
import 'package:flutter_fire_starter/src/views/samples/sample_form_view.dart';
import 'package:flutter_fire_starter/src/views/samples/sample_list_refresh.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SampleView extends StatefulWidget {
  const SampleView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SampleView> createState() => _SamplePageState();
}

class _SamplePageState extends State<SampleView> {
  @override
  Widget build(BuildContext context) {
    var sample = context.watch<SampleVM>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                AppLocalizations.of(context)!.helloWorld,
              ),
              Text(
                '${context.watch<SampleVM>().count} && ${sample.count}',
                style: Theme.of(context).textTheme.headline4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    child: const Text('Fr'),
                    onPressed: () async {
                      final localeProvider =
                          Provider.of<LocaleProvider>(context, listen: false);
                      localeProvider.setLocale(const Locale('fr'));
                    },
                  ),
                  MaterialButton(
                    color: Colors.green,
                    onPressed: () {
                      //var countProvider = Provider.of<SampleVM>(context, listen: true);
                      sample.updateListNumber(sample.count);
                    },
                    child: const Text('Add'),
                  ),
                  MaterialButton(
                    color: Colors.red,
                    onPressed: () {
                      sample.clearListNumber();
                    },
                    child: const Text('Clear'),
                  ),
                  ElevatedButton(
                    child: const Text('En'),
                    onPressed: () async {
                      final localeProvider =
                          Provider.of<LocaleProvider>(context, listen: false);
                      localeProvider.setLocale(const Locale('en'));
                    },
                  ),
                ],
              ),
              Container(
                color: Colors.grey.shade200,
                height: MediaQuery.of(context).size.height * 0.5,
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var item = sample.listCount[index];
                      return Text(
                        'Item $item added',
                        style: Theme.of(context).textTheme.headline6,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: sample.listCount.length),
              ),
              ElevatedButton(
                child: Text(AppLocalizations.of(context)!.gotoForm,
                    style: Theme.of(context).textTheme.bodyText2),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SampleFormView(
                            title: AppLocalizations.of(context)!.sampleForm);
                      },
                    ),
                  );
                },
              ),
              ElevatedButton(
                child: Text(AppLocalizations.of(context)!.gotoList,
                    style: Theme.of(context).textTheme.bodyText2),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SampleRefreshListView(
                            title: AppLocalizations.of(context)!
                                .sampleRefreshList);
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<SampleVM>().increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
