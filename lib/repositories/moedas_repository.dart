import 'package:BlueChain/models/moeda.dart';

class MoedaRepository {
  static List<Moeda> tabela = [
    Moeda(
      icone: 'images/bitcoin.png',
      nome: 'Bitcoin',
      sigla: 'BTC',
      preco: 164603.00,
    ),
    Moeda(
      icone: 'images/ethereum.png',
      nome: 'Ethereum',
      sigla: 'ETH',
      preco: 9716.00,
    ),
    Moeda(
      icone: 'images/xrp.png', 
      nome: 'XRP', 
      sigla: 'XRP', 
      preco: 3.34,
    ),
    Moeda(
      icone: 'images/cardano.png',
      nome: 'Cordano',
      sigla: 'ADA',
      preco: 6.32,
    ),
    Moeda(
      icone: 'images/usdcoin.png',
      nome: 'USD Coin',
      sigla: 'USDC',
      preco: 5.02,
    ),
    Moeda(
      icone: 'images/litecoin.png',
      nome: 'Litecoin',
      sigla: 'LTC',
      preco: 669.93,
    ),
    Moeda(
      icone: 'images/solana.png',
      nome: 'Solana',
      sigla: 'SOL',
      preco: 586.20,
    ),
    Moeda(
      icone: 'images/dogecoin.png',
      nome: 'Dogecoin',
      sigla: 'DOGE',
      preco: 0.38,
    ),
    Moeda(
      icone: 'images/shiba.png',
      nome: 'Shiba Inu',
      sigla: 'SHIB',
      preco: 0.000038,
    ),
    Moeda(
      icone: 'images/tron.png',
      nome: 'TRON',
      sigla: 'TRX',
      preco: 0.56,
    ),
    Moeda(
      icone: 'images/avalanche.png',
      nome: 'Avalanche',
      sigla: 'AVAX',
      preco: 150.90,
    ),
  ];
}
