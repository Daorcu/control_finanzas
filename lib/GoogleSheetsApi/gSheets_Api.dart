// ignore_for_file: file_names

import 'package:gsheets/gsheets.dart';

class GoogleSheetsApi {
  static const _credentials = '';

  // Conexión con la hoja de cálculo
  static const _spreadsheetId = '';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _worksheet;

  // Variables para ocupar
  static int numeroDeTransacciones = 0;
  static List<List<dynamic>> currentTransactions = [];
  static bool loading = true;

  // Inicialización de hoja de cálculo
  Future init() async {
    final ss = await _gsheets.spreadsheet(_spreadsheetId);
    _worksheet = ss.worksheetByTitle('Worksheet1');
    countRows();
  }

  // Número de notas
  static Future countRows() async {
    while ((await _worksheet!.values
            .value(column: 1, row: numeroDeTransacciones + 1)) !=
        '') {
      numeroDeTransacciones++;
    }

    // Cargar cuántas notas cargar
    loadTransactions();
  }

  // Cargar notas existentes en hoja de cálculo
  static Future loadTransactions() async {
    if (_worksheet == null) return;

    for (int i = 1; i < numeroDeTransacciones; i++) {
      final String transactionName =
          await _worksheet!.values.value(column: 1, row: i + 1);
      final String transactionAmount =
          await _worksheet!.values.value(column: 2, row: i + 1);
      final String transactionType =
          await _worksheet!.values.value(column: 3, row: i + 1);

      if (currentTransactions.length < numeroDeTransacciones) {
        currentTransactions.add([
          transactionName,
          transactionAmount,
          transactionType,
        ]);
      }
    }
    print(currentTransactions);
    // this will stop the circular loading indicator
    loading = false;
  }
}
