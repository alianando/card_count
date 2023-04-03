import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: const CompleteForm(),
    );
  }
}

enum SingingCharacter { None, Hazari, Hearts }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _title = 'Select a Game';
  SingingCharacter? _character = SingingCharacter.None;
  List _playersNames = [];
  List<List<int>> _scores = [];
  final List<int> _finalScores = [0, 0, 0, 0];
  final _formKey = GlobalKey<FormBuilderState>();
  final _scoreKey = GlobalKey<FormBuilderState>();
  // int _counter = 0;

  void _incrementCounter() {
    setState(() {
      int lastItemIndex = _scores.length;
      _scores.insert(lastItemIndex, [5, 6, 6, 7]);
    });
  }

  Widget gameTypeSelect() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Select a Game',
        ),
        ListTile(
          title: const Text('Hazari'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.Hazari,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
                _title = 'Hazari';
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Hearts'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.Hearts,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
                _title = 'Hearts';
              });
            },
          ),
        ),
        // const Text(
        //   'You have pushed the button this many times:',
        // ),
        // Text(
        //   '$_counter',
        //   style: Theme.of(context).textTheme.headline4,
        // ),
      ],
    );
  }

  Widget tableView() {
    return ListView(children: <Widget>[
      // const Center(
      //     child: Text(
      //   'People-Chart',
      //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      // )),
      DataTable(
        columns: const [
          DataColumn(
            label: Text(
              'ID',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          DataColumn(
            label: Text(
              'Name',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          DataColumn(
            label: Text(
              'Profession',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
        rows: const [
          DataRow(cells: [
            DataCell(Text('1')),
            DataCell(Text('Stephen')),
            DataCell(Text('Actor')),
          ]),
          DataRow(cells: [
            DataCell(Text('5')),
            DataCell(Text('John')),
            DataCell(Text('Student')),
          ]),
          DataRow(cells: [
            DataCell(Text('10')),
            DataCell(Text('Harry')),
            DataCell(Text('Leader')),
          ]),
          DataRow(cells: [
            DataCell(Text('15')),
            DataCell(Text('Peter')),
            DataCell(Text('Scientist')),
          ]),
        ],
      ),
    ]);
  }

  Widget scoreInput(){
    return FormBuilder(
      key: _scoreKey,
      onChanged: () {
        _formKey.currentState!.save();
        debugPrint(_formKey.currentState!.value.toString());
      },
      skipDisabled: true,
      child: Column(
        children: [
          const SizedBox(height: 15),
          FormBuilderTextField(
            name: 'input 1',
            decoration: const InputDecoration(
              labelText: 'Player 1',
            ),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 15),
          FormBuilderTextField(
            name: 'input 2',
            decoration: const InputDecoration(
              labelText: 'Player 2',
            ),
            // onChanged: (val) {
            //   print(val); // Print the text value write into TextField
            // },
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 15),
          FormBuilderTextField(
            name: 'input 3',
            decoration: const InputDecoration(
              labelText: 'Player 3',
            ),
            // onChanged: (val) {
            //   print(val); // Print the text value write into TextField
            // },
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 15),
          FormBuilderTextField(
            // initialValue: 'player 1',
            name: 'input 4',
            decoration: const InputDecoration(
              labelText: 'Player 4',
            ),
            // onChanged: (val) {
            //   print(val); // Print the text value write into TextField
            // },
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
          ),
        ],
      ),
    );
  }




  Widget playerNameSelect() {
    void onChanged(dynamic val) => debugPrint(val.toString());
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            FormBuilder(
              key: _formKey,
              onChanged: () {
                _formKey.currentState!.save();
                debugPrint(_formKey.currentState!.value.toString());
              },
              skipDisabled: true,
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  FormBuilderChoiceChip<String>(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration:
                        const InputDecoration(labelText: 'Choose a game :'),
                    name: 'game_choice',
                    initialValue: 'None',
                    options: const [
                      FormBuilderChipOption(
                        value: 'Hearts',
                        avatar: CircleAvatar(child: Text('H')),
                      ),
                      FormBuilderChipOption(
                        value: 'Hazari',
                        avatar: CircleAvatar(child: Text('Z')),
                      ),
                    ],
                    onChanged: onChanged,
                  ),
                  const SizedBox(height: 15),
                  FormBuilderTextField(
                    name: 'input 1',
                    decoration: const InputDecoration(
                      labelText: 'Player 1',
                    ),
                    // onChanged: (val) {
                    //   print(val); // Print the text value write into TextField
                    // },
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 15),
                  FormBuilderTextField(
                    name: 'input 2',
                    decoration: const InputDecoration(
                      labelText: 'Player 2',
                    ),
                    // onChanged: (val) {
                    //   print(val); // Print the text value write into TextField
                    // },
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 15),
                  FormBuilderTextField(
                    name: 'input 3',
                    decoration: const InputDecoration(
                      labelText: 'Player 3',
                    ),
                    // onChanged: (val) {
                    //   print(val); // Print the text value write into TextField
                    // },
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 15),
                  FormBuilderTextField(
                    // initialValue: 'player 1',
                    name: 'input 4',
                    decoration: const InputDecoration(
                      labelText: 'Player 4',
                    ),
                    // onChanged: (val) {
                    //   print(val); // Print the text value write into TextField
                    // },
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.value['game_choice'] == null ||
                          _formKey.currentState?.value['game_choice'] ==
                              'None') {
                        //Todo: Show snack bar to select the game
                      } else {
                        if (_formKey.currentState?.saveAndValidate() ?? false) {
                          // debugPrint(_formKey.currentState?.value.toString());
                          setState(() {
                            _title =
                                _formKey.currentState?.value['game_choice'];
                          });
                          if (_formKey.currentState?.value['input 1'] == null) {
                            _playersNames.insert(0, 'p 1');
                          } else {
                            _playersNames.insert(
                                0, _formKey.currentState?.value['input 1']);
                          }
                          if (_formKey.currentState?.value['input 2'] == null) {
                            _playersNames.insert(1, 'p 2');
                          } else {
                            _playersNames.insert(
                                1, _formKey.currentState?.value['input 2']);
                          }
                          if (_formKey.currentState?.value['input 3'] == null) {
                            _playersNames.insert(2, 'p 3');
                          } else {
                            _playersNames.insert(
                                2, _formKey.currentState?.value['input 3']);
                          }
                          if (_formKey.currentState?.value['input 4'] == null) {
                            _playersNames.insert(3, 'p 4');
                          } else {
                            _playersNames.insert(
                                3, _formKey.currentState?.value['input 4']);
                          }
                        } else {
                          debugPrint(_formKey.currentState?.value.toString());
                          debugPrint('validation failed');
                        }
                      }
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      _formKey.currentState?.reset();
                      _playersNames = [];
                    },
                    // color: Theme.of(context).colorScheme.secondary,
                    child: Text(
                      'Reset',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Scores'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                FormBuilder(
                    key: _scoreKey,
                    onChanged: () {
                      _scoreKey.currentState!.save();
                      debugPrint(_scoreKey.currentState!.value.toString());
                    },
                    skipDisabled: true,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${_playersNames[0]}'),
                            SizedBox(
                              width: 75,
                              // height: 25,
                              child: FormBuilderTextField(
                                name: 'input 1',
                                // decoration: const InputDecoration(
                                //   labelText: 'Player 1',
                                // ),
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${_playersNames[1]}'),
                            SizedBox(
                              width: 75,
                              child: FormBuilderTextField(
                                name: 'input 2',
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${_playersNames[2]}'),
                            SizedBox(
                              width: 75,
                              child: FormBuilderTextField(
                                name: 'input 3',
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${_playersNames[3]}'),
                            SizedBox(
                              width: 75,
                              child: FormBuilderTextField(
                                name: 'input 4',
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                ),


                // Text('This is a demo alert dialog.'),
                // Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget scoreView() {
    return Column(
      children: [
        // Text('$_playersNames'),
        Padding(
          padding: const EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _playersNames[0],
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                _playersNames[1],
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                _playersNames[2],
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                _playersNames[3],
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        const Divider(),
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _scores.length,
            itemBuilder: (BuildContext context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 0, bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('${_scores[index][0]}'),
                    Text('${_scores[index][1]}'),
                    Text('${_scores[index][2]}'),
                    Text('${_scores[index][3]}'),
                  ],
                ),
              );
            },
          ),
        ),
        Expanded(child: Container()),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('${_finalScores[0]}'),
              Text('${_finalScores[1]}'),
              Text('${_finalScores[2]}'),
              Text('${_finalScores[3]}'),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    _showMyDialog();
                    //Todo: Show snack bar to select the game
                    setState(
                      () {
                        int lastItemIndex = _scores.length;
                        _scores.insert(lastItemIndex, [5, 6, 6, 7]);
                        _finalScores[0] = _finalScores[0] + _scores.last[0];
                        _finalScores[1] = _finalScores[1] + _scores.last[1];
                        _finalScores[2] = _finalScores[2] + _scores.last[2];
                        _finalScores[3] = _finalScores[3] + _scores.last[3];
                      },
                    );
                  },
                  child: const Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      _scores = [];
                      _finalScores[0] = 0;
                      _finalScores[1] = 0;
                      _finalScores[2] = 0;
                      _finalScores[3] = 0;
                    });
                  },
                  child: Text(
                    'Reset',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        actions: [
          _title != 'Select a Game'
              ? IconButton(
                  icon: const Icon(Icons.cancel),
                  tooltip: 'Change Game Type',
                  onPressed: () {
                    setState(() {
                      _title = 'Select a Game';
                      _playersNames = [];
                    });
                  },
                )
              : const Text(''),
        ],
      ),
      body: _title == 'Select a Game'
          ? playerNameSelect()
          // : tableView(),
          : scoreView(),
      // floatingActionButton: _title == 'Select a Game'
      //     ? null
      //     : FloatingActionButton(
      //         onPressed: _incrementCounter,
      //         tooltip: 'Increment',
      //         child: const Icon(Icons.add),
      //       ),
    );
  }
}

class CompleteForm extends StatefulWidget {
  const CompleteForm({Key? key}) : super(key: key);

  @override
  State<CompleteForm> createState() {
    return _CompleteFormState();
  }
}

class _CompleteFormState extends State<CompleteForm> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _ageHasError = false;
  bool _genderHasError = false;

  var genderOptions = ['Male', 'Female', 'Other'];

  void _onChanged(dynamic val) => debugPrint(val.toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Builder Example')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FormBuilder(
                key: _formKey,
                // enabled: false,
                onChanged: () {
                  _formKey.currentState!.save();
                  debugPrint(_formKey.currentState!.value.toString());
                },
                autovalidateMode: AutovalidateMode.disabled,
                initialValue: const {
                  'movie_rating': 5,
                  'best_language': 'Dart',
                  'age': '13',
                  'gender': 'Male',
                  'languages_filter': ['Dart']
                },
                skipDisabled: true,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 15),
                    FormBuilderDateTimePicker(
                      name: 'date',
                      initialEntryMode: DatePickerEntryMode.calendar,
                      initialValue: DateTime.now(),
                      inputType: InputType.both,
                      decoration: InputDecoration(
                        labelText: 'Appointment Time',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            _formKey.currentState!.fields['date']
                                ?.didChange(null);
                          },
                        ),
                      ),
                      initialTime: const TimeOfDay(hour: 8, minute: 0),
                      // locale: const Locale.fromSubtags(languageCode: 'fr'),
                    ),
                    FormBuilderDateRangePicker(
                      name: 'date_range',
                      firstDate: DateTime(1970),
                      lastDate: DateTime(2030),
                      format: DateFormat('yyyy-MM-dd'),
                      onChanged: _onChanged,
                      decoration: InputDecoration(
                        labelText: 'Date Range',
                        helperText: 'Helper text',
                        hintText: 'Hint text',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            _formKey.currentState!.fields['date_range']
                                ?.didChange(null);
                          },
                        ),
                      ),
                    ),
                    FormBuilderSlider(
                      name: 'slider',
                      // validator: FormBuilderValidators.compose([
                      //   FormBuilderValidators.min(6),
                      // ]),
                      onChanged: _onChanged,
                      min: 0.0,
                      max: 10.0,
                      initialValue: 7.0,
                      divisions: 20,
                      activeColor: Colors.red,
                      inactiveColor: Colors.pink[100],
                      decoration: const InputDecoration(
                        labelText: 'Number of things',
                      ),
                    ),
                    FormBuilderRangeSlider(
                      name: 'range_slider',
                      // validator: FormBuilderValidators.compose([FormBuilderValidators.min(context, 6)]),
                      onChanged: _onChanged,
                      min: 0.0,
                      max: 100.0,
                      initialValue: const RangeValues(4, 7),
                      divisions: 20,
                      activeColor: Colors.red,
                      inactiveColor: Colors.pink[100],
                      decoration:
                          const InputDecoration(labelText: 'Price Range'),
                    ),
                    FormBuilderCheckbox(
                      name: 'accept_terms',
                      initialValue: false,
                      onChanged: _onChanged,
                      title: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'I have read and agree to the ',
                              style: TextStyle(color: Colors.black),
                            ),
                            TextSpan(
                              text: 'Terms and Conditions',
                              style: TextStyle(color: Colors.blue),
                              // Flutter doesn't allow a button inside a button
                              // https://github.com/flutter/flutter/issues/31437#issuecomment-492411086
                              /*
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('launch url');
                                },
                              */
                            ),
                          ],
                        ),
                      ),
                      // validator: FormBuilderValidators.equal(
                      //   true,
                      //   errorText:
                      //       'You must accept terms and conditions to continue',
                      // ),
                    ),
                    FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.always,
                      name: 'age',
                      decoration: InputDecoration(
                        labelText: 'Age',
                        suffixIcon: _ageHasError
                            ? const Icon(Icons.error, color: Colors.red)
                            : const Icon(Icons.check, color: Colors.green),
                      ),
                      onChanged: (val) {
                        setState(() {
                          _ageHasError = !(_formKey.currentState?.fields['age']
                                  ?.validate() ??
                              false);
                        });
                      },
                      // valueTransformer: (text) => num.tryParse(text),
