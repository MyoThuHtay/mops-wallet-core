import 'package:flutter_test/flutter_test.dart';

import 'package:mops_wallet_core/mops_wallet_core.dart';

void main() {
  test('get ', () {
    final wallet = MopsWalletCore();
    String mne = wallet.generateMnemonic();
    bool success = wallet.validateMnemonic(mne);
    bool failure = wallet.validateMnemonic('${mne}test');
    expect(success, true);
    expect(failure, false);
  });
}
