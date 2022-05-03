import 'package:expenses/components/adaptative_date_picker.dart';
import 'package:expenses/components/adaptative_button.dart';
import 'package:flutter/material.dart';

import 'adaptative_text_field.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit) {
    print('Constructor TransactionForm');
  }

  @override
  _TransactionFormState createState() {
    print('createState() TransactionForm');
    return _TransactionFormState();
  }
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _seletedDate = DateTime.now();

  _TransactionFormState() {
    print('Constructor _TransactionFormState');
  }


  @override
  void initState() {
    super.initState();
    print('initState() _TransactionFormState');
  }

  @override
  void didUpdateWidget(Widget oldWidget)  {
    super.didUpdateWidget(oldWidget as TransactionForm);
    // widget. aqui podemos acessar o elemento atual para comparar alguma informação.
    print('didUpdateWidget() _TransactionFormState');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose() _TransactionFormState');
  }

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0 || _seletedDate == null) {
      return;
    }

    widget.onSubmit(title, value, _seletedDate);
  }

  @override
  Widget build(BuildContext context) {
    print('build() _TransactionFormState');
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10,
          ),
          child: Column(
            children: [
              AdaptativeTextField(
                controller: _titleController,
                onSubmitted: (_) => _submitForm,
                label: 'Título',
              ),
              AdaptativeTextField(
                controller: _valueController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitForm,
                label: 'Valor (R\$)',
              ),
              AdaptativeDatePicker(
                selectedDate: _seletedDate,
                onDateChanged: (newDate) {
                  setState(() {
                    _seletedDate = newDate;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AdaptativeButton(
                    label: 'Nova Transação',
                    onPressed: _submitForm,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
