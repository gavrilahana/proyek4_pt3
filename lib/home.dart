// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'supplemental/asymmetric_view.dart';

import 'model/product.dart';
import 'model/products_repository.dart';

class HomePage extends StatelessWidget {
  final Category category;

  const HomePage({this.category = Category.all, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: AsymmetricView(
              products: ProductsRepository.loadProducts(category),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.grey[200],
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    '© 2024 StyleSync --'
                    'by Gavrila Hana Simanjuntak (221511011)',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
    // // TODO: Pass Category variable to AsymmetricView (104)
    // return Scaffold(
    //   // TODO: Add app bar (102)vv
    //   appBar: AppBar( //membuat tampilan mjd apk mobile
    //   // TODO: Add buttons and title (102)
    //   leading: IconButton( //button utama
    //   icon: const Icon(
    //     Icons.menu,
    //     semanticLabel: 'menu',
    //   ),
    //   onPressed: () {
    //     print('Menu button');
    //   },
    // ),
    //   title: const Text('StyleSync'), //membuat judul di atas
    //   // TODO: Add trailing buttons (102)
    //   actions: <Widget>[ //menambahkan tindakan ada setting dan search di atas
    //     IconButton(
    //       icon: const Icon(
    //         Icons.search,
    //         semanticLabel: 'search',
    //       ),
    //       onPressed: () {
    //         print('Search button');
    //       },
    //     ),
    //     IconButton(
    //       icon: const Icon(
    //         Icons.tune,
    //         semanticLabel: 'filter',
    //       ),
    //       onPressed: () {
    //         print('Filter button');
    //       },
    //     ),
    //   ],
    //   ),
    //   // TODO: Add a grid view (102)vv
    //   body: AsymmetricView(
    //     products: ProductsRepository.loadProducts(Category.all),
    //   ),
    // );

        // TODO: Build a grid of cards (102)vv
        // TODO: Make a collection of cards (102)

        // Replace this entire method
        List<Card> _buildGridCards(BuildContext context) {
  List<Product> products = ProductsRepository.loadProducts(Category.all);

  if (products.isEmpty) {
    return const <Card>[];
  }

  final ThemeData theme = Theme.of(context);
  final NumberFormat formatter = NumberFormat.simpleCurrency(locale: 'id_ID');

  return products.map((product) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0.0,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        opacity: 1.0, // Sesuaikan dengan nilai yang sesuai, misalnya 0.0 untuk efek fade in
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      product.name,
                      style: theme.textTheme.button,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      formatter.format(product.price),
                      style: theme.textTheme.caption,
                    ),
                    SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        // Tindakan saat tombol ditekan
                      },
                      child: Text('Beli'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }).toList();
}
