import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mops_wallet_core/mops_wallet_core.dart';

void main() {
  test('get ', () async {
    final walletManager = WalletManager();
    String mne = walletManager.generateMnemonic();
    bool success = walletManager.validateMnemonic(mne);
    expect(success, true);
  });
}

createWallet(String name) async {
  final walletManager = WalletManager();
  final walletCreate = WalletCreate();
  String mne = walletManager.generateMnemonic();
  bool success = walletManager.validateMnemonic(mne);
  if (!success) {
    debugPrint('Your Mnemonic is not valid');
  }
  Wallets wallet = await walletCreate.createWallet(name, mne);
  return wallet;
}

importWallet(String name, String mne) async {
  final walletManager = WalletManager();
  final walletCreate = WalletCreate();
  bool success = walletManager.validateMnemonic(mne);
  if (!success) {
    debugPrint('Your Mnemonic is not valid');
  }
  Wallets wallet = await walletCreate.createWallet(name, mne);
  return wallet;
}
