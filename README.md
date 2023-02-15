<head>

<title>Mops Wallet core</title>




<meta name="google-site-verification" content="3DzEdBE4aebRdPgDP0Ad4pB2rvRaAR9cqJdiR-WyQjM" />
</head>
<p align="center">
    <img src="https://raw.githubusercontent.com/MyoThuHtay/MyoThuHtay/1b90bb08016310e07d88b9b3a481997fb39f356d/mops.png"
        height="100">
</p>
<br>
<br>
 

## Features
<p align="left">
    Create Wallet for BTC,LTC,ETC,ETH,BSC,POLYGON,AION,POA,THETA,VET,CALLISTO(CLO),TOMO,THUNDER TOKEN,GO CHAIN,WAN CHAIN,VIACOIN,GRS,DIGIBYTE And more will coming...
</p>

## Getting started


#### To use the package
<p align="left">
Add the package to your project

```yaml
  dependencies:
    flutter:
        sdk: flutter
    mops_wallet_core: ^0.0.1
```
<p>  And you can use the package by adding the following line</p>
    
```dart
import 'package:mops_wallet_core/mops_wallet_core.dart';
```
</p>

## Usage

#### Example Usage for Creating Wallet
```dart
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
```
#### Example Usage for Importing Wallet
```dart
createWallet(String name,String mne) async {
  final walletManager = WalletManager();
  final walletCreate = WalletCreate();
  bool success = walletManager.validateMnemonic(mne);
  if (!success) {
    debugPrint('Your Mnemonic is not valid');
  }
  Wallets wallet = await walletCreate.createWallet(name, mne);
  return wallet;
}
```