//                       validator: FormBuilderValidators.compose([
//                         FormBuilderValidators.required(),
//                         FormBuilderValidators.numeric(),
//                         FormBuilderValidators.max(70),
//                       ]),
//                    initialValue: '12',
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                    ),
                    FormBuilderDropdown<String>(
                      // autovalidate: true,
                      name: 'gender',
                      decoration: InputDecoration(
                        labelText: 'Gender',
                        suffix: _genderHasError
                            ? const Icon(Icons.error)
                            : const Icon(Icons.check),
                        hintText: 'Select Gender',
                      ),
                      // validator: FormBuilderValidators.compose(
                      //     [FormBuilderValidators.required()]),
                      items: genderOptions
                          .map((gender) => DropdownMenuItem(
                                alignment: AlignmentDirectional.center,
                                value: gender,
                                child: Text(gender),
                              ))
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          _genderHasError = !(_formKey
                                  .currentState?.fields['gender']
                                  ?.validate() ??
                              false);
                        });
                      },
                      valueTransformer: (val) => val?.toString(),
                    ),
                    FormBuilderRadioGroup<String>(
                      decoration: const InputDecoration(
                        labelText: 'My chosen language',
                      ),
                      initialValue: null,
                      name: 'best_language',
                      onChanged: _onChanged,
                      // validator: FormBuilderValidators.compose(
                      //     [FormBuilderValidators.required()]),
                      options:
                          ['Dart', 'Kotlin', 'Java', 'Swift', 'Objective-C']
                              .map((lang) => FormBuilderFieldOption(
                                    value: lang,
                                    child: Text(lang),
                                  ))
                              .toList(growable: false),
                      controlAffinity: ControlAffinity.trailing,
                    ),
                    FormBuilderSegmentedControl(
                      decoration: const InputDecoration(
                        labelText: 'Movie Rating (Archer)',
                      ),
                      name: 'movie_rating',
                      // initialValue: 1,
                      // textStyle: TextStyle(fontWeight: FontWeight.bold),
                      options: List.generate(5, (i) => i + 1)
                          .map((number) => FormBuilderFieldOption(
                                value: number,
                                child: Text(
                                  number.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ))
                          .toList(),
                      onChanged: _onChanged,
                    ),
                    FormBuilderSwitch(
                      title: const Text('I Accept the terms and conditions'),
                      name: 'accept_terms_switch',
                      initialValue: true,
                      onChanged: _onChanged,
                    ),
                    FormBuilderCheckboxGroup<String>(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                          labelText: 'The language of my people'),
                      name: 'languages',
                      // initialValue: const ['Dart'],
                      options: const [
                        FormBuilderFieldOption(value: 'Dart'),
                        FormBuilderFieldOption(value: 'Kotlin'),
                        FormBuilderFieldOption(value: 'Java'),
                        FormBuilderFieldOption(value: 'Swift'),
                        FormBuilderFieldOption(value: 'Objective-C'),
                      ],
                      onChanged: _onChanged,
                      separator: const VerticalDivider(
                        width: 10,
                        thickness: 5,
                        color: Colors.red,
                      ),
                      // validator: FormBuilderValidators.compose([
                      //   FormBuilderValidators.minLength(1),
                      //   FormBuilderValidators.maxLength(3),
                      // ]),
                    ),
                    FormBuilderFilterChip<String>(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                          labelText: 'The language of my people'),
                      name: 'languages_filter',
                      selectedColor: Colors.red,
                      options: const [
                        FormBuilderChipOption(
                          value: 'Dart',
                          avatar: CircleAvatar(child: Text('D')),
                        ),
                        FormBuilderChipOption(
                          value: 'Kotlin',
                          avatar: CircleAvatar(child: Text('K')),
                        ),
                        FormBuilderChipOption(
                          value: 'Java',
                          avatar: CircleAvatar(child: Text('J')),
                        ),
                        FormBuilderChipOption(
                          value: 'Swift',
                          avatar: CircleAvatar(child: Text('S')),
                        ),
                        FormBuilderChipOption(
                          value: 'Objective-C',
                          avatar: CircleAvatar(child: Text('O')),
                        ),
                      ],
                      onChanged: _onChanged,
                      // validator: FormBuilderValidators.compose([
                      //   FormBuilderValidators.minLength(1),
                      //   FormBuilderValidators.maxLength(3),
                      // ]),
                    ),
                    FormBuilderChoiceChip<String>(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                          labelText:
                              'Ok, if I had to choose one language, it would be:'),
                      name: 'languages_choice',
                      initialValue: 'Dart',
                      options: const [
                        FormBuilderChipOption(
                          value: 'Dart',
                          avatar: CircleAvatar(child: Text('D')),
                        ),
                        FormBuilderChipOption(
                          value: 'Kotlin',
                          avatar: CircleAvatar(child: Text('K')),
                        ),
                        FormBuilderChipOption(
                          value: 'Java',
                          avatar: CircleAvatar(child: Text('J')),
                        ),
                        FormBuilderChipOption(
                          value: 'Swift',
                          avatar: CircleAvatar(child: Text('S')),
                        ),
                        FormBuilderChipOption(
                          value: 'Objective-C',
                          avatar: CircleAvatar(child: Text('O')),
                        ),
                      ],
                      onChanged: _onChanged,
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.saveAndValidate() ?? false) {
                          debugPrint(_formKey.currentState?.value.toString());
                        } else {
                          debugPrint(_formKey.currentState?.value.toString());
                          debugPrint('validation failed');
                        }
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        _formKey.currentState?.reset();
                      },
                      // color: Theme.of(context).colorScheme.secondary,
                      child: Text(
                        'Reset',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



